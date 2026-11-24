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
uz grafikon očekivanja, a odjeljak o provjerama i ograničenjima počinje na petoj stranici.
Pri izmjeni teksta treba ponovno provjeriti broj stranica, potpise grafikona,
čitljivost oznaka i položaj podnožja. Grafikoni u `slike/` ostaju izvorni prikazi
podataka; oblikovanje dokumenta ne mijenja njihove vrijednosti.

Tekst je 24. studenoga 2026. usklađen s aktualnih 27 slajdova u
`docs/slides/index.html`. Deskriptivni prozor je siječanj 2021. do kolovoza
2026., a ekonometrijski uzorak 2021. do 2023. Sažetak izlaganja u
`materials/abstract-presentation.md` i `docs/abstracts/index.html` koristi iste
definicije, obuhvate i ograničenja.

Tri SVG grafikona u `slike/` identične su kopije grafikona prezentacije.
Lokalne kopije omogućuju samostalan Quarto/Typst render bez izlaska iz
korijena dokumenta. Prije obnove PDF-a nakon promjene slajdova osvježiti ih:

```powershell
Copy-Item docs/slides/figures-20260928/annual-share.svg materials/brief/slike/
Copy-Item docs/slides/figures-original/expectations.svg materials/brief/slike/
Copy-Item docs/slides/figures-media-20260921/government-share.svg materials/brief/slike/
```

Godišnji udio dolazi iz spremljenih agregata izdanja 2026-09-28. Očekivanja
koriste tablicu 7a izvornog rada, uz linearno mapiranje i Bonferronijevu
korekciju. Vladin panel završava u svibnju 2026. i ima prazninu od siječnja
do ožujka 2024. Izvori i ograničenja detaljno su navedeni u
`docs/slides/README.md`. Stariji PNG grafikoni ostaju kao arhivski materijal
i više se ne uključuju u PDF.
