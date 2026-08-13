# Provjere. Bez okvira za testiranje — obicne tvrdnje koje se citaju naglas.
#
# Tri provjere, po jedna za svaki stup radionice:
#   OGRADA         (otvoreno)       — ogranicen sadrzaj ne izlazi iz repozitorija
#   POKRIVENOST    (mjerenje, AI)   — pravilo pretrage cita hrvatski
#   PROVENIJENCIJA (reproducibilno) — nijedan broj u tekstu nije upisan rukom
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
  marker <- "OGRANICENO-NE-DIJELITI"
  izlazi <- c(
    list.files("results", pattern = "[.](json|csv|txt)$", recursive = TRUE,
               full.names = TRUE),
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
           "\n         Sadrzaj iz data/restricted/ ne smije uci ni u jedan izlaz.")
  )

  # --- POKRIVENOST ---------------------------------------------------------
  # Pravilo mora prepoznati oba pravopisa. Greska u ovom sloju tiho mijenja
  # zavisnu varijablu, a ne rusi nista drugo.
  uzorak <- c(
    "Središnja banka objavila izvješće",     # trazi normalizaciju dijakritike
    "Sredisnja banka objavila izvjesce",     # bez dijakritike
    "HNB: cijene hrane",                     # kratica
    "Hrvatska narodna banka o kreditima"     # puni naziv
  )
  pogodci <- o_hnb(uzorak)
  provjeri(
    "pokrivenost/pravilo",
    all(pogodci),
    paste0("pravilo ne prepoznaje: ", paste(uzorak[!pogodci], collapse = " | "),
           "\n         Provjerite normalizaciju dijakritickih znakova u R/korpus.R.")
  )
  provjeri(
    "pokrivenost/laznipogodak",
    !any(o_hnb("Cijene goriva ponovno rastu")),
    "pravilo hvata objave koje nisu o HNB-u."
  )
  baza <- mean(d$udio_ext[seq_len(BAZNI_TJEDNI)])
  provjeri(
    "pokrivenost/udio",
    baza >= POKRIVENOST_MIN && baza <= POKRIVENOST_MAX,
    paste0("udio objava o HNB-u u baznom razdoblju je ", round(baza, 4),
           ", izvan ocekivanog raspona [", POKRIVENOST_MIN, ", ",
           POKRIVENOST_MAX, "].")
  )

  # --- SHEMA ---------------------------------------------------------------
  provjeri("shema/tjedni", nrow(d) == 157,
           paste0("panel ima ", nrow(d), " redaka umjesto 157."))
  provjeri("shema/varijable",
           all(c("tjedan", "pi", "iag", "iag_ext", "iag_int", "ocekivanja")
               %in% names(d)) && !anyNA(d$iag),
           "nedostaje varijabla ili postoji nedostajuca vrijednost u IAG-u.")

  # --- PROVENIJENCIJA ------------------------------------------------------
  ruke <- rucno_upisani_brojevi("paper/nalaz.qmd")
  provjeri(
    "provenijencija",
    length(ruke) == 0,
    paste0("broj upisan rukom u odjeljku Rezultati:\n         ",
           paste(trimws(ruke), collapse = "\n         "),
           "\n         Svaki broj mora doci iz results/procjene.json.")
  )

  # --- Ishod ---------------------------------------------------------------
  for (n in .nalazi) {
    if (n$ok) {
      cat("  [ok]     ", n$naziv, "\n", sep = "")
    } else {
      cat("  [GRESKA] ", n$naziv, " — ", n$poruka, "\n", sep = "")
    }
  }
  pali <- sum(!vapply(.nalazi, function(n) n$ok, logical(1)))
  if (pali > 0) {
    stop("Provjere nisu prosle: ", pali, " od ", length(.nalazi),
         ". Rukopis se ne gradi.", call. = FALSE)
  }
  invisible(TRUE)
}
