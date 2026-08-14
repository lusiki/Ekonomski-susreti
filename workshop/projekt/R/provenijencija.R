# Provenijencija. Svaki broj u tekstu mora imati kod koji ga proizvodi.
#
# Dva smjera:
#   1. skupi_procjene()        zapisuje sve brojeve u results/procjene.json
#   2. rucno_upisani_brojevi() nalazi broj koji je covjek upisao rukom
#
# Ovo je najjace pravilo u projektu. Tekst ne moze tiho odstupiti od
# tablice jer se gradnja rusi na svaki decimalni broj upisan rukom.

suppressPackageStartupMessages(library(jsonlite))

skupi_procjene <- function(d, m_zemlje, m_oba, m_prije, m_poslije,
                           put = PUT_PROCJENE) {
  a  <- nagib(m_zemlje)
  b  <- nagib(m_oba)
  p1 <- nagib(m_prije)
  p2 <- nagib(m_poslije)

  # Godisnji prosjeci, izracunati jednom pa citani vise puta.
  po_god <- stats::aggregate(cbind(inflacija, nezaposlenost) ~ god,
                             data = d, FUN = mean)
  po_god <- po_god[order(po_god$god), ]

  procjene <- list(
    n_opazanja  = nrow(d),
    n_zemalja   = length(unique(d$geo)),
    n_godina    = length(unique(d$god)),
    god_od      = min(d$god),
    god_do      = max(d$god),
    prije_do    = PRIJE_DO,
    poslije_od  = POSLIJE_OD,

    beta        = a$beta,   se = a$se,   p = a$p,
    beta_oba    = b$beta,   se_oba = b$se, p_oba = b$p,
    beta_prije  = p1$beta,  se_prije = p1$se, p_prije = p1$p, n_prije = p1$n,
    beta_posl   = p2$beta,  se_posl = p2$se,  p_posl = p2$p,  n_posl = p2$n,

    infl_vrh_god  = po_god$god[which.max(po_god$inflacija)],
    infl_vrh      = max(po_god$inflacija),
    infl_pocetak  = po_god$inflacija[1],
    nezap_pocetak = po_god$nezaposlenost[1],
    nezap_kraj    = po_god$nezaposlenost[nrow(po_god)],

    sjeme         = SJEME
  )

  dir.create(dirname(put), recursive = TRUE, showWarnings = FALSE)
  write_json(procjene, put, auto_unbox = TRUE, digits = 8, pretty = TRUE)
  procjene
}

ucitaj_procjene <- function(put = PUT_PROCJENE) fromJSON(put)

# Hrvatski zapis broja, decimalni zarez.
hr <- function(x, dec = 2) {
  formatC(x, format = "f", digits = dec, decimal.mark = ",", big.mark = ".")
}

# Vrati redke odjeljka Rezultati u kojima je decimalni broj upisan rukom,
# a ne ubacen inline referencom na procjene.json.
rucno_upisani_brojevi <- function(put_qmd = "paper/nalaz.qmd") {
  redovi <- readLines(put_qmd, warn = FALSE, encoding = "UTF-8")

  od <- grep("^#+\\s*Rezultati", redovi)
  if (!length(od)) return(character(0))
  do <- grep("^#+\\s", redovi)
  do <- do[do > od[1]]
  do <- if (length(do)) do[1] - 1 else length(redovi)
  odjeljak <- redovi[od[1]:do]

  # Ukloni inline R izraze. Sve sto ostane napisao je covjek.
  bez_koda <- gsub("`r[^`]*`", "", odjeljak)

  grep("[0-9]+[,.][0-9]+", bez_koda, value = TRUE)
}
