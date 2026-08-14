# MJERNI SLOJ
#
# Ovdje se odlucuje sto je zemlja, a sto nije. Eurostatov izvoz u
# data/raw/ sadrzi 45 razlicitih oznaka, a samo dvadeset njih su zemlje
# europodrucja. Ostalo su agregati poput EA20 i EU27_2020 te zemlje izvan
# europodrucja poput US i TR.
#
# Ovaj korak nema model i nema regresiju, pa izgleda bezopasno. Nije.
# Svaka greska ovdje putuje ravno u koeficijent, a nista ne pukne.
# Zato ima vlastitu provjeru u tests/checks.R.
#
# Dvije zamke koje su ovdje stvarne:
#
#   1. Grcka je u Eurostatu EL, a ne GR. Tko filtrira po GR, tiho izgubi
#      cijelu zemlju. Panel i dalje izgleda uredno, samo je manji.
#   2. Agregati EA20, EU27_2020 i slicni izgledaju kao obicni redci. Udu
#      li u panel, prosjek ulazi kao da je zemlja i vuce procjenu.

# Dvadeset clanica europodrucja, u Eurostatovim oznakama.
# Hrvatska je u europodrucju od 1. sijecnja 2023., ali je u uzorku cijelo
# vrijeme jer nas zanima usporediva skupina gospodarstava.
ZEMLJE <- c(
  "AT", "BE", "CY", "DE", "EE", "EL", "ES", "FI", "FR", "HR",
  "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PT", "SI", "SK"
)

# Puna imena za slike i tekst.
IMENA <- c(
  AT = "Austrija",   BE = "Belgija",  CY = "Cipar",     DE = "Njemačka",
  EE = "Estonija",   EL = "Grčka",    ES = "Španjolska", FI = "Finska",
  FR = "Francuska",  HR = "Hrvatska", IE = "Irska",     IT = "Italija",
  LT = "Litva",      LU = "Luksemburg", LV = "Latvija", MT = "Malta",
  NL = "Nizozemska", PT = "Portugal", SI = "Slovenija", SK = "Slovačka"
)

# Oznake koje nisu zemlje. Drze se izdvojeno da ih se moze imenovati u
# provjeri, umjesto da se u kodu tiho oslanjamo na to da ih nema.
AGREGATI <- c("EA", "EA11", "EA12", "EA13", "EA15", "EA16", "EA17",
              "EA18", "EA19", "EA20", "EU", "EU27_2020", "EU28",
              "EEA", "EFTA")

# Zadrzi samo redke koji su zemlje europodrucja i unutar uzorka.
# Vraca podskup, nikad ne mijenja vrijednosti.
odaberi_zemlje <- function(d) {
  stopifnot(all(c("geo", "god") %in% names(d)))
  d <- d[!d$geo %in% AGREGATI, ]
  d <- d[d$geo %in% ZEMLJE, ]
  d <- d[d$god >= GODINA_OD & d$god <= GODINA_DO, ]
  d[order(d$geo, d$god), ]
}
