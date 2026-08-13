# Pravilo: ništa nije gotovo dok se ne izgradi

Vrijedi za svaku izmjenu u `R/`, `analysis/`, `paper/` i `data/`.

## Prije nego kažeš "gotovo"

1. Pokreni `Rscript analysis/run.R`.
2. Sve provjere moraju proći. Ako neka padne, popravi uzrok — ne provjeru.
3. Prijavi što se promijenilo **brojčano**: koji je koeficijent bio, koji je
   sada, i koliko se promijenio broj objava u korpusu.

## Nikad

- Ne mijenjaj granice u `R/config.R` da bi provjera prošla.
- Ne upisuj rezultat rukom u `paper/nalaz.qmd`.
- Ne uređuj datoteke u `results/` — one su generirane.
- Ne diraj `data/restricted/`.

## Ako provjera padne

Prijavi mi koja je pala i što misliš da je uzrok, prije nego počneš popravljati.
Provjera koja padne je informacija, ne prepreka.
