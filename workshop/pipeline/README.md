# Demonstracijski cjevovod — radionica Ekonomski susreti

Mali, potpun istraživački cjevovod: od sirovih naslova do rukopisa u kojem
**nijedan broj nije upisan rukom**. Služi kao pokazni objekt na radionici
*Otvoreno, reproducibilno i AI-podržano istraživanje*.

> **Podaci su kalibrirani, ne izvorni.** Izvorni medijski korpus je licenciran
> i ne redistribuira se. Brojke su reda veličine objavljenih, ali nisu
> rezultati istraživanja i ne smiju se tako citirati.

## Pokretanje

```bash
Rscript setup.R          # provjeri pakete
Rscript analysis/run.R   # izgradi sve
```

Ako prođe, na kraju piše `== OK: sve izgradeno i provjereno ==`, a rukopis je
u `paper/nalaz.html`.

Traži: R ≥ 4.2, Quarto ≥ 1.4. Bez GPU-a, bez posebnog hardvera.

## Lanac

```
data/raw/naslovi.csv          sirovi naslovi
        ↓  R/korpus.R          pravilo pretrage (mjerni sloj)
        ↓  R/podaci.R          udjeli i IAG
data/derived/tjedni_panel.csv tjedni agregati
        ↓  R/modeli.R          OLS + Newey-West, lokalne projekcije
        ↓  R/slike.R           dvije slike
results/procjene.json         svi brojevi na jednom mjestu
        ↓  paper/nalaz.qmd     tekst koji samo čita procjene.json
```

Svaki izložak ima funkciju koja ga proizvodi:

| Izložak | Funkcija |
|---|---|
| Slika 1 (jaz i inflacija) | `R/slike.R::slika_jaz` |
| Slika 2 (lokalne projekcije) | `R/slike.R::slika_projekcije` |
| Brojevi u tekstu | `R/provenijencija.R::skupi_procjene` |

## Tri provjere

`tests/checks.R`, jedna po stupu radionice:

| Provjera | Stup | Hvata |
|---|---|---|
| **ograda** | otvoreno | sadržaj iz `data/restricted/` u bilo kojem izlazu |
| **pokrivenost** | mjerenje, AI | pravilo pretrage koje ne čita hrvatski pravopis |
| **provenijencija** | reproducibilno | broj upisan rukom u odjeljku *Rezultati* |

Sve tri se izvršavaju u jednom prolazu, pa se u jednom ispisu vide sve greške.

## Demonstracija

```bash
Rscript demo/podmetni.R   # podmetni tri greške
Rscript analysis/run.R    # provjere ih uhvate, rukopis se ne gradi
Rscript demo/vrati.R      # vrati čisto stanje
```

Detaljan scenarij: [`../RUNBOOK.md`](../RUNBOOK.md).

## Agent

`CLAUDE.md` je ustav projekta; `.claude/settings.json` su ograde
(dopušteno `Rscript` i `quarto render`, pitanje za `git commit`, zabranjeno
čitanje `data/restricted/`); `.claude/rules/provjera.md` je pravilo koje se
učitava uz izmjene koda.

Početni prompt:

> Radim na demonstracijskom cjevovodu u ovom repozitoriju. Pročitaj `CLAUDE.md`
> i konfiguraciju u `.claude/`. Za svaki netrivijalan zadatak prvo napravi plan
> i čekaj moje odobrenje. Nakon odobrenja radi samostalno i vrati se samo za
> odluke. Prije nego kažeš da je gotovo, pokreni `Rscript analysis/run.R` i
> prijavi brojčano što se promijenilo.

## Napomena o Dropboxu

Ako repozitorij stoji u sinkroniziranoj mapi (Dropbox, OneDrive), Quarto
povremeno ne uspije obrisati privremene datoteke jer ih sinkronizacija drži
zaključanima. Za demonstraciju držite kopiju izvan sinkronizirane mape.

## Licencija

Kod MIT, tekst CC BY 4.0.
