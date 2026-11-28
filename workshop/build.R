# Pokrenuti iz korijena repozitorija ili iz mape workshop.
if (file.exists("workshop/projekt/index.qmd")) setwd("workshop")
radionica <- normalizePath(".")
objava <- normalizePath("../docs/workshop")
setwd("projekt")
pokreni <- function(program, argumenti) {
  status <- system2(program, argumenti)
  if (status != 0L) stop(program, " nije dovršen.")
}
kopiraj <- function(iz, u) stopifnot(file.copy(iz, u, overwrite = TRUE))
pokreni("quarto", c("render", "index.qmd"))
kopiraj("index.html", file.path(objava, "nalaz.html"))
kopiraj("index.pdf", file.path(objava, "nalaz.pdf"))
kopiraj("data/croatia_inflation.csv", file.path(objava, "data"))
source("analiza.R")
ragg::agg_png(file.path(objava, "slike/inflacija-ocekivanja.png"), width = 1800, height = 690, res = 145)
graf()
dev.off()
setwd(radionica)
# Izričit popis ulaznih datoteka čuva paket od lokalnih izlaza analize.
ulazi <- file.path("projekt", c("README.md", "analiza.R", "analiza.css",
                               "index.qmd", "data/croatia_inflation.csv",
                               "fonts/LICENSE.txt", "fonts/Roboto-Regular.ttf", "fonts/Roboto-Bold.ttf"))
arhiva <- tempfile(fileext = ".zip")
stopifnot(utils::zip(arhiva, ulazi, flags = "-q") == 0L)
kopiraj(arhiva, file.path(objava, "projekt.zip"))
pokreni("python3", "../scripts/build-workshop-slides.py")
