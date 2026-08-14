# Preuzimanje podataka s Eurostata.
#
#   Rscript data/preuzmi.R
#
# Ova skripta trazi internet i paket eurostat. Pokrece se rijetko, kada
# zelite osvjeziti uzorak. Rezultat su dvije datoteke u data/raw/ koje su
# zapisane u repozitoriju, pa analysis/run.R radi bez interneta.
#
# To je namjerno. Ako gradnja rezultata ovisi o mrezi, onda vam rezultat
# ovisi o tome sto je Eurostat objavio tog jutra.
#
# Tablice:
#   prc_hicp_aind   harmonizirani indeks potrosackih cijena, godisnja
#                   prosjecna stopa promjene, svi proizvodi
#   une_rt_a        stopa nezaposlenosti, dob 15 do 74, oba spola,
#                   posto radne snage

if (!requireNamespace("eurostat", quietly = TRUE)) {
  stop("Nedostaje paket eurostat. Instalirajte ga s install.packages(\"eurostat\").",
       call. = FALSE)
}

source("R/config.R")

pripremi <- function(x, ime) {
  x <- as.data.frame(x)
  x$god <- as.integer(format(x$time, "%Y"))
  x <- x[x$god >= GODINA_OD & x$god <= GODINA_DO, c("geo", "god", "values")]
  names(x) <- c("geo", "god", ime)
  x <- x[!is.na(x[[ime]]), ]
  x[order(x$geo, x$god), ]
}

cat("Preuzimam prc_hicp_aind ...\n")
hicp <- eurostat::get_eurostat(
  "prc_hicp_aind",
  filters = list(coicop = "CP00", unit = "RCH_A_AVG")
)

cat("Preuzimam une_rt_a ...\n")
nezap <- eurostat::get_eurostat(
  "une_rt_a",
  filters = list(sex = "T", age = "Y15-74", unit = "PC_ACT")
)

hicp  <- pripremi(hicp,  "inflacija")
nezap <- pripremi(nezap, "nezaposlenost")

# Namjerno se zapisuje SVE sto Eurostat vrati, ukljucujuci agregate poput
# EA20 i zemlje izvan europodrucja. Odabir zemalja je posao mjernog sloja
# u R/zemlje.R, a ne posao preuzimanja. Tako se odabir moze provjeriti.
write.csv(hicp,  PUT_HICP,  row.names = FALSE)
write.csv(nezap, PUT_NEZAP, row.names = FALSE)

cat("\n", PUT_HICP,  ": ", nrow(hicp),  " redaka, ",
    length(unique(hicp$geo)),  " oznaka\n", sep = "")
cat(PUT_NEZAP, ": ", nrow(nezap), " redaka, ",
    length(unique(nezap$geo)), " oznaka\n", sep = "")
cat("\nSljedece:  Rscript analysis/run.R\n")
