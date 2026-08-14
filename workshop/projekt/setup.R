# Priprema okruzenja.
#
#   Rscript setup.R
#
# Namjerno minimalno: provjeri sto nedostaje i instaliraj. Sljedeci korak
# u ozbiljnijem projektu bio bi renv::init() i zakljucan renv.lock.

paketi <- c("ggplot2", "jsonlite", "knitr", "rmarkdown")

# eurostat treba samo za data/preuzmi.R. Podaci su vec u repozitoriju, pa
# projekt radi i bez njega.
neobavezni <- c("eurostat")

nedostaju <- setdiff(paketi, rownames(installed.packages()))
if (length(nedostaju)) {
  cat("Instaliram:", paste(nedostaju, collapse = ", "), "\n")
  install.packages(nedostaju, repos = "https://cloud.r-project.org")
} else {
  cat("Svi obavezni paketi su prisutni.\n")
}

cat("\nR:", R.version.string, "\n")
for (p in paketi) {
  cat(sprintf("  %-12s %s\n", p, as.character(packageVersion(p))))
}
for (p in neobavezni) {
  ima <- p %in% rownames(installed.packages())
  cat(sprintf("  %-12s %s\n", p,
              if (ima) as.character(packageVersion(p)) else "nema (neobavezno)"))
}

quarto <- Sys.which("quarto")
cat("\nquarto:", if (nzchar(quarto)) quarto else "NIJE PRONADEN", "\n")
cat("\nSljedece:  Rscript analysis/run.R\n")
