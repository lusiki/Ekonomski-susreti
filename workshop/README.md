# AI u ekonomskim istraživanjima

Šezdesetominutna radionica Luke Sikića. Kako AI ugraditi u istraživački
repozitorij, a ne u prozor preglednika.

[**Slajdovi**](https://lusiki.github.io/Ekonomski-susreti/workshop/slides/) ·
[scenarij](SCRIPT.md) · [rukovanje demonstracijom](RUNBOOK.md) ·
[presađivanje na vaš projekt](PRESADI.md) · [repozitorij](projekt/) ·
[pojmovnik](GLOSSARY.md) · [literatura](READING.md)

## Ideja

Većina istraživača danas koristi AI u prozoru preglednika, dakle izvan
projekta. Kod se kopira van, odgovor se kopira natrag. Agent pritom ne zna
ništa o projektu, ne može ništa pokrenuti i ne može biti provjeren.

Radionica pokazuje što se dogodi kada ga preselite unutra. To nije stvar
udobnosti nego jedini način da se plati ono što je AI zapravo stvorio, a
to je dug provjere.

> **Izvršavanje je pojeftinilo. Provjera nije.**

Dok ste kod pisali sami, provjeravali ste usput, po deset redaka. Agent vam
vrati dvjesto redaka odjednom, pa se provjera odgađa i gomila. Ta razlika
između koda koji radi i koda za koji znate zašto radi je dug provjere, a
kamate se plaćaju na recenziji i kod koautora.

Odgovor nije veća disciplina nego četiri datoteke u repozitoriju koje taj
dug naplaćuju pri svakom pokretanju.

## Pet redaka koje publika nosi kući

| | |
|---|---|
| **Jedan pojam** | dug provjere, i raste dok ga ne pogledate |
| **Dvije ručke** | kontekst i ograda, ništa treće ne postoji |
| **Četiri datoteke** | ustav, ograde, pravilo, provjere |
| **Jedna petlja** | opiši, isplaniraj, odobri, izvrši, **provjeri**, zapiši |
| **Jedno pitanje** | biste li primijetili da je ovo krivo? |

## AI sloj, četiri datoteke

Cijela je poanta da ih ima malo i da stanu na jedan ekran.

| Datoteka | Što je | Sprječava |
|---|---|---|
| `CLAUDE.md` | kontekst koji agent čita svaku sesiju | povratak na opće pretpostavke |
| `.claude/settings.json` | ograde, popis dopuštenog i zabranjenog | da samostalan proces dira što god želi |
| `.claude/rules/provjera.md` | pravilo koje se učitava uz izmjenu koda | da se posao proglasi gotovim bez gradnje |
| `tests/checks.R` | provjere koje ruše gradnju | da uvjerljiva besmislica uđe u tekst |

Peta je git, ali git već imate.

## Gdje agenta pustiti, a gdje ne

Podjela nije po tome koliko je zadatak težak nego po tome biste li
primijetili da je odgovor kriv.

|  | lako izvršiti | teško izvršiti |
|---|---|---|
| **lako provjeriti** | delegirajte bez razmišljanja | ovdje je najveći dobitak |
| **teško provjeriti** | oprez, sjednite pokraj | ovdje se rade tihe štete |

Na primjeru iz radionice, spajanje dviju Eurostatovih tablica provjerite
pogledom na broj redaka i mirno ga delegirate. Odabir oznaka zemalja ne
vidite jer panel izgleda uredno u oba slučaja, pa taj korak dobiva provjeru
u kodu. Izbor između fiksnih učinaka zemlje i fiksnih učinaka zemlje i
godine mijenja pitanje na koje odgovarate, pa se ne delegira uopće.

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
| [`SCRIPT.md`](SCRIPT.md) | tijek radionice minutu po minutu |
| [`RUNBOOK.md`](RUNBOOK.md) | rukovanje demonstracijom, tri podmetnute greške |
| [`PRESADI.md`](PRESADI.md) | kako AI sloj staviti na vlastiti projekt |
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
