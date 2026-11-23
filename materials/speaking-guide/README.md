# Govorni vodič za izlaganje

`lecture.json` sadrži govornu osnovu za 24 slajda, raspored vremena, upute za
pokazivanje grafikona, prijelaze i kratke napomene za izlagača. Jedna kartica
odgovara jednom slajdu. Tekst vodi od mjesečnih putanja do procjena odnosa,
tumačenja i praktičnih pitanja o komunikaciji.

Objavljeni dokument je `docs/downloads/Govorni-vodic-izlaganje.pdf`. Ima
naslovnicu, pregled izlaganja, po jednu stranicu za svaki slajd i odgovore za
raspravu. Minijature vode na odgovarajući slajd u pregledniku.

## Izrada

Iz korijena repozitorija prvo obnoviti slajdove, a zatim vodič:

```sh
python scripts/build-presentation-print.py
node scripts/export-presentation.cjs
python scripts/build-speaking-guide.py
```

Vodič zahtijeva Python pakete `reportlab`, `pymupdf` i `beautifulsoup4`.
Koristi priloženo pismo Roboto. Naslove preuzima iz `docs/slides/index.html`,
a minijature iz upravo izrađenog PDF-a. Radne slike i pregled prijeloma sprema
u zanemarenu mapu `work/speaking-guide/`.

Parametri `--output` i `--work-dir` dopuštaju druge izlazne i radne putanje.
Nakon izmjene treba pregledati sve stranice PDF-a, posebno podudaranje govorne
osnove i slajda te prostor ispod zadnje napomene.
