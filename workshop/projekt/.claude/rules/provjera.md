# Pravilo: nista nije gotovo dok se ne izgradi

Vrijedi za svaku izmjenu u `R/`, `analysis/`, `paper/` i `data/`.

Ovo pravilo postoji zbog jedne stvari. Izvrsavanje je postalo jeftino, a
provjera nije. Ako se svaka izmjena ne provjeri odmah, dug provjere se
gomila i na kraju ga nitko ne plati.

## Prije nego kazes da je gotovo

1. Pokreni `Rscript analysis/run.R`.
2. Sve provjere moraju proci. Ako neka padne, popravi uzrok, ne provjeru.
3. Prijavi sto se promijenilo **brojcano**. Koliko je zemalja u panelu prije
   i poslije, koliko opazanja, koji je koeficijent bio i koji je sada.

Prijava bez brojeva nije prijava. Recenica da je sve u redu ne pomaze
nikome jer se ne moze provjeriti.

## Nikad

- Ne mijenjaj granice ni konstante u `R/config.R` da bi provjera prosla.
- Ne upisuj rezultat rukom u `paper/nalaz.qmd`.
- Ne uredjuj datoteke u `results/` ni `data/derived/`, one su generirane.
- Ne diraj `data/restricted/`.
- Ne mijenjaj izbor specifikacije bez razgovora. Predlozi ga.

## Ako provjera padne

Prijavi koja je pala i sto mislis da je uzrok, prije nego pocnes popravljati.
Provjera koja padne je informacija, a ne prepreka.

## Ako mijenjas mjerni sloj

`R/zemlje.R` odlucuje sto je zemlja, a to odreduje uzorak. Prije bilo kakve
izmjene tamo napisi koliko zemalja i koliko redaka panel ima sada. Poslije
izmjene napisi isto. Ako se broj promijenio, a to nije bila namjera izmjene,
onda si upravo nasao gresku.
