# Podmetanje gresaka za demonstraciju na radionici.
#
#   Rscript demo/podmetni.R          # sve tri
#   Rscript demo/podmetni.R 3        # samo trecu
#
# Tri greske, po jedna za svaki nacin na koji agent tiho ostecuje projekt:
#
#   1. CURENJE     redak iz data/restricted/ zalijepljen u rukopis
#   2. ODSTUPANJE  koeficijent upisan rukom umjesto procitan iz koda
#   3. POKRIVENOST Grcka je u mjernom sloju oznacena kao GR umjesto EL
#
# Treca je najtisa. Panel izgubi jednu zemlju i jedanaest redaka, nagib se
# pomakne, a nista ne pukne. Kod se izvrsi, slike se nacrtaju, tekst se
# sastavi. Samo je rezultat drugaciji nego sto mislite.
#
# Sve promjene se zapisuju u demo/.backup/ i vracaju s:
#   Rscript demo/vrati.R

arg  <- commandArgs(trailingOnly = TRUE)
koje <- if (length(arg)) as.integer(arg) else 1:3

dir.create("demo/.backup", showWarnings = FALSE)
snimi <- function(put) {
  cilj <- file.path("demo/.backup", gsub("[/\\]", "_", put))
  if (!file.exists(cilj)) file.copy(put, cilj)
}

# --- 1. CURENJE ------------------------------------------------------------
if (1 %in% koje) {
  put <- "paper/nalaz.qmd"
  snimi(put)
  r <- readLines(put, warn = FALSE, encoding = "UTF-8")
  redak <- readLines("data/restricted/kucanstva_uzorak.csv",
                     warn = FALSE, encoding = "UTF-8")[2]
  # Umece se u odjeljak Ogranicenja, a ne u Rezultate, da svaka od tri
  # greske padne na tocno jednoj provjeri.
  i <- grep("^## Ogranicenja|^## Ograničenja", r)[1]
  r <- append(r, c("", paste("Primjer opazanja iz mikropodataka:", redak), ""),
              after = i)
  writeLines(r, put, useBytes = TRUE)
  cat("podmetnuto 1: curenje ogranicenog sadrzaja u paper/nalaz.qmd\n")
}

# --- 2. ODSTUPANJE ---------------------------------------------------------
if (2 %in% koje) {
  put <- "paper/nalaz.qmd"
  snimi(put)
  r <- readLines(put, warn = FALSE, encoding = "UTF-8")
  r <- sub("`r hr\\(abs\\(p\\$beta\\), 2\\)` postotna boda",
           "0,45 postotna boda", r, fixed = FALSE)
  writeLines(r, put, useBytes = TRUE)
  cat("podmetnuto 2: rucno upisan koeficijent 0,45 u odjeljku Rezultati\n")
}

# --- 3. POKRIVENOST --------------------------------------------------------
if (3 %in% koje) {
  put <- "R/zemlje.R"
  snimi(put)
  r <- readLines(put, warn = FALSE, encoding = "UTF-8")
  r <- sub('"EE", "EL", "ES"', '"EE", "GR", "ES"', r, fixed = TRUE)
  writeLines(r, put, useBytes = TRUE)
  cat("podmetnuto 3: Grcka oznacena kao GR umjesto EL u R/zemlje.R\n")
}

cat("\nPokrenite:  Rscript analysis/run.R\n")
