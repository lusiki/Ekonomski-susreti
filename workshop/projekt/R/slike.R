# Slike. Svaka slika ima svoju funkciju i svoju datoteku.
# Pravilo: nijedna slika ne nastaje rucno u interaktivnoj sesiji.

suppressPackageStartupMessages(library(ggplot2))

CRNA         <- "#000000"
SIVA         <- "#8a8a8a"
SIVA_TEKST   <- "#555555"
SIVA_LINIJA  <- "#d9d9d9"

# Crno bijelo, prema design/design-system.md. Serije se razlikuju debljinom
# i vrstom linije, nikad bojom. Obitelj pisma ostaje "sans" da projekt radi
# na svakom racunalu bez instalacije fonta.
tema_radionica <- function() {
  theme_minimal(base_size = 12) +
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = SIVA_LINIJA, linewidth = 0.3),
      plot.title    = element_text(face = "bold", size = 13, colour = "black"),
      plot.subtitle = element_text(colour = SIVA_TEKST, size = 10),
      plot.caption  = element_text(colour = SIVA, size = 8, hjust = 0),
      axis.text     = element_text(colour = SIVA_TEKST),
      axis.title    = element_text(colour = "black"),
      legend.position = "bottom",
      legend.title  = element_blank()
    )
}

# Slika 1. Prosjek europodrucja kroz vrijeme, dvije serije.
slika_vrijeme <- function(d, put) {
  ag <- stats::aggregate(cbind(inflacija, nezaposlenost) ~ god, data = d, FUN = mean)
  dug <- rbind(
    data.frame(god = ag$god, vrijednost = ag$inflacija,     serija = "inflacija"),
    data.frame(god = ag$god, vrijednost = ag$nezaposlenost, serija = "nezaposlenost")
  )
  p <- ggplot(dug, aes(x = god, y = vrijednost, linetype = serija, linewidth = serija)) +
    geom_hline(yintercept = 0, colour = SIVA_LINIJA, linewidth = 0.3) +
    geom_line(colour = CRNA) +
    scale_linetype_manual(values = c(inflacija = "solid", nezaposlenost = "dashed")) +
    scale_linewidth_manual(values = c(inflacija = 1, nezaposlenost = 0.5), guide = "none") +
    scale_x_continuous(breaks = seq(GODINA_OD, GODINA_DO, by = 2)) +
    labs(
      x = NULL, y = "posto",
      title = "Inflacija i nezaposlenost u europodručju",
      subtitle = paste0("Neponderirani prosjek ", N_ZEMALJA, " zemalja europodručja, ",
                        GODINA_OD, " do ", GODINA_DO, "."),
      caption = "Izvor Eurostat, tablice prc_hicp_aind i une_rt_a. Slika R/slike.R::slika_vrijeme"
    ) +
    tema_radionica()
  ggsave(put, p, width = 8, height = 4.2, dpi = 150)
  put
}

# Slika 2. Phillipsova krivulja u dva razdoblja.
#
# Obje se velicine prikazuju kao odstupanje od prosjeka vlastite zemlje u
# tom razdoblju. To nije uljepsavanje nego jedini nacin da nagib na slici
# bude isti broj koji je u tekstu. Model ima fiksne ucinke zemlje, pa
# sirovi raspršeni dijagram crtao bi drugi nagib od onoga koji se prijavljuje.
slika_phillips <- function(d, put) {
  dd <- d[!is.na(d$razdoblje), ]

  # Uklanjanje prosjeka zemlje unutar razdoblja. Frisch Waugh, pa je nagib
  # na ovim odstupanjima jednak koeficijentu iz modela s fiksnim ucincima.
  dd <- do.call(rbind, lapply(split(dd, list(dd$geo, dd$razdoblje), drop = TRUE),
    function(g) {
      g$inf_odst <- g$inflacija     - mean(g$inflacija)
      g$nez_odst <- g$nezaposlenost - mean(g$nezaposlenost)
      g
    }))

  dd$oznaka <- factor(dd$razdoblje,
                      levels = c("prije", "poslije"),
                      labels = c(paste0(GODINA_OD, " do ", PRIJE_DO),
                                 paste0(POSLIJE_OD, " do ", GODINA_DO)))

  p <- ggplot(dd, aes(x = nez_odst, y = inf_odst, shape = oznaka, linetype = oznaka)) +
    geom_hline(yintercept = 0, colour = SIVA_LINIJA, linewidth = 0.3) +
    geom_vline(xintercept = 0, colour = SIVA_LINIJA, linewidth = 0.3) +
    geom_point(colour = SIVA_TEKST, size = 1.6, fill = "white") +
    geom_smooth(method = "lm", formula = y ~ x, se = FALSE,
                colour = CRNA, linewidth = 0.8) +
    scale_shape_manual(values = c(1, 16)) +
    labs(
      x = "nezaposlenost, odstupanje od prosjeka zemlje",
      y = "inflacija, odstupanje od prosjeka zemlje",
      title = "Phillipsova krivulja prije i poslije inflacijskog vala",
      subtitle = paste0("Svaka točka je jedna zemlja u jednoj godini, prikazana kao ",
                        "odstupanje od\nprosjeka te zemlje u tom razdoblju. ",
                        "Pandemijska 2020. je izostavljena."),
      caption = paste("Nagib svakog pravca jednak je koeficijentu iz teksta.",
                      "Izvor Eurostat. Slika R/slike.R::slika_phillips")
    ) +
    tema_radionica()
  ggsave(put, p, width = 8, height = 4.8, dpi = 150)
  put
}
