# AI u ekonomskim istraživanjima

Šezdesetominutna radionica Luke Sikića. Kako AI ugraditi u istraživački
repozitorij, a ne u prozor preglednika.

[**Slajdovi**](https://lusiki.github.io/Ekonomski-susreti/workshop/slides/) ·
[rukovanje demonstracijom](RUNBOOK.md) ·
[prijenos na vaš projekt](PRESADI.md) · [repozitorij](projekt/) ·
[pojmovnik](GLOSSARY.md) · [literatura](READING.md)

## Ideja

Umjetna inteligencija u istraživanju danas se najčešće koristi u prozoru
preglednika, dakle izvan projekta na kojem se radi. Kod se prenosi van,
odgovor se prenosi natrag, a alat pritom ne poznaje strukturu projekta, ne
može pokrenuti nijedan njegov korak i njegov se rad ne može provjeriti
sredstvima samog projekta.

Radionica pokazuje što se mijenja kada se alat premjesti u repozitorij. Ta
razlika je metodološka, a ne stvar udobnosti, jer je repozitorij jedino
mjesto na kojem se može podmiriti ono što je umjetna inteligencija zapravo
stvorila, a to je dug provjere.

> **Izvršavanje je pojeftinilo. Provjera nije.**

Dok ste kod pisali sami, provjeravali ste ga usput, u razmacima od desetak
redaka. Agent vraća dvjesto redaka odjednom, pa se provjera odgađa i
nakuplja. Dug provjere je razlika između koda koji daje rezultat i koda za
koji znate zašto ga daje, a dospijeva kasnije, u recenziji i u pitanju
koautora o podrijetlu pojedinog broja.

Odgovor nije veća disciplina nego četiri datoteke u repozitoriju koje taj
dug naplaćuju pri svakom pokretanju.

## Pet redaka koje publika odnosi

| | |
|---|---|
| **Jedan pojam** | dug provjere, i nakuplja se dok ga ne podmirite |
| **Dvije odluke** | kontekst i dopuštenja, trećega nema |
| **Četiri datoteke** | ustav, ograde, pravilo, provjere |
| **Jedna petlja** | opiši, isplaniraj, odobri, izvrši, **provjeri**, zapiši |
| **Jedno pitanje** | biste li primijetili da je ovo krivo? |

## AI sloj, četiri datoteke

Cijela je poanta da ih ima malo i da stanu na jedan ekran.

| Datoteka | Što je | Sprječava |
|---|---|---|
| `CLAUDE.md` | kontekst koji agent čita svaku sesiju | povratak na opće pretpostavke |
| `.claude/settings.json` | dopuštenja, popis dopuštenog i zabranjenog | da samostalan proces dira što god želi |
| `.claude/rules/provjera.md` | pravilo koje se učitava uz izmjenu koda | da se posao proglasi gotovim bez gradnje |
| `tests/checks.R` | provjere koje ruše gradnju | da uvjerljiva besmislica uđe u tekst |

Peta je git, ali git već imate.

## Gdje agenta pustiti, a gdje ne

Podjela ne ide po tome koliko je zadatak zahtjevan nego po tome biste li
prepoznali pogrešan ishod.

|  | lako izvršiti | teško izvršiti |
|---|---|---|
| **lako provjeriti** | delegira se bez zadrške | ovdje je dobitak najveći |
| **teško provjeriti** | uz nadzor, korak po korak | ovdje nastaju tihe greške |

Na primjeru iz radionice, spajanje dviju Eurostatovih tablica provjerava se
brojem redaka na izlazu, pa se delegira bez zadrške. Odabir oznaka zemalja
ne provjerava se uvidom jer panel izgleda uredno u oba slučaja, pa taj korak
dobiva provjeru zapisanu u kodu. Izbor između fiksnih učinaka zemlje i
fiksnih učinaka zemlje i godine mijenja pitanje na koje odgovarate, pa se ne
delegira.

## Primjer

Phillipsova krivulja u dvadeset zemalja europodručja od 2014. do 2024.
godine. Podaci su dvije javne Eurostatove tablice, jedna za harmonizirani
indeks potrošačkih cijena i jedna za stopu nezaposlenosti.

Primjer je namjerno običan. Svatko u dvorani zna što je Phillipsova
krivulja, podaci su javni i preuzimaju se jednom skriptom, a cijeli lanac
od podatka do rečenice pročita se naglas u dvije minute. Radionica nije o
nalazu nego o tome kako je nalaz nastao.

## Sadržaj

| Datoteka | Što je |
|---|---|
| [`slides/slides.qmd`](slides/slides.qmd) | prezentacija, Quarto i reveal.js, na hrvatskom |
| [`RUNBOOK.md`](RUNBOOK.md) | rukovanje demonstracijom, tri podmetnute greške |
| [`PRESADI.md`](PRESADI.md) | kako AI sloj prenijeti na vlastiti projekt |
| [`handout.html`](handout.html) | jedna stranica za tisak, A4 obostrano |
| [`GLOSSARY.md`](GLOSSARY.md) | hrvatsko i englesko nazivlje |
| [`READING.md`](READING.md) | dvanaest naslova u tri skupine |
| [`projekt/`](projekt/) | repozitorij koji se klonira i pokreće jednom naredbom |

## Gradnja materijala

```bash
Rscript workshop/build.R    # slajdovi, projekt i objava na stranicu
```

Ili odvojeno.

```bash
quarto render slides/slides.qmd        # -> slides/slides.html
cd projekt && Rscript analysis/run.R   # -> paper/nalaz.html + results/
```

Traži Quarto verzije 1.4 ili novije i R verzije 4.2 ili novije. Bez GPU-a.

## Demonstracija u tri poteza

```bash
cd projekt
Rscript demo/podmetni.R    # podmetni tri greške
Rscript analysis/run.R     # sve tri se prijave u jednom ispisu, nalaz se ne gradi
Rscript demo/vrati.R       # vrati čisto stanje
```

## Ako želite vlastitu kopiju

Mapa [`projekt/`](projekt/) je samostalna. Kopirajte je u cijelosti u novi
repozitorij i radi bez ijedne izmjene jer ništa u njoj ne ovisi o ostatku
ovog projekta. Kada je vidite kako radi, prijeđite na [`PRESADI.md`](PRESADI.md)
i stavite isti sloj na projekt koji već imate.

## Napomena o podacima

Podaci su stvarni i javni. Izvor su Eurostatove tablice `prc_hicp_aind` i
`une_rt_a`. Mapa `projekt/data/restricted/` sadrži izmišljenu datoteku koja
stoji na mjestu mikropodataka koji u stvarnom projektu ne bi smjeli izaći.

## Licencija

Kod MIT, tekst CC BY 4.0.
