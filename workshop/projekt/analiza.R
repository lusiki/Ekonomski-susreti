podaci <- read.csv("data/croatia_inflation.csv", stringsAsFactors = FALSE)
mjeseci <- seq(as.Date("2015-01-01"), as.Date("2024-12-01"), by = "month")
podaci <- podaci[order(podaci$month), ]
stopifnot(identical(podaci$month, format(mjeseci, "%Y-%m")),
          all(podaci$country == "HR"), all(podaci$hicp_unit == "RCH_A"),
          all(podaci$expectations_unit == "BAL"), all(podaci$survey_adjustment == "NSA"),
          all(is.finite(podaci$hicp_yoy_pct)), all(is.finite(podaci$expectations_balance)))

podaci$godina <- as.integer(substr(podaci$month, 1, 4))
godisnji <- aggregate(cbind(hicp_yoy_pct, expectations_balance) ~ godina, podaci, mean)
godisnji$mjeseci <- as.integer(table(podaci$godina))
razdoblja <- list("2015.–2024." = podaci, "2015.–2019." = subset(podaci, godina < 2020),
                  "2020.–2024." = subset(podaci, godina >= 2020))
korelacije <- vapply(razdoblja, function(d) cor(d$hicp_yoy_pct, d$expectations_balance), numeric(1))
stopifnot(all(round(korelacije, 4) == c(0.6985, 0.8279, 0.5342)))
hr <- function(x, dec = 2) formatC(x, digits = dec, format = "f", decimal.mark = ",")

graf <- function() {
  old <- par(mfrow = c(2, 1), mar = c(2.0, 3, 2.4, 1), mgp = c(2, .5, 0),
             las = 1, family = "sans", xaxs = "i", bty = "n")
  on.exit(par(old))
  panel <- function(y, naslov, godine) {
    plot(mjeseci, y, type = "n", axes = FALSE, xlab = "", ylab = "")
    oznake <- axTicks(2)
    abline(h = oznake, col = "grey85", lwd = .8)
    axis(2, at = oznake, tick = FALSE, cex.axis = .86)
    lines(mjeseci, y, col = "grey12", lwd = 2.3)
    if (godine) {
      sijecanj <- which(format(mjeseci, "%m") == "01")
      axis(1, at = mjeseci[sijecanj], labels = format(mjeseci[sijecanj], "%Y"),
           tick = FALSE, cex.axis = .82)
    }
    title(naslov, adj = 0, line = .6, cex.main = 1.03)
  }
  panel(podaci$hicp_yoy_pct, "Godišnja stopa inflacije (HICP), %", FALSE)
  panel(podaci$expectations_balance, "Saldo očekivanih promjena cijena, bodovi", TRUE)
}
