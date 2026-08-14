# Slike. Svaka slika ima svoju funkciju i svoju datoteku.
# Pravilo: nijedna slika ne nastaje rucno, u sesiji ili u uredniku.

suppressPackageStartupMessages(library(ggplot2))

# Crno-bijelo, prema design/design-system.md. Serije se razlikuju debljinom
# i vrstom linije, nikad bojom. Sivi tonovi su oni iz sustava.
# Obitelj pisma ostaje "sans" da cjevovod radi na svakom racunalu bez
# instalacije fonta; na stranici projekta sve ostalo koristi Roboto.
tema_radionica <- function() {
  theme_minimal(base_size = 12) +
    theme(
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = SIVA_LINIJA, linewidth = 0.3),
      plot.title = element_text(face = "bold", size = 13, colour = "black"),
      plot.subtitle = element_text(colour = SIVA_TEKST, size = 10),
      plot.caption = element_text(colour = SIVA_SVJETLA, size = 8, hjust = 0),
      axis.text = element_text(colour = SIVA_TEKST),
      axis.title = element_text(colour = "black")
    )
}

CRNA <- "#000000"
SIVA <- "#8a8a8a"
SIVA_TEKST <- "#555555"
SIVA_SVJETLA <- "#8a8a8a"
SIVA_LINIJA <- "#d9d9d9"

# Slika 1: inflacija i institucionalni jaz u paznji kroz vrijeme.
slika_jaz <- function(d, put) {
  faktor <- max(d$pi) / max(d$iag)
  d$iag_gl <- stats::filter(d$iag, rep(1 / 8, 8), sides = 2)
  p <- ggplot(d, aes(x = tjedan)) +
    geom_hline(yintercept = 0, colour = SIVA_LINIJA, linewidth = 0.3) +
    geom_line(aes(y = iag * faktor), colour = SIVA, linewidth = 0.3,
              alpha = 0.5) +
    geom_line(aes(y = pi), colour = CRNA, linewidth = 0.5,
              linetype = "dashed") +
    geom_line(aes(y = iag_gl * faktor), colour = CRNA, linewidth = 1,
              na.rm = TRUE) +
    geom_vline(xintercept = EURO_OD, linetype = "dashed",
               colour = SIVA_SVJETLA) +
    scale_y_continuous(
      name = "HICP, godišnja stopa (%)",
      sec.axis = sec_axis(~ . / faktor, name = "IAG")
    ) +
    labs(
      x = NULL,
      title = "Inflacija i institucionalni jaz u pažnji",
      subtitle = paste("Isprekidana linija je HICP, puna linija je IAG kao",
                        "osmotjedni prosjek. Okomita crta je uvođenje eura."),
      caption = "Kalibrirani demonstracijski podaci. Slika: R/slike.R::slika_jaz"
    ) +
    tema_radionica()
  ggsave(put, p, width = 8, height = 4.2, dpi = 150)
  put
}

# Slika 2: lokalne projekcije s korigiranim intervalima pouzdanosti.
slika_projekcije <- function(lp, put) {
  lp$oznaka <- ifelse(lp$znacajno, "značajno", "nije značajno")
  p <- ggplot(lp, aes(x = h, y = beta)) +
    geom_hline(yintercept = 0, colour = SIVA_SVJETLA, linewidth = 0.4) +
    geom_ribbon(aes(ymin = lo, ymax = hi), fill = SIVA_LINIJA) +
    geom_line(colour = CRNA, linewidth = 0.6) +
    geom_point(aes(shape = oznaka), colour = CRNA, fill = "white",
               size = 2.2) +
    scale_shape_manual(values = c("značajno" = 16, "nije značajno" = 1),
                       name = NULL) +
    scale_x_continuous(breaks = lp$h) +
    labs(
      x = "horizont h (tjedni)",
      y = "koeficijent na IAG (ekstenzivna margina)",
      title = "Predviđaju li objave o HNB-u očekivanja kućanstava?",
      subtitle = paste0("Lokalne projekcije uz korekciju za višestruko ",
                        "testiranje na ", length(LP_HORIZONTI), " horizonata"),
      caption = "Kalibrirani demonstracijski podaci. Slika: R/slike.R::slika_projekcije"
    ) +
    tema_radionica() +
    theme(legend.position = "bottom")
  ggsave(put, p, width = 8, height = 4.2, dpi = 150)
  put
}
