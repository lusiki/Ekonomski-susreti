# Procjene. Cetiri regresije, sve OLS, sve citljive u jednoj minuti.
#
# Pitanje je Phillipsovo. Je li visa nezaposlenost povezana s nizom
# inflacijom u zemljama europodrucja i vrijedi li ta veza jednako prije
# i poslije inflacijskog vala 2021. godine.

# Osnovna specifikacija. Fiksni ucinci zemlje uklanjaju trajne razlike
# medu gospodarstvima, pa koeficijent citamo unutar zemlje kroz vrijeme.
model_zemlje <- function(d) {
  lm(inflacija ~ nezaposlenost + factor(geo), data = d)
}

# Ista specifikacija uz fiksne ucinke godine. Godisnji ucinci uklanjaju
# sve sto je u nekoj godini zajednicko svim zemljama, a to je upravo
# energetski sok. Ovo je mjesto na kojem se odlucuje sto pitanje uopce
# znaci, i zato se ne delegira.
model_zemlje_godine <- function(d) {
  lm(inflacija ~ nezaposlenost + factor(geo) + factor(god), data = d)
}

# Isti nagib procijenjen odvojeno prije i poslije inflacijskog vala.
model_razdoblje <- function(d, koje) {
  dd <- d[!is.na(d$razdoblje) & d$razdoblje == koje, ]
  lm(inflacija ~ nezaposlenost + factor(geo), data = dd)
}

# Izvuci koeficijent na nezaposlenosti u urednom obliku.
nagib <- function(fit) {
  s <- summary(fit)$coefficients["nezaposlenost", ]
  list(
    beta = unname(s["Estimate"]),
    se   = unname(s["Std. Error"]),
    t    = unname(s["t value"]),
    p    = unname(s["Pr(>|t|)"]),
    n    = length(stats::residuals(fit))
  )
}
