# Ustav projekta

Ovo je prva od cetiri datoteke koje cine AI sloj. Agent je cita na pocetku
svake sesije. Neka ostane kratka, jer dugu nitko ne cita.

Projekt gleda Phillipsovu krivulju u dvadeset zemalja europodrucja na
Eurostatovim podacima. Cilj nije doprinos literaturi nego pokazni primjer
istrazivackog repozitorija koji sam sebe provjerava.

## Petlja

    opisi -> plan -> **ja odobravam** -> izvrsi -> provjeri -> **ja commitam**

Odobrenje plana je trenutak delegiranja. Sve prije toga je razgovor.

## Cetiri datoteke i kvar koji svaka sprjecava

| Datoteka | Sto je | Sprjecava |
|---|---|---|
| `CLAUDE.md` | kontekst, ova datoteka | da se vratis na opce pretpostavke |
| `.claude/settings.json` | dopustenja, popis dopustenog | da samostalan proces dira sto god zeli |
| `.claude/rules/provjera.md` | pravilo uz svaku izmjenu koda | da se posao proglasi gotovim bez gradnje |
| `tests/checks.R` | provjere koje ruse gradnju | da uvjerljiva besmislica ude u tekst |

Peta je git, ali git vec imate.

## Raspored

- `R/` funkcije. `R/config.R` drzi **sve** konstante. Bez sporednih ucinaka
  pri ucitavanju.
- `R/zemlje.R` je **mjerni sloj**. Ovdje se odlucuje sto je zemlja. Greska
  ovdje mijenja uzorak i ne rusi nista.
- `analysis/run.R` jedina ulazna tocka. Gradi sve i pokrece provjere.
- `data/raw/` Eurostatov izvoz, zapisan u repozitoriju. `data/derived/`
  panel i manifest, generirano.
- `data/restricted/` **nikad ne citaj i nikad ne citiraj.** Ograde to
  zabranjuju, a provjera to dokazuje.
- `results/` `procjene.json` i slike. Generirano, ne uredivati rucno.
- `paper/nalaz.qmd` rukopis. Samo **cita** brojeve iz `results/procjene.json`.
- `tests/checks.R` tri provjere, ograda, pokrivenost i provenijencija.
- `demo/` skripte za podmetanje i vracanje gresaka na radionici.

## Naredbe

```bash
Rscript setup.R              # provjeri pakete
Rscript analysis/run.R       # izgradi sve, provjere, rukopis
Rscript data/preuzmi.R       # osvjezi podatke s Eurostata (treba internet)
Rscript demo/podmetni.R      # podmetni tri greske (radionica)
Rscript demo/vrati.R         # vrati cisto stanje
```

## Tvrda pravila

- **Brojevi.** Svaki broj u odjeljku *Rezultati* je inline referenca na
  `results/procjene.json`. Nikad ne upisuj rezultat rukom. Provjera
  provenijencije rusi gradnju na svaki decimalni broj upisan rukom.
- **Mjerni sloj.** Promjena u `R/zemlje.R` mijenja uzorak. Nikad je ne radi
  bez pokretanja provjere pokrivenosti i bez prijave koliko se promijenio
  broj zemalja i broj opazanja.
- **Oznake zemalja.** Eurostat koristi `EL` za Grcku, ne `GR`. Agregati poput
  `EA20` i `EU27_2020` nisu zemlje i ne ulaze u regresiju.
- **Ograniceni podaci.** Sadrzaj iz `data/restricted/` ne ulazi ni u prompt,
  ni u kod, ni u tekst, ni u poruku promjene.
- **Konstante.** Ako se broj pojavljuje na dva mjesta, jedno je greska. Sve
  u `R/config.R`.
- **Specifikacija.** Izbor izmedu fiksnih ucinaka zemlje i fiksnih ucinaka
  zemlje i godine mijenja pitanje na koje odgovaramo. To nije tehnicka
  odluka i ne donosi je agent. Predlozi, ali ne mijenjaj bez razgovora.

## Stanje

Pokazni projekt za radionicu *AI u ekonomskim istrazivanjima*. Gradi dvije
slike, `procjene.json` i kratki nalaz ciji su svi brojevi pokriveni kodom.
