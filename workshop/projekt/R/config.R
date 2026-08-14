# Sve konstante projekta na jednom mjestu.
#
# Pravilo koje drzi cijeli projekt: ako se broj pojavljuje na dva mjesta,
# jedno od ta dva je greska. Zato ovdje.

SJEME <- 20260814

# Uzorak
GODINA_OD <- 2014
GODINA_DO <- 2024

# Prijelom uzorka. Godina 2020. se izostavlja jer je pandemijska godina
# u kojoj se i inflacija i nezaposlenost ponasaju netipicno.
PRIJE_DO  <- 2019
POSLIJE_OD <- 2021

# Ocekivana velicina panela. Dvadeset zemalja europodrucja puta jedanaest
# godina. Provjera pokrivenosti trazi tocno ovoliko redaka.
N_ZEMALJA <- 20
N_GODINA  <- GODINA_DO - GODINA_OD + 1
N_PANEL   <- N_ZEMALJA * N_GODINA

# Putanje
PUT_HICP     <- "data/raw/hicp.csv"
PUT_NEZAP    <- "data/raw/nezaposlenost.csv"
PUT_PANEL    <- "data/derived/panel.csv"
PUT_PROCJENE <- "results/procjene.json"
PUT_SLIKE    <- "results/slike"
