# Izgradi materijale radionice i objavi ih na stranicu projekta.
#
#   Rscript workshop/build.R      (pokrenuti iz korijena repozitorija)
#
# Jedna naredba, isto nacelo koje radionica zagovara.

stopifnot(dir.exists("workshop"), dir.exists("docs"))

cat("== Slajdovi ================================================\n")
system2("quarto", c("render", "workshop/slides/slides.qmd"))

cat("== Projekt =================================================\n")
wd <- getwd()
setwd("workshop/projekt")
status <- system2("Rscript", "analysis/run.R")
setwd(wd)
if (status != 0) stop("Projekt se nije izgradio.", call. = FALSE)

cat("== Objava ==================================================\n")
dir.create("docs/workshop/slides", recursive = TRUE, showWarnings = FALSE)
dir.create("docs/workshop/slike",  recursive = TRUE, showWarnings = FALSE)

kopije <- list(
  c("workshop/slides/slides.html",       "docs/workshop/slides/index.html"),
  c("workshop/handout.html",             "docs/workshop/handout.html"),
  c("workshop/projekt/paper/nalaz.html", "docs/workshop/nalaz.html"),
  c("workshop/projekt/results/slike/slika1-vrijeme.png",
    "docs/workshop/slike/slika1-vrijeme.png"),
  c("workshop/projekt/results/slike/slika2-phillips.png",
    "docs/workshop/slike/slika2-phillips.png")
)
for (k in kopije) {
  if (!file.exists(k[1])) stop("Nedostaje: ", k[1], call. = FALSE)
  file.copy(k[1], k[2], overwrite = TRUE)
  cat("  ", k[1], "->", k[2], "\n")
}

cat("== OK ======================================================\n")
