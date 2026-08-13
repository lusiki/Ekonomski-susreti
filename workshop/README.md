# Radionica — otvoreno, reproducibilno i AI-podržano istraživanje

Šezdesetominutna radionica uz izlaganje rada *Pasivno zamijenjena*. Izlaganje iznosi tvrdnju;
radionica otvara lanac po kojem se ta tvrdnja može provjeriti.

[**Slajdovi**](https://lusiki.github.io/Ekonomski-susreti/workshop/slides/) ·
[scenarij](SCRIPT.md) · [rukovanje demonstracijom](RUNBOOK.md) ·
[cjevovod](pipeline/) · [pojmovnik](GLOSSARY.md) · [literatura](READING.md)

## Ideja

Otvorenost, reproducibilnost i AI nisu tri teme nego tri odgovora na isto pitanje:

> **Tko ovo može provjeriti i po kojoj cijeni?**

Otvorenost znači da vas mogu provjeriti drugi. Reproducibilnost znači da vas može provjeriti stroj i
vi sami za godinu dana. AI čini proizvodnju tvrdnji gotovo besplatnom — i time lanac provjere
pretvara u usko grlo. Otud rečenica koja nosi cijeli sat: **agent generira, vi jamčite.**

## Pet redaka koje publika nosi kući

| | |
|---|---|
| **Jedno pitanje** | Tko ovo može provjeriti i po kojoj cijeni? |
| **Tri stupa** | otvoreno · reproducibilno · AI-podržano |
| **Jedna ljestvica** | četiri prečke — popnite se za jednu |
| **Jedna petlja** | opiši → plan → odobri → izvrši → **provjeri** → commit |
| **Tri greške** | curenje · odstupanje · pokrivenost |

## Ljestvica reproducibilnosti

| Prečka | Što znači |
|---|---|
| **0** | objavljen je samo PDF |
| **1** | stranica projekta, citat i metapodaci — **ovaj projekt danas** |
| **2** | kod javan, podaci dokumentirani (manifest i kodna knjiga) |
| **3** | jedna naredba gradi sve, okruženje zaključano, CI to provjerava |

Ograničeni podaci nisu izlika za prečku 0. Naš izvorni korpus je licenciran i ne redistribuira se,
ali kod, pravila pretrage, izvedeni agregati, manifest i sjeme — sve to smije van.

## Sadržaj

| Datoteka | Što je |
|---|---|
| [`slides/slides.qmd`](slides/slides.qmd) | deck (Quarto reveal.js, hrvatski), 24 slajda |
| [`SCRIPT.md`](SCRIPT.md) | scenarij izlaganja minutu po minutu — što pokazati, napraviti i reći |
| [`RUNBOOK.md`](RUNBOOK.md) | rukovanje demonstracijom, tri podmetnute greške, pravilo 60 sekundi |
| [`handout.html`](handout.html) | jedna stranica za tisak (A4, obostrano) |
| [`GLOSSARY.md`](GLOSSARY.md) | hrvatsko i englesko nazivlje |
| [`READING.md`](READING.md) | dvanaest naslova u tri skupine |
| [`pipeline/`](pipeline/) | cjevovod koji se gradi jednom naredbom i sam se provjerava |

## Gradnja materijala

```bash
quarto render slides/slides.qmd      # -> slides/slides.html (samostalan)
cd pipeline && Rscript analysis/run.R  # -> paper/nalaz.html + results/
```

Traži: Quarto ≥ 1.4, R ≥ 4.2. Bez GPU-a.

## Demonstracija u tri poteza

```bash
cd pipeline
Rscript demo/podmetni.R    # podmetni tri greške
Rscript analysis/run.R     # sve tri se prijave u jednom ispisu, rukopis se ne gradi
Rscript demo/vrati.R       # čisto stanje
```

## Odnos prema cjevovodu

`pipeline/` je zamišljen kao **zaseban repozitorij** koji sudionici kloniraju. Ovdje živi zato što
je nastao uz radionicu; kad se otvori vlastiti repozitorij, mapa se kopira u cijelosti i radi bez
izmjena.

## Napomena o podacima

Demonstracijski podaci su **kalibrirani**, ne izvorni. Brojke su reda veličine objavljenih, ali nisu
rezultati istraživanja i ne smiju se tako citirati. Zamjena stvarnim izvozom opisana je u
[`pipeline/data/make_data.R`](pipeline/data/make_data.R).

## Licencija

Kod MIT, tekst CC BY 4.0.
