# Ustav projekta

Radimo na demonstracijskom nalazu o institucionalnom jazu u pažnji HNB-a.
Pročitaj ovu datoteku na početku svake sesije. Neka ostane kratka.

## Petlja

    opiši → plan → **ja odobravam** → izvrši → provjeri → **ja commitam** → dalje

## Pet komponenti i kvar koji svaka sprječava

| Komponenta | Gdje | Sprječava |
|---|---|---|
| **Kontekst** | ova datoteka, `.claude/rules/` | da se vratiš na generičke pretpostavke |
| **Plan** | plan prije svake netrivijalne izmjene | da brzo riješiš krivi problem |
| **Ograde** | `.claude/settings.json` | da autonomni proces dira što god želi |
| **Provjera** | `tests/checks.R`, `analysis/run.R` | da uvjerljiva besmislica uđe u tekst |
| **Git** | mali, pregledni commitovi | da se greška ponovi i da se ne možemo vratiti |

## Raspored

- `R/` — funkcije. `R/config.R` drži **sve** konstante. Bez sporednih učinaka pri učitavanju.
- `analysis/run.R` — jedina ulazna točka. Gradi sve i pokreće provjere.
- `data/raw/` — sirovi naslovi. `data/derived/` — tjedni agregati (+ `MANIFEST.txt`).
- `data/restricted/` — **nikad ne čitaj i nikad ne citiraj.** Ograde to zabranjuju.
- `results/` — `procjene.json`, `slike/` (generirano; ne uređuj ručno).
- `paper/nalaz.qmd` — rukopis. Samo **čita** brojeve iz `results/procjene.json`.
- `tests/checks.R` — tri provjere: ograda, pokrivenost, provenijencija.
- `demo/` — skripte za podmetanje i vraćanje grešaka na radionici.

## Naredbe

```bash
Rscript data/make_data.R      # ponovno generiraj demonstracijske podatke
Rscript analysis/run.R        # izgradi sve + provjere + rukopis
Rscript demo/podmetni.R       # podmetni tri greške (radionica)
Rscript demo/vrati.R          # vrati čisto stanje
```

## Tvrda pravila

- **Brojevi.** Svaki broj u odjeljku *Rezultati* je inline referenca na
  `results/procjene.json`. Nikad ne upisuj rezultat rukom — provjera
  provenijencije ruši gradnju na svaki decimalni literal.
- **Mjerni sloj.** Promjena u `R/korpus.R` mijenja zavisnu varijablu. Nikad je
  ne mijenjaj bez pokretanja provjere pokrivenosti i bez prijave koliko se
  promijenio broj objava.
- **Ograničeni podaci.** Sadržaj iz `data/restricted/` ne ulazi ni u prompt,
  ni u kod, ni u tekst, ni u commit poruku.
- **Konstante.** Ako se broj pojavljuje na dva mjesta, jedno je greška. Sve u
  `R/config.R`.
- **Status podataka.** Podaci su kalibrirani, ne izvorni. Svaki izlaz to mora
  reći. Nikad ne predstavljaj ove brojke kao rezultate istraživanja.

## Stanje

Demonstracijski predložak za radionicu. Gradi dvije slike, `procjene.json` i
kratki nalaz čiji su svi brojevi pokriveni kodom.
