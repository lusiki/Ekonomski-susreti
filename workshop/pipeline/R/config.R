# Sve konstante projekta na jednom mjestu.
# Pravilo: ako se broj pojavljuje na dva mjesta, jedno od njih je greska.

SJEME        <- 20260813               # jedino sjeme u projektu
UZORAK_OD    <- as.Date("2021-01-04")  # prvi ponedjeljak u uzorku
UZORAK_DO    <- as.Date("2024-01-01")  # zadnji ponedjeljak (157 tjedana)
BAZNI_TJEDNI <- 26                     # bazna razina s-bar: prvih 26 tjedana
EURO_OD      <- as.Date("2023-01-01")  # uvodenje eura
NW_LAG       <- 4                      # Newey-West prozor (tjedni)
LP_HORIZONTI <- 0:12                   # lokalne projekcije, h = 0..12
ALFA         <- 0.05                   # razina znacajnosti prije korekcije

# Ocekivana pokrivenost korpusa u baznom razdoblju: udio objava o HNB-u
# u inflacijskom korpusu. Koristi se u provjeri pokrivenosti (tests/checks.R).
POKRIVENOST_MIN <- 0.015
POKRIVENOST_MAX <- 0.030

PUT_PANEL     <- "data/derived/tjedni_panel.csv"
PUT_NASLOVI   <- "data/raw/naslovi.csv"
PUT_PROCJENE  <- "results/procjene.json"
PUT_SLIKE     <- "results/slike"
