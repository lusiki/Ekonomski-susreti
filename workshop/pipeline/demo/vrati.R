# Vrati repozitorij u cisto stanje nakon demonstracije.
#
#   Rscript demo/vrati.R

kopije <- list.files("demo/.backup", full.names = TRUE)
if (!length(kopije)) {
  cat("Nema sto vratiti — repozitorij je cist.\n")
} else {
  for (k in kopije) {
    cilj <- gsub("_", "/", basename(k))
    file.copy(k, cilj, overwrite = TRUE)
    unlink(k)
    cat("vraceno:", cilj, "\n")
  }
}
cat("\nProvjerite:  Rscript analysis/run.R\n")
