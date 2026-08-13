# Slike. Svaka slika ima svoju funkciju i svoju datoteku.
# Pravilo: nijedna slika ne nastaje rucno, u sesiji ili u uredniku.

suppressPackageStartupMessages(library(ggplot2))

tema_radionica <- function() {
  theme_minimal(base_size = 12) +
    theme(
      panel.grid.minor = element_blank(),
      plot.title = element_text(face = "bold", size = 13),
      plot.subtitle = element_text(colour = "grey35", size = 10),
      plot.caption = element_text(colour = "grey45", size = 8, hjust = 0)
    )
}

BOJA_IAG <- "#16324F"
BOJA_PI  <- "#C2451E"

# Slika 1: inflacija i institucionalni jaz u paznji kroz vrijeme.
slika_jaz <- function(d, put) {
  faktor <- max(d$pi) / max(d$iag)
  d$iag_gl <- stats::filter(d$iag, rep(1 / 8, 8), sides = 2)
  p <- ggplot(d, aes(x = tjedan)) +
    geom_hline(yintercept = 0, colour = "grey70", linewidth = 0.3) +
    geom_line(aes(y = iag * faktor), colour = BOJA_IAG, linewidth = 0.3,
              alpha = 0.28) +
    geom_line(aes(y = pi), colour = BOJA_PI, linewidth = 0.6) +
    geom_line(aes(y = iag_gl * faktor), colour = BOJA_IAG, linewidth = 1,
              na.rm = TRUE) +
    geom_vline(xintercept = EURO_OD, linetype = "dashed",
               colour = "grey45") +
    scale_y_continuous(
      name = "HICP, godišnja stopa (%)",
      sec.axis = sec_axis(~ . / faktor, name = "IAG")
    ) +
    labs(
      x = NULL,
      title = "Inflacija i institucionalni jaz u pažnji",
      subtitle = "crveno: HICP · tamnoplavo: IAG (tanko: tjedno, debelo: 8-tjedni prosjek) · isprekidano: uvođenje eura",
      caption = "Kalibrirani demonstracijski podaci. Slika: R/slike.R::slika_jaz"
    ) +
    tema_radionica()
  ggsave(put, p, width = 8, height = 4.2, dpi = 150)
  put
}

# Slika 2: lokalne projekcije s Bonferroni korigiranim intervalima.
slika_projekcije <- function(lp, put) {
  lp$oznaka <- ifelse(lp$znacajno, "značajno", "nije značajno")
  p <- ggplot(lp, aes(x = h, y = beta)) +
    geom_hline(yintercept = 0, colour = "grey60", linewidth = 0.4) +
    geom_ribbon(aes(ymin = lo, ymax = hi), fill = BOJA_IAG, alpha = 0.12) +
    geom_line(colour = BOJA_IAG, linewidth = 0.6) +
    geom_point(aes(shape = oznaka), colour = BOJA_IAG, size = 2.2) +
    scale_shape_manual(values = c("značajno" = 16, "nije značajno" = 1),
                       name = NULL) +
    scale_x_continuous(breaks = lp$h) +
    labs(
      x = "horizont h (tjedni)",
      y = "koeficijent na IAG (ekstenzivna margina)",
      title = "Predviđaju li objave o HNB-u očekivanja kućanstava?",
      subtitle = "Lokalne projekcije, Newey-West, Bonferroni korekcija za 13 testova",
      caption = "Kalibrirani demonstracijski podaci. Slika: R/slike.R::slika_projekcije"
    ) +
    tema_radionica() +
    theme(legend.position = "bottom")
  ggsave(put, p, width = 8, height = 4.2, dpi = 150)
  put
}
