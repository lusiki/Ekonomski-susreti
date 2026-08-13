# Generator demonstracijskih podataka za radionicu.
#
# VAZNO — status podataka.
# Ovo NISU izvorni podaci rada. Izvorni medijski korpus licenciran je i ne
# smije se redistribuirati. Ovdje se generira KALIBRIRANI izvedeni skup:
# tjedne agregate koje ponavljaju objavljene momente rada (157 tjedana,
# putanja HICP-a 2021.-2023., ucinak inflacije na IAG reda 0,002), plus
# sinteticki uzorak naslova na kojem pravilo pretrage stvarno radi.
#
# Zamjena stvarnim podacima: prepisite data/derived/tjedni_panel.csv i
# data/raw/naslovi.csv izvozom iz analitickog projekta. Sheme moraju ostati
# iste — tests/checks.R ih provjerava.
#
# Pokretanje:  Rscript data/make_data.R

source("R/config.R")
set.seed(SJEME)

tjedni <- seq(UZORAK_OD, UZORAK_DO, by = "week")
n <- length(tjedni)
stopifnot(n == 157)

# --- 1. Putanja inflacije (HICP, godisnja stopa) --------------------------
# Kalibrirano na objavljene godisnje prosjeke: 2,7 (2021), 10,7 (2022), 8,4 (2023).
t <- seq_len(n)
pi_glatko <- 1.4 +
  11.6 * exp(-0.5 * ((t - 96) / 34)^2) +   # vrh krajem 2022.
  1.1 * sin(2 * pi * t / 52)
pi_t <- round(pi_glatko + rnorm(n, 0, 0.28), 2)
pi_t <- pmax(pi_t, 0.4)

d_pi <- c(0, round(diff(pi_t), 2))

# --- 2. Obujam diskursa ---------------------------------------------------
# Inflacijski korpus raste s inflacijom; korpus o HNB-u ne prati taj rast.
# Upravo taj raskorak proizvodi jaz u paznji.
# Vlastita komunikacijska aktivnost HNB-a ima i svoju, o inflaciji neovisnu
# dinamiku (AR(1)) — ona je izvor varijacije koji koriste lokalne projekcije.
u <- as.numeric(arima.sim(list(ar = 0.72), n, sd = 0.085))
n_infl     <- round(exp(6.348 + 0.178 * pi_t + rnorm(n, 0, 0.03)))
n_hnb_cilj <- round(exp(3.22 + u))
n_hnb_cilj <- pmax(n_hnb_cilj, 8)

# --- 3. Doseg po objavi ---------------------------------------------------
doseg_infl <- round(exp(7.9 + rnorm(n, 0, 0.12)))
doseg_hnb  <- round(exp(7.95 + rnorm(n, 0, 0.15)))

# --- 4. Sentiment i koncentracija ----------------------------------------
neg <- round(plogis(-0.9 + 0.045 * pi_t + rnorm(n, 0, 0.22)), 4)
hhi <- round(0.061 + 0.0009 * pi_t + rnorm(n, 0, 0.004), 5)

euro <- as.integer(tjedni >= EURO_OD)

