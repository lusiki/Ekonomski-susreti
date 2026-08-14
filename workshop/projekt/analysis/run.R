# Jedna naredba gradi sve.
#
#   Rscript analysis/run.R
#
# Redoslijed je namjerno linearan i citljiv:
#   podaci -> procjene -> slike -> JSON -> provjere -> rukopis
#
# Provjere stoje izmedu brojeva i teksta. Ako neka padne, rukopis se ne gradi.

for (f in list.files("R", pattern = "[.]R$", full.names = TRUE)) source(f)
source("tests/checks.R")

set.seed(SJEME)
cat("== Gradnja =================================================\n")

# 1. Podaci
d <- izgradi_panel()
zapisi_panel(d)
cat("  podaci: ", nrow(d), " opazanja, ", length(unique(d$geo)),
    " zemalja, ", min(d$god), " do ", max(d$god), "\n", sep = "")

# 2. Procjene
m_zemlje  <- model_zemlje(d)
m_oba     <- model_zemlje_godine(d)
m_prije   <- model_razdoblje(d, "prije")
m_poslije <- model_razdoblje(d, "poslije")
cat("  procjene: nagib =", signif(nagib(m_zemlje)$beta, 3),
    "| uz fiksne ucinke godine =", signif(nagib(m_oba)$beta, 3), "\n")

# 3. Slike
dir.create(PUT_SLIKE, recursive = TRUE, showWarnings = FALSE)
invisible(slika_vrijeme(d, file.path(PUT_SLIKE, "slika1-vrijeme.png")))
invisible(slika_phillips(d, file.path(PUT_SLIKE, "slika2-phillips.png")))
cat("  slike: 2 zapisane u", PUT_SLIKE, "\n")

# 4. Svi brojevi na jedno mjesto
procjene <- skupi_procjene(d, m_zemlje, m_oba, m_prije, m_poslije)
cat("  brojevi:", PUT_PROCJENE, "\n")

# 5. Provjere prije rukopisa
cat("== Provjere ================================================\n")
provjere(d)

# 6. Rukopis
cat("== Rukopis =================================================\n")
status <- system2("quarto", c("render", "paper/nalaz.qmd"),
                  stdout = TRUE, stderr = TRUE)
if (!is.null(attr(status, "status")) && attr(status, "status") != 0) {
  cat(paste(status, collapse = "\n"), "\n")
  stop("Rukopis se nije izgradio.", call. = FALSE)
}
cat("  rukopis: paper/nalaz.html\n")

cat("== OK: sve izgradeno i provjereno ==========================\n")
