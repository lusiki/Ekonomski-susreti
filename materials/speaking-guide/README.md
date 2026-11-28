# Govorni vodič za izlaganje

`lecture.json` sadrži govornu osnovu za 22 slajda i šest rezervnih, raspored
vremena, upute za pokazivanje grafikona, prijelaze i kratke napomene za
izlagača. Jedna kartica odgovara jednom slajdu. Kartice rezervnih slajdova nose
`"backup": true` i slijede nakon završnog slajda. Tekst vodi od mjesečnih putanja do procjena odnosa,
tumačenja i praktičnih pitanja o komunikaciji.

Dokument je `materials/speaking-guide/Govorni-vodic-izlaganje.pdf`. Ima
naslovnicu, pregled izlaganja, stranicu s niti koja povezuje izlaganje, po jednu
stranicu za svaki slajd i odgovore za
raspravu. Minijature vode na odgovarajući slajd u pregledniku.

Za radionicu su dostupni [cjeloviti vodič](../../docs/workshop/vodic.pdf) i [raspored s pitanjima za izlagača](../../workshop/TIJEK.md).

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