# --- 5. Sinteticki naslovi -----------------------------------------------
# Tri skupine, kao tri razine korpusa u radu:
#   R2_dij   — pogodak SAMO ako se dijakriticki znakovi normaliziraju
#   R2_ascii — pogodak i bez normalizacije
#   R3       — samo guverner; ulazi tek na razini R3
# Otprilike polovica stvarnog korpusa pisana je bez dijakritike, pa pravilo
# mora citati oba oblika. Ako normalizacija otpadne, tiho nestane pola korpusa.
pogodak_dij <- c(
  "Središnja banka upozorava na sekundarne učinke inflacije",
  "Središnja banka objavila izvješće o financijskoj stabilnosti",
  "Središnjoj banci stigli novi podaci o kreditima kućanstava",
  "Odluke središnje banke i cijene stambenih kredita",
  "Središnja banka procjenjuje učinke uvođenja eura",
  "Što središnja banka poručuje o inflacijskim očekivanjima"
)
pogodak_ascii <- c(
  "HNB objavio tjedni pregled deviznog trzista",
  "Hrvatska narodna banka o rastu cijena energenata",
  "HNB: pritisak na cijene hrane popusta",
  "Hrvatskoj narodnoj banci stigao novi set podataka",
  "Hrvatske narodne banke tice se i pitanje likvidnosti",
  "HNB: depoziti kucanstava i dalje rastu"
)
pogodak_r3 <- c(
  "Guverner Vujčić o kretanju cijena u idućoj godini",
  "Vujčić: inflacija se vraća prema cilju",
  "Guverner najavio nove mjere za kreditni rast",
  "Guvernerova ocjena inflacijskih očekivanja kućanstava"
)
promasaj <- c(
  "Cijene goriva ponovno rastu na benzinskim postajama",
  "Trgovci najavljuju poskupljenje osnovnih namirnica",
  "Ministarstvo financija objavilo prihode proračuna",
  "Sindikati traže povećanje minimalne plaće",
  "Turistička sezona nadmašila očekivanja",
  "Cijene stanova u Zagrebu nastavile rast",
  "Eurostat objavio nove podatke o zaposlenosti",
  "Poskupljenje električne energije od sljedećeg mjeseca",
  "Analitičari očekuju usporavanje potrošnje",
  "Vlada produljila mjere ograničavanja cijena"
)

redovi <- vector("list", n)
for (i in seq_len(n)) {
  k <- n_hnb_cilj[i]
  n_dij <- rbinom(1, k, 0.5)
  naslovi_i <- c(
    sample(pogodak_dij, n_dij, replace = TRUE),
    sample(pogodak_ascii, k - n_dij, replace = TRUE),
    sample(pogodak_r3, round(k * 0.25), replace = TRUE),
    sample(promasaj, round(k * 0.8), replace = TRUE)
  )
  redovi[[i]] <- data.frame(
    tjedan = tjedni[i],
    naslov = sample(naslovi_i),
    stringsAsFactors = FALSE
  )
}
naslovi <- do.call(rbind, redovi)

# --- 6. Ocekivanja kucanstava --------------------------------------------
# Reagiraju na PROSLE vrijednosti ekstenzivne margine — to je kanal koji
# lokalne projekcije mjere.
udio_ext    <- n_hnb_cilj / n_infl
baza_ext    <- mean(udio_ext[seq_len(BAZNI_TJEDNI)])
iag_ext_pom <- baza_ext - udio_ext

pomak  <- function(x, k) c(rep(NA_real_, k), head(x, -k))
lagovi <- do.call(cbind, lapply(2:12, function(k) pomak(iag_ext_pom, k)))
signal <- rowMeans(lagovi, na.rm = TRUE)
signal[is.nan(signal)] <- 0

ocekivanja <- round(18 + 2.3 * pi_t + 1500 * signal + rnorm(n, 0, 1.8), 2)

# --- 7. Zapis ------------------------------------------------------------
dir.create("data/derived", recursive = TRUE, showWarnings = FALSE)
dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)

panel <- data.frame(
  tjedan       = tjedni,
  n_infl       = n_infl,
  doseg_infl   = doseg_infl,
  doseg_hnb    = doseg_hnb,
  pi           = pi_t,
  d_pi         = d_pi,
  neg          = neg,
  hhi          = hhi,
  euro         = euro,
  ocekivanja   = ocekivanja
)

write.csv(panel, PUT_PANEL, row.names = FALSE, fileEncoding = "UTF-8")
write.csv(naslovi, PUT_NASLOVI, row.names = FALSE, fileEncoding = "UTF-8")

# Manifest: sto je tocno zapisano i kada.
manifest <- c(
  "Izvedeni skup za radionicu — KALIBRIRANI, nije izvorni korpus.",
  paste("sjeme:", SJEME),
  paste("tjedana:", nrow(panel)),
  paste("raspon:", min(tjedni), "-", max(tjedni)),
  paste("naslova u uzorku:", nrow(naslovi)),
  paste("generirano skriptom: data/make_data.R")
)
writeLines(manifest, "data/derived/MANIFEST.txt")

cat("Zapisano:", PUT_PANEL, "i", PUT_NASLOVI, "\n")
cat("Tjedana:", nrow(panel), " naslova:", nrow(naslovi), "\n")
