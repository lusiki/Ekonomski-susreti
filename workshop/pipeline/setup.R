# Priprema okruzenja.
#
#   Rscript setup.R
#
# Sljedeca precka na ljestvici bila bi renv::init() i zakljucan renv.lock.
# Ovdje je namjerno minimalno: provjeri sto nedostaje i instaliraj.

paketi <- c("ggplot2", "jsonlite", "sandwich", "lmtest", "knitr", "rmarkdown")
nedostaju <- setdiff(paketi, rownames(installed.packages()))

if (length(nedostaju)) {
  cat("Instaliram:", paste(nedostaju, collapse = ", "), "\n")
  install.packages(nedostaju, repos = "https://cloud.r-project.org")
} else {
  cat("Svi paketi su prisutni.\n")
}

cat("\nR:", R.version.string, "\n")
for (p in paketi) {
  cat(sprintf("  %-12s %s\n", p, as.character(packageVersion(p))))
}

quarto <- Sys.which("quarto")
cat("\nquarto:", if (nzchar(quarto)) quarto else "NIJE PRONADEN", "\n")
cat("\nSljedece:  Rscript analysis/run.R\n")
