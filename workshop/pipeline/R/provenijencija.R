# Provenijencija: svaki broj u tekstu mora imati kod koji ga proizvodi.
#
# Dva smjera:
#   1. skupi_procjene() zapisuje sve brojeve u results/procjene.json
#   2. provjeri_brojeve() odbija rukopis u koji je broj upisan rukom

suppressPackageStartupMessages(library(jsonlite))

skupi_procjene <- function(d, glavni, margine, lp, put = PUT_PROCJENE) {
  znacajni <- lp$h[lp$znacajno]
  p <- list(
    n_tjedana        = nrow(d),
    uzorak_od        = format(min(d$tjedan), "%d.%m.%Y."),
    uzorak_do        = format(max(d$tjedan), "%d.%m.%Y."),
    n_naslova        = attr(d, "n_naslova") %||% NA,
    beta_pi          = unname(glavni$test["pi", "Estimate"]),
    se_pi            = unname(glavni$test["pi", "Std. Error"]),
    p_pi             = unname(glavni$test["pi", "Pr(>|t|)"]),
    beta_ext         = unname(margine$ext["pi", "Estimate"]),
    p_ext            = unname(margine$ext["pi", "Pr(>|t|)"]),
    beta_int         = unname(margine$int["pi", "Estimate"]),
    p_int            = unname(margine$int["pi", "Pr(>|t|)"]),
    udio_ext         = unname(margine$ext["pi", "Estimate"]) /
                       unname(glavni$test["pi", "Estimate"]),
    lp_od            = if (length(znacajni)) min(znacajni) else NA_integer_,
    lp_do            = if (length(znacajni)) max(znacajni) else NA_integer_,
    lp_n_znacajnih   = length(znacajni),
    pokrivenost_baza = mean(d$udio_ext[seq_len(BAZNI_TJEDNI)]),
    sjeme            = SJEME
  )
  dir.create(dirname(put), recursive = TRUE, showWarnings = FALSE)
  write_json(p, put, auto_unbox = TRUE, digits = 8, pretty = TRUE)
  p
}

`%||%` <- function(a, b) if (is.null(a)) b else a

ucitaj_procjene <- function(put = PUT_PROCJENE) fromJSON(put)

# Formatiranje brojeva u hrvatskom zapisu (decimalni zarez).
hr <- function(x, dec = 4) {
  formatC(x, format = "f", digits = dec, decimal.mark = ",", big.mark = ".")
}

# Vrati retke odjeljka Rezultati u kojima je decimalni broj upisan rukom,
# a ne ubacen inline referencom na procjene.json.
rucno_upisani_brojevi <- function(put_qmd = "paper/nalaz.qmd") {
  redovi <- readLines(put_qmd, warn = FALSE, encoding = "UTF-8")

  od <- grep("^#+\\s*Rezultati", redovi)
  if (!length(od)) return(character(0))
  do <- grep("^#+\\s", redovi)
  do <- do[do > od[1]]
  do <- if (length(do)) do[1] - 1 else length(redovi)
  odjeljak <- redovi[od[1]:do]

  # Ukloni inline R izraze — sve sto ostane napisao je covjek.
  bez_koda <- gsub("`r[^`]*`", "", odjeljak)

  grep("[0-9]+[,.][0-9]+", bez_koda, value = TRUE)
}
