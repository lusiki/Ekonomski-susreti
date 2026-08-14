# Radionica o otvorenom, reproducibilnom i AI podržanom istraživanju

Šezdesetominutna radionica Luke Sikića uz izlaganje rada *Pasivno zamijenjena*. Izlaganje iznosi
tvrdnju, a radionica pokazuje kako se ta tvrdnja može provjeriti i koliko takva provjera stoji.

[**Slajdovi**](https://lusiki.github.io/Ekonomski-susreti/workshop/slides/) ·
[scenarij](SCRIPT.md) · [rukovanje demonstracijom](RUNBOOK.md) ·
[cjevovod](pipeline/) · [pojmovnik](GLOSSARY.md) · [literatura](READING.md)

## Ideja

Otvorenost, reproducibilnost i AI često se obrađuju kao tri odvojene teme. Ovdje su tri odgovora na
isto pitanje.

> **Tko ovo može provjeriti i uz koliki trošak?**

Otvorenost znači da vas mogu provjeriti drugi istraživači. Reproducibilnost znači da vas može
provjeriti računalo, pa i vi sami nakon duljeg vremena. AI bitno snižava trošak proizvodnje
rezultata, pa provjera postaje najsporiji dio posla. Otud rečenica koja nosi cijeli sat, a ona
glasi **alat predlaže, vi odgovarate**.

## Pet redaka koje publika nosi kući

| | |
|---|---|
| **Jedno pitanje** | Tko ovo može provjeriti i uz koliki trošak? |
| **Tri stupa** | otvoreno · reproducibilno · AI podržano |
| **Jedna ljestvica** | četiri prečke, popnite se za jednu |
| **Jedna petlja** | opiši, isplaniraj, odobri, izvrši, **provjeri**, zapiši |
| **Tri pogreške** | curenje · odstupanje · pokrivenost |

## Ljestvica reproducibilnosti

Reproducibilnost nije stanje koje se ima ili nema, nego niz prečki po kojima se penje.

| Prečka | Što znači |
|---|---|
| **0** | objavljen je samo članak u PDF obliku |
| **1** | postoji stranica projekta, upute za citiranje i metapodaci, **ovaj projekt danas** |
| **2** | kod je javan, a podaci dokumentirani popisom izvora i kodnom knjigom |
| **3** | jedna naredba gradi sve, okruženje je zaključano i sustav to redovito provjerava |

Ograničeni podaci nisu razlog za ostanak na nultoj prečki. Naš izvorni korpus je licenciran i ne
smije se dijeliti dalje, ali kod, pravila pretrage, izvedeni agregati, popis izvora i sjeme
slučajnih brojeva smiju izaći u javnost.

## Sadržaj

| Datoteka | Što je |
|---|---|
| [`slides/slides.qmd`](slides/slides.qmd) | prezentacija od 24 slajda, Quarto i reveal.js, na hrvatskom |
| [`SCRIPT.md`](SCRIPT.md) | tijek radionice minutu po minutu, što pokazati, napraviti i reći |
| [`RUNBOOK.md`](RUNBOOK.md) | rukovanje demonstracijom, tri podmetnute pogreške, pravilo 60 sekundi |
| [`handout.html`](handout.html) | jedna stranica za tisak, A4 obostrano |
| [`GLOSSARY.md`](GLOSSARY.md) | hrvatsko i englesko nazivlje |
| [`READING.md`](READING.md) | dvanaest naslova u tri skupine |
| [`pipeline/`](pipeline/) | cjevovod koji se gradi jednom naredbom i sam se provjerava |

## Gradnja materijala

```bash
quarto render slides/slides.qmd      # -> slides/slides.html (samostalan)
cd pipeline && Rscript analysis/run.R  # -> paper/nalaz.html + results/
```

Traži Quarto verzije 1.4 ili novije i R verzije 4.2 ili novije. Bez GPU-a.

## Demonstracija u tri poteza

```bash
cd pipeline
Rscript demo/podmetni.R    # podmetni tri pogreške
Rscript analysis/run.R     # sve tri se prijave u jednom ispisu, rukopis se ne gradi
Rscript demo/vrati.R       # vrati čisto stanje
```

## Ako želite vlastitu kopiju cjevovoda

Mapa [`pipeline/`](pipeline/) je samostalna. Kopirajte je u cijelosti u novi repozitorij i radi bez
ijedne izmjene jer ništa u njoj ne ovisi o ostatku ovog projekta.

## Napomena o podacima

Podaci koji se koriste u demonstraciji su **izmišljeni i kalibrirani**, dakle nisu izvorni. Brojke
su reda veličine objavljenih, ali nisu rezultati istraživanja i ne smiju se tako citirati. Zamjena
stvarnim izvozom opisana je u [`pipeline/data/make_data.R`](pipeline/data/make_data.R).

## Licencija

Kod MIT, tekst CC BY 4.0.
