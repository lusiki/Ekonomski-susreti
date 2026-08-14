# Od dva Eurostatova izvoza do jednog analitickog panela.
#
# Lanac je namjerno kratak i citljiv:
#   hicp.csv + nezaposlenost.csv -> odaberi_zemlje() -> spoji -> panel.csv

ucitaj_sirovo <- function(put) {
  d <- read.csv(put, stringsAsFactors = FALSE, encoding = "UTF-8")
  d$god <- as.integer(d$god)
  d
}

# Spoji dvije serije u uravnotezeni panel zemlja puta godina.
izgradi_panel <- function() {
  inf <- odaberi_zemlje(ucitaj_sirovo(PUT_HICP))
  nez <- odaberi_zemlje(ucitaj_sirovo(PUT_NEZAP))

  d <- merge(inf, nez, by = c("geo", "god"))
  d <- d[stats::complete.cases(d), ]
  d$zemlja <- unname(IMENA[d$geo])

  # Razdoblje. Pandemijska 2020. ostaje u panelu, ali izvan oba potuzorka.
  d$razdoblje <- ifelse(d$god <= PRIJE_DO, "prije",
                 ifelse(d$god >= POSLIJE_OD, "poslije", NA))

  d[order(d$geo, d$god), ]
}

# Zapisi panel i uz njega manifest koji kaze sto je unutra.
zapisi_panel <- function(d, put = PUT_PANEL) {
  dir.create(dirname(put), recursive = TRUE, showWarnings = FALSE)
  write.csv(d, put, row.names = FALSE, fileEncoding = "UTF-8")

  manifest <- c(
    "PANEL — sto je u ovoj mapi",
    "",
    paste("izvor          ", "Eurostat, tablice prc_hicp_aind i une_rt_a"),
    paste("preuzeto        ", "skriptom data/preuzmi.R"),
    paste("jedinica        ", "zemlja x godina"),
    paste("zemlje          ", length(unique(d$geo))),
    paste("godine          ", paste(range(d$god), collapse = " do ")),
    paste("redaka          ", nrow(d)),
    "",
    "inflacija      HICP, godisnja prosjecna stopa promjene, posto",
    "nezaposlenost  stopa nezaposlenosti, dob 15 do 74, posto radne snage",
    "",
    "Generirano iz analysis/run.R. Ne uredivati rucno."
  )
  writeLines(manifest, file.path(dirname(put), "MANIFEST.txt"))
  invisible(put)
}
