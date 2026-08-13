# Procjene. Dvije: glavna regresija i lokalne projekcije.

suppressPackageStartupMessages({
  library(sandwich)
  library(lmtest)
})

# Glavna specifikacija: ucinak inflacije na institucionalni jaz u paznji,
# OLS s Newey-West HAC standardnim pogreskama.
model_glavni <- function(d) {
  fit <- lm(iag ~ pi + d_pi + neg + euro, data = d)
  vc  <- NeweyWest(fit, lag = NW_LAG, prewhite = FALSE, adjust = TRUE)
  list(fit = fit, test = coeftest(fit, vcov. = vc), vcov = vc)
}

# Dekompozicija: koliko ucinka ide kroz broj objava, a koliko kroz doseg.
model_margine <- function(d) {
  ext <- lm(iag_ext ~ pi + d_pi + neg + euro, data = d)
  int <- lm(iag_int ~ pi + d_pi + neg + euro, data = d)
  list(
    ext = coeftest(ext, vcov. = NeweyWest(ext, lag = NW_LAG, prewhite = FALSE, adjust = TRUE)),
    int = coeftest(int, vcov. = NeweyWest(int, lag = NW_LAG, prewhite = FALSE, adjust = TRUE))
  )
}

# Lokalne projekcije: predvida li ekstenzivna margina ocekivanja kucanstava
# h tjedana unaprijed. Bonferroni korekcija za 13 horizonata.
lokalne_projekcije <- function(d, horizonti = LP_HORIZONTI) {
  n_test <- length(horizonti)
  out <- lapply(horizonti, function(h) {
    y <- if (h == 0) d$ocekivanja else c(d$ocekivanja[-seq_len(h)], rep(NA_real_, h))
    dd <- data.frame(y = y, iag_ext = d$iag_ext, pi = d$pi, euro = d$euro)
    dd <- dd[stats::complete.cases(dd), ]
    fit <- lm(y ~ iag_ext + pi + euro, data = dd)
    ct  <- coeftest(fit, vcov. = NeweyWest(fit, lag = NW_LAG, prewhite = FALSE, adjust = TRUE))
    data.frame(
      h    = h,
      beta = unname(ct["iag_ext", "Estimate"]),
      se   = unname(ct["iag_ext", "Std. Error"]),
      p    = unname(ct["iag_ext", "Pr(>|t|)"])
    )
  })
  res <- do.call(rbind, out)
  res$p_bonf  <- pmin(1, res$p * n_test)
  res$znacajno <- res$p_bonf < ALFA
  # Interval pouzdanosti nakon korekcije za visestruko testiranje.
  kv <- stats::qnorm(1 - (ALFA / n_test) / 2)
  res$lo <- res$beta - kv * res$se
  res$hi <- res$beta + kv * res$se
  res
}
