# Jedna naredba gradi sve.
#
#   Rscript analysis/run.R
#
# Redoslijed je namjerno linearan i citljiv:
#   podaci -> procjene -> slike -> JSON -> provjere -> rukopis

for (f in list.files("R", pattern = "[.]R$", full.names = TRUE)) source(f)
source("tests/checks.R")

set.seed(SJEME)
cat("== Gradnja =================================================\n")

# 1. Podaci
panel   <- ucitaj_panel()
naslovi <- ucitaj_naslove()
d <- izgradi_okvir(panel, naslovi)
attr(d, "n_naslova") <- nrow(naslovi)
cat("  podaci:", nrow(d), "tjedana,", nrow(naslovi), "naslova\n")

# 2. Procjene
glavni  <- model_glavni(d)
margine <- model_margine(d)
lp      <- lokalne_projekcije(d)
cat("  procjene: beta_pi =", signif(glavni$test["pi", 1], 3), "\n")

# 3. Slike
dir.create(PUT_SLIKE, recursive = TRUE, showWarnings = FALSE)
invisible(slika_jaz(d, file.path(PUT_SLIKE, "slika1-jaz.png")))
invisible(slika_projekcije(lp, file.path(PUT_SLIKE, "slika2-projekcije.png")))
cat("  slike: 2 zapisane u", PUT_SLIKE, "\n")

# 4. Brojevi na jedno mjesto
procjene <- skupi_procjene(d, glavni, margine, lp)
write.csv(lp, "results/projekcije.csv", row.names = FALSE)
cat("  brojevi:", PUT_PROCJENE, "\n")

# 5. Provjere prije rukopisa
cat("== Provjere ================================================\n")
provjere(d)

# 6. Rukopis
cat("== Rukopis =================================================\n")
status <- system2("quarto", c("render", "paper/nalaz.qmd"), stdout = TRUE, stderr = TRUE)
if (!is.null(attr(status, "status")) && attr(status, "status") != 0) {
  cat(paste(status, collapse = "\n"), "\n")
  stop("Rukopis se nije izgradio.", call. = FALSE)
}
cat("  rukopis: paper/nalaz.html\n")

cat("== OK: sve izgradeno i provjereno ==========================\n")
