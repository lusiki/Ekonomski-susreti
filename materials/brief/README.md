# Sažeti prikaz istraživanja

Izvor je `pregled.qmd`, a objavljeni PDF nalazi se u
`docs/downloads/Pregled-istrazivanja.pdf`.

Za obnovu iz korijena repozitorija:

```sh
quarto render materials/brief/pregled.qmd --to typst
```

Izlaz `materials/brief/pregled.pdf` treba nakon provjere kopirati na objavljenu
putanju. Quarto koristi lokalna pisma iz `fonts/`. Raspored je provjeren s
Quarto 1.9.38 i Typst 0.14.2.

Prikaz ima pet stranica. Prijelomi u izvoru drže upozorenje o prediktivnoj vezi
uz grafikon očekivanja, a odjeljak o pouzdanosti nalaza počinje na petoj stranici.
Pri izmjeni teksta treba ponovno provjeriti broj stranica, potpise grafikona,
čitljivost oznaka i položaj podnožja. Grafikoni u `slike/` ostaju izvorni prikazi
podataka; oblikovanje dokumenta ne mijenja njihove vrijednosti.
