# Pokazni istraživački projekt s AI slojem

Mali, potpun ekonomski projekt. Od dvije javne Eurostatove tablice do kratkog
nalaza u kojem nijedan broj nije upisan rukom. Uz njega su četiri datoteke
koje čine AI sloj, dakle sve što treba da agent može raditi unutar projekta
umjesto pokraj njega.

Ovo je pokazni objekt radionice [AI u ekonomskim istraživanjima](../).
Klonirajte ga, pokrenite i onda presadite AI sloj na vlastiti projekt.
Upute za presađivanje su u [`../PRESADI.md`](../PRESADI.md).

## Pokretanje

```bash
Rscript setup.R          # provjeri pakete
Rscript analysis/run.R   # izgradi sve
```

Ako prođe, na kraju piše `== OK: sve izgradeno i provjereno ==`, a nalaz je u
`paper/nalaz.html`. Traži R verzije 4.2 ili novije i Quarto verzije 1.4 ili
novije. Bez GPU-a i bez interneta, jer su podaci zapisani u repozitoriju.

## Pitanje

Phillipsova krivulja tvrdi da idu zajedno niža nezaposlenost i viša inflacija.
Projekt to gleda na dvadeset zemalja europodručja od 2014. do 2024. godine i
pita vrijedi li ista veza prije i poslije inflacijskog vala.

Rezultat je namjerno jednostavan i nije doprinos literaturi. Svrha je da se
cijeli lanac od podatka do rečenice pročita naglas u dvije minute.

## Lanac

```
data/raw/hicp.csv              Eurostat, 45 oznaka
data/raw/nezaposlenost.csv     Eurostat, 38 oznaka
        ↓  R/zemlje.R           odabir zemalja        ← mjerni sloj
        ↓  R/podaci.R           spajanje u panel
data/derived/panel.csv         220 opažanja, 20 zemalja
        ↓  R/modeli.R           četiri regresije
        ↓  R/slike.R            dvije slike
results/procjene.json          svi brojevi na jednom mjestu
        ↓  paper/nalaz.qmd      tekst koji samo čita procjene.json
```

Svaki izložak ima funkciju koja ga proizvodi.

| Izložak | Funkcija |
|---|---|
| Slika 1, inflacija i nezaposlenost kroz vrijeme | `R/slike.R::slika_vrijeme` |
| Slika 2, Phillipsova krivulja u dva razdoblja | `R/slike.R::slika_phillips` |
| Brojevi u tekstu | `R/provenijencija.R::skupi_procjene` |

## AI sloj, četiri datoteke

| Datoteka | Što je | Sprječava |
|---|---|---|
| [`CLAUDE.md`](CLAUDE.md) | kontekst koji agent čita svaku sesiju | povratak na opće pretpostavke |
| [`.claude/settings.json`](.claude/settings.json) | ograde, popis dopuštenog i zabranjenog | da samostalan proces dira što god želi |
| [`.claude/rules/provjera.md`](.claude/rules/provjera.md) | pravilo koje se učitava uz izmjenu koda | da se posao proglasi gotovim bez gradnje |
| [`tests/checks.R`](tests/checks.R) | provjere koje ruše gradnju | da uvjerljiva besmislica uđe u tekst |

Peta je git, ali git već imate.

## Tri provjere

`tests/checks.R`, po jedna za svaki način na koji agent tiho ošteti projekt.

| Provjera | Hvata |
|---|---|
| **ograda** | sadržaj iz `data/restricted/` u bilo kojem izlazu |
| **pokrivenost** | mjerni sloj koji je promijenio uzorak |
| **provenijencija** | broj upisan rukom u odjeljku Rezultati |

Sve tri se izvršavaju u jednom prolazu, pa se u jednom ispisu vide sve greške,
a ne samo prva.

## Demonstracija

```bash
Rscript demo/podmetni.R   # podmetni tri greške
Rscript analysis/run.R    # provjere ih uhvate, nalaz se ne gradi
Rscript demo/vrati.R      # vrati čisto stanje
```

Treća greška je najtiša. Grčka je u Eurostatu označena kao `EL`, a ne `GR`.
Tko filtrira po `GR`, tiho izgubi cijelu zemlju. Panel padne s 220 na 209
opažanja, nagib se pomakne s 0,61 na 0,69, a ništa ne pukne. Kod se izvrši,
slike se nacrtaju, tekst se sastavi. Samo je rezultat drugi.

Detaljan scenarij je u [`../RUNBOOK.md`](../RUNBOOK.md).

## Osvježavanje podataka

```bash
Rscript data/preuzmi.R    # traži internet i paket eurostat
```

Skripta zapisuje sve što Eurostat vrati, uključujući agregate i zemlje izvan
europodručja. Odabir zemalja je posao mjernog sloja u `R/zemlje.R`, a ne posao
preuzimanja, upravo zato da se taj odabir može provjeriti.

## Podaci

Podaci su stvarni i javni. Izvor su Eurostatove tablice `prc_hicp_aind` za
harmonizirani indeks potrošačkih cijena i `une_rt_a` za stopu nezaposlenosti.
Mapa `data/restricted/` sadrži izmišljenu datoteku koja stoji na mjestu
mikropodataka koji u stvarnom projektu ne bi smjeli izaći.

## Napomena o sinkroniziranim mapama

Ako repozitorij stoji u Dropboxu ili OneDriveu, Quarto povremeno ne uspije
obrisati privremene datoteke jer ih sinkronizacija drži zaključanima. Za
demonstraciju držite kopiju izvan sinkronizirane mape.

## Licencija

Kod MIT, tekst CC BY 4.0.
