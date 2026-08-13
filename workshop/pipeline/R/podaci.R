# Od sirovih naslova i tjednih agregata do analitickog okvira.
#
# Lanac je namjerno kratak i vidljiv:
#   naslovi -> pravilo pretrage -> n_hnb -> udjeli -> IAG -> regresija

ucitaj_panel <- function(put = PUT_PANEL) {
  d <- read.csv(put, stringsAsFactors = FALSE, encoding = "UTF-8")
  d$tjedan <- as.Date(d$tjedan)
  d[order(d$tjedan), ]
}

ucitaj_naslove <- function(put = PUT_NASLOVI) {
  d <- read.csv(put, stringsAsFactors = FALSE, encoding = "UTF-8")
  d$tjedan <- as.Date(d$tjedan)
  d
}

# IAG = bazna razina vidljivosti minus stvarna vidljivost.
# Pozitivne vrijednosti znace da HNB dobiva manje paznje nego u baznom razdoblju.
izgradi_okvir <- function(panel, naslovi, razina = "R2") {
  broj <- prebroji_hnb(naslovi, razina)
  d <- merge(panel, broj, by = "tjedan", all.x = TRUE)
  d <- d[order(d$tjedan), ]
  d$n_hnb[is.na(d$n_hnb)] <- 0

  # Ponderiran udio: doseg objava o HNB-u u ukupnom dosegu inflacijskog diskursa.
  d$udio      <- (d$n_hnb * d$doseg_hnb) / (d$n_infl * d$doseg_infl + 1)
  d$udio_ext  <- d$n_hnb / d$n_infl                       # ekstenzivna margina
  d$udio_int  <- d$doseg_hnb / d$doseg_infl               # intenzivna margina

  bazno <- seq_len(BAZNI_TJEDNI)
  d$iag      <- mean(d$udio[bazno])     - d$udio
  d$iag_ext  <- mean(d$udio_ext[bazno]) - d$udio_ext
  d$iag_int  <- mean(d$udio_int[bazno]) - d$udio_int

  d$log_vol <- log(d$n_hnb + 1)
  d
}
