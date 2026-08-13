# Podmetanje gresaka za demonstraciju.
#
#   Rscript demo/podmetni.R          # sve tri
#   Rscript demo/podmetni.R 2        # samo drugu
#
# Tri greske, po jedna za svaki stup radionice:
#   1. CURENJE     — ogranicen sadrzaj zalijepljen u rukopis   (otvoreno)
#   2. ODSTUPANJE  — koeficijent upisan rukom u tekst          (reproducibilno)
#   3. POKRIVENOST — normalizacija dijakritike ispala iz pravila (mjerenje/AI)
#
# Repozitorij se vraca u cisto stanje s:  Rscript demo/vrati.R

arg <- commandArgs(trailingOnly = TRUE)
koje <- if (length(arg)) as.integer(arg) else 1:3

dir.create("demo/.backup", showWarnings = FALSE)
snimi <- function(put) {
  cilj <- file.path("demo/.backup", gsub("[/\\]", "_", put))
  if (!file.exists(cilj)) file.copy(put, cilj)
}

# --- 1. CURENJE ----------------------------------------------------------
if (1 %in% koje) {
  put <- "paper/nalaz.qmd"
  snimi(put)
  r <- readLines(put, warn = FALSE, encoding = "UTF-8")
  ogranicen <- readLines("data/restricted/korpus_uzorak.txt",
                         warn = FALSE, encoding = "UTF-8")[1]
  i <- grep("^## Ogranicenja|^## Ograničenja", r)[1]
  r <- append(r, c("", paste("Izvadak iz izvornog korpusa:", ogranicen), ""),
              after = i - 1)
  writeLines(r, put, useBytes = TRUE)
  cat("podmetnuto 1: curenje ogranicenog sadrzaja u paper/nalaz.qmd\n")
}

# --- 2. ODSTUPANJE -------------------------------------------------------
if (2 %in% koje) {
  put <- "paper/nalaz.qmd"
  snimi(put)
  r <- readLines(put, warn = FALSE, encoding = "UTF-8")
  r <- sub("`r hr\\(p\\$beta_pi, 5\\)` jedinica", "0,00243 jedinica", r)
  writeLines(r, put, useBytes = TRUE)
  cat("podmetnuto 2: rucno upisan koeficijent 0,00243 u odjeljku Rezultati\n")
}

# --- 3. POKRIVENOST ------------------------------------------------------
if (3 %in% koje) {
  put <- "R/korpus.R"
  snimi(put)
  r <- readLines(put, warn = FALSE, encoding = "UTF-8")
  r <- sub("^  for \\(znak in names\\(zamjene\\)\\).*$",
           "  # for (znak in names(zamjene)) x <- gsub(znak, zamjene[[znak]], x, fixed = TRUE)",
           r)
  writeLines(r, put, useBytes = TRUE)
  cat("podmetnuto 3: normalizacija dijakritike iskljucena u R/korpus.R\n")
}

cat("\nPokrenite:  Rscript analysis/run.R\n")
