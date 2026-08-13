# Pravilo pretrage: koje objave ulaze u korpus o HNB-u.
#
# Ovo je mjerni sloj. Zavisna varijabla (IAG) izvedena je iz njega, pa
# svaka greska ovdje putuje ravno u koeficijent. Zato ima vlastitu provjeru.

# Normalizacija hrvatskih dijakritickih znakova.
# Portali pisu i "Vujcic" i "Vujcic", i "sredisnja" i "sredisnja".
# Bez ovog koraka pravilo tiho gubi dio korpusa.
normaliziraj <- function(x) {
  x <- tolower(x)
  zamjene <- c("č" = "c", "ć" = "c", "ž" = "z",
               "š" = "s", "đ" = "d")
  for (znak in names(zamjene)) x <- gsub(znak, zamjene[[znak]], x, fixed = TRUE)
  x
}

# Tri razine korpusa, kao u radu (Tablica 1).
KLAUZULE <- list(
  R1 = "hrvatsk\\w* narodn\\w* bank\\w*|\\bhnb\\b",
  R2 = "(sredisnj|centraln)\\w* bank\\w*",
  R3 = "vujcic|guverner\\w*"
)

# Vrati logicki vektor: je li naslov objava o HNB-u na zadanoj razini.
o_hnb <- function(naslov, razina = "R2") {
  stopifnot(razina %in% c("R1", "R2", "R3"))
  tekst <- normaliziraj(naslov)
  koje  <- switch(razina,
                  R1 = "R1",
                  R2 = c("R1", "R2"),
                  R3 = c("R1", "R2", "R3"))
  uzorak <- paste(unlist(KLAUZULE[koje]), collapse = "|")
  grepl(uzorak, tekst, perl = TRUE)
}

# Tjedni broj objava o HNB-u iz sirovih naslova.
prebroji_hnb <- function(naslovi, razina = "R2") {
  naslovi$hnb <- o_hnb(naslovi$naslov, razina)
  agg <- stats::aggregate(hnb ~ tjedan, data = naslovi, FUN = sum)
  names(agg) <- c("tjedan", "n_hnb")
  agg$tjedan <- as.Date(agg$tjedan)
  agg[order(agg$tjedan), ]
}
