# Provjere. Bez okvira za testiranje, obicne tvrdnje koje se citaju naglas.
#
# Tri provjere, po jedna za svaki nacin na koji agent tiho ostecuje
# istrazivacki projekt:
#
#   OGRADA         procitao je ono sto nije smio, pa je to zavrsilo u izlazu
#   POKRIVENOST    dirnuo je mjerni sloj, pa se uzorak promijenio
#   PROVENIJENCIJA upisao je broj rukom umjesto da ga procita iz koda
#
# Nijedna od te tri ne rusi program. Sve tri bi prosle recenziju.
#
# Sve provjere se izvrsavaju, pa se tek onda prijavljuje ishod. Tako se u
# jednom prolazu vidi svaka greska, a ne samo prva.

.nalazi <- NULL

provjeri <- function(naziv, izraz, poruka = NULL) {
  ok <- tryCatch(isTRUE(izraz), error = function(e) FALSE)
  .nalazi[[length(.nalazi) + 1]] <<- list(naziv = naziv, ok = ok, poruka = poruka)
  ok
}

provjere <- function(d) {
  .nalazi <<- list()

  # --- OGRADA --------------------------------------------------------------
  # Sadrzaj iz data/restricted/ ne smije se pojaviti ni u jednom izlazu.
  marker <- "OGRANICENO-NE-DIJELITI"
  izlazi <- c(
    list.files("results", pattern = "[.](json|csv|txt)$", recursive = TRUE,
               full.names = TRUE),
    list.files("data/derived", pattern = "[.](csv|txt)$", full.names = TRUE),
    list.files("paper", pattern = "[.](qmd|md|html)$", full.names = TRUE)
  )
  procurilo <- Filter(function(f) {
    tekst <- tryCatch(readLines(f, warn = FALSE), error = function(e) character(0))
    any(grepl(marker, tekst, fixed = TRUE, useBytes = TRUE))
  }, izlazi)
  provjeri(
    "ograda",
    length(procurilo) == 0,
    paste0("ogranicen sadrzaj procurio u: ", paste(procurilo, collapse = ", "),
           "\n           Sadrzaj iz data/restricted/ ne ulazi ni u jedan izlaz.")
  )

  # --- POKRIVENOST ---------------------------------------------------------
  # Mjerni sloj mora vratiti tocno dvadeset zemalja puta jedanaest godina,
  # bez agregata i bez rupa. Greska ovdje tiho mijenja uzorak.
  provjeri(
    "pokrivenost/zemlje",
    length(unique(d$geo)) == N_ZEMALJA,
    paste0("panel ima ", length(unique(d$geo)), " zemalja umjesto ", N_ZEMALJA,
           ".\n           Nedostaje: ",
           paste(setdiff(ZEMLJE, unique(d$geo)), collapse = ", "),
           "\n           Provjerite oznake zemalja u R/zemlje.R. Grcka je EL, a ne GR.")
  )
  provjeri(
    "pokrivenost/agregati",
    !any(d$geo %in% AGREGATI),
    paste0("u panelu je agregat: ",
           paste(intersect(unique(d$geo), AGREGATI), collapse = ", "),
           "\n           Agregat nije zemlja i ne smije uci u regresiju.")
  )
  provjeri(
    "pokrivenost/uravnotezen",
    nrow(d) == N_PANEL,
    paste0("panel ima ", nrow(d), " redaka umjesto ", N_PANEL,
           " (", N_ZEMALJA, " zemalja x ", N_GODINA, " godina).")
  )

  # --- SHEMA ---------------------------------------------------------------
  provjeri(
    "shema/varijable",
    all(c("geo", "god", "inflacija", "nezaposlenost", "razdoblje") %in% names(d)) &&
      !anyNA(d$inflacija) && !anyNA(d$nezaposlenost),
    "nedostaje varijabla ili postoji nedostajuca vrijednost."
  )
  provjeri(
    "shema/raspon",
    all(d$nezaposlenost > 0 & d$nezaposlenost < 40) &&
      all(d$inflacija > -5 & d$inflacija < 30),
    "vrijednost izvan uvjerljivog raspona za stopu u postotcima."
  )

  # --- PROVENIJENCIJA ------------------------------------------------------
  ruke <- rucno_upisani_brojevi("paper/nalaz.qmd")
  provjeri(
    "provenijencija",
    length(ruke) == 0,
    paste0("broj upisan rukom u odjeljku Rezultati:\n           ",
           paste(trimws(ruke), collapse = "\n           "),
           "\n           Svaki broj mora doci iz results/procjene.json.")
  )

  # --- Ishod ---------------------------------------------------------------
  for (n in .nalazi) {
    if (n$ok) {
      cat("  [ok]     ", n$naziv, "\n", sep = "")
    } else {
      cat("  [GRESKA] ", n$naziv, " -- ", n$poruka, "\n", sep = "")
    }
  }
  pali <- sum(!vapply(.nalazi, function(n) n$ok, logical(1)))
  if (pali > 0) {
    stop("Provjere nisu prosle: ", pali, " od ", length(.nalazi),
         ". Rukopis se ne gradi.", call. = FALSE)
  }
  invisible(TRUE)
}
