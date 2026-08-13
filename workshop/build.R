# Izgradi materijale radionice i objavi ih na stranicu projekta.
#
#   Rscript workshop/build.R      (pokrenuti iz korijena repozitorija)
#
# Jedna naredba, isto načelo koje radionica zagovara.

stopifnot(dir.exists("workshop"), dir.exists("docs"))

cat("== Slajdovi ================================================\n")
system2("quarto", c("render", "workshop/slides/slides.qmd"))

cat("== Cjevovod ================================================\n")
wd <- getwd()
setwd("workshop/pipeline")
system2("Rscript", "analysis/run.R")
setwd(wd)

cat("== Objava ==================================================\n")
dir.create("docs/workshop/slides", recursive = TRUE, showWarnings = FALSE)
kopije <- list(
  c("workshop/slides/slides.html",        "docs/workshop/slides/index.html"),
  c("workshop/handout.html",              "docs/workshop/handout.html"),
  c("workshop/pipeline/paper/nalaz.html", "docs/workshop/nalaz.html")
)
for (k in kopije) {
  if (!file.exists(k[1])) stop("Nedostaje: ", k[1], call. = FALSE)
  file.copy(k[1], k[2], overwrite = TRUE)
  cat("  ", k[1], "->", k[2], "\n")
}

cat("== OK ======================================================\n")
