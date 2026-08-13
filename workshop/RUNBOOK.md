# Rukovanje demonstracijom (minute 30–48)

Demonstracija je **zaštićeni blok**. Ako ranije sekcije odu u prekovrijeme, režite slajdove iz
sekcije 4 — nikad demonstraciju. Ovo je scenarij, sigurnosna mreža i proba.

Sve naredbe pokreću se iz [`pipeline/`](pipeline/).

---

## Prije izlaganja (dan ranije, pa opet 30 minuta prije)

- [ ] **Kopirajte repozitorij izvan sinkronizirane mape.** Dropbox i OneDrive zaključavaju datoteke
      i Quarto povremeno padne pri čišćenju privremenih mapa. Ovo je najčešći uzrok pada demonstracije.
- [ ] `Rscript setup.R` — svi paketi prisutni, Quarto pronađen.
- [ ] `Rscript analysis/run.R` — mora završiti s `== OK: sve izgradeno i provjereno ==`.
      Time se ujedno zagrijava sve što se kasnije gradi.
- [ ] Otvorite jednu agentsku sesiju unaprijed, da prvi odgovor u demonstraciji ne čeka.
- [ ] **Snimite cijeli čisti prolaz** (snimka ekrana) i držite je **na jedan pritisak tipke**.
- [ ] Jednom uvježbajte hvatanje grešaka (dolje), da vam tajming bude pouzdan.
- [ ] Terminal na prezentacijskoj veličini fonta, tamno na svijetlom, obavijesti isključene.
- [ ] Provjerite da je `git` identitet postavljen i da ste na grani na kojoj želite raditi.

**Greške podmetnite u zadnjoj minuti prije početka** (repozitorij do tada ostaje čist):

```bash
Rscript demo/podmetni.R
```

Ispisuje što je točno promijenjeno. Sve promjene su zapisane u `demo/.backup/` i vraćaju se
s `Rscript demo/vrati.R`.

---

## Tri greške i što svaka pokazuje

| # | Greška | Gdje | Stup | Hvata je |
|---|---|---|---|---|
| 1 | **Curenje** — redak iz `data/restricted/` zalijepljen u rukopis | `paper/nalaz.qmd` | otvoreno | `ograda` |
| 2 | **Odstupanje** — koeficijent `0,00243` upisan rukom | `paper/nalaz.qmd` | reproducibilno | `provenijencija` |
| 3 | **Pokrivenost** — isključena normalizacija dijakritike | `R/korpus.R` | mjerenje, AI | `pokrivenost` |

Treća je najvažnija i najtiša: koeficijent padne s **0,0019 na 0,0008**, a **ništa ne pukne**.
Kod se izvrši, slike se nacrtaju, tekst se sastavi. Samo je rezultat kriv.

---

## Taktovi

| Minuta | Na ekranu | Što govorite / radite |
|---|---|---|
| **32–34** | `CLAUDE.md` otvoren ~40 s | „Ustav projekta. Kratak i čitljiv — ovo je sve što agent zna o projektu." |
| **34–36** | Upišete zahtjev (dolje); agent ulazi u **plan** | „Jedna rečenica na hrvatskom. Primijetite da još nije dirnuo nijednu datoteku." |
| **36–38** | Pročitate plan naglas — koje datoteke, koje naredbe, kako će provjeriti. **Odobrite.** | „Ovo odobrenje je trenutak delegiranja. Odavde radi sam dok se ne javi." |
| **38–42** | Izvršavanje pod ogradama | Pripovijedajte ogradu: dopušteno `Rscript` i `quarto render`, pita za `git commit`, **zabranjeno** `data/restricted/`. |
| **42–46** | `Rscript analysis/run.R` — **tri greške u jednom ispisu** | „Tri greške, jedan prolaz, prije nego išta ode van. Ovo je ono što promakne umornom čovjeku pred rok." |
| **46–47** | `Rscript demo/vrati.R`, pa ponovno `run.R` → sve zeleno; `git diff`; commit | „Malo, pregledno, povratno. To je cijela petlja." |

### Zahtjev koji upisujete

> Provjeri stanje projekta: pokreni `Rscript analysis/run.R`, pročitaj što provjere prijavljuju,
> i predloži plan popravka svake greške posebno. Ne mijenjaj ništa dok ne odobrim plan.

Agent će naći sve tri, poredati ih i ponuditi plan. Ako želite kraću varijantu, sami pokrenite
`run.R` i pustite ispis da govori.

### Ispis koji tražite (minuta 42)

```
== Provjere ================================================
  [GRESKA] ograda — ogranicen sadrzaj procurio u: paper/nalaz.qmd
  [GRESKA] pokrivenost/pravilo — pravilo ne prepoznaje: Središnja banka objavila izvješće
  [ok]     pokrivenost/laznipogodak
  [GRESKA] pokrivenost/udio — udio objava o HNB-u u baznom razdoblju je 0.0095, izvan raspona
  [ok]     shema/tjedni
  [ok]     shema/varijable
  [GRESKA] provenijencija — broj upisan rukom u odjeljku Rezultati
Error: Provjere nisu prosle: 4 od 7. Rukopis se ne gradi.
```

Zadržite se na zadnjem retku. **Rukopis se ne gradi** — to je cijela poanta.

---

## Što publika treba ponijeti iz svakog takta

- **Plan** → dogovor prije akcije.
- **Ograda** → zabrana je datoteka, ne dobra namjera.
- **Hvatanje** → poštenje. *Ovdje se skeptici obraćaju.*
- **`git diff` → commit** → povratnost.

---

## Ako zapne — pravilo 60 sekundi

Ako bilo što stoji dulje od **60 sekundi** — spor odgovor modela, mreža, neočekivana greška —
**prijeđite na snimku bez isprike i nastavite pripovijedati.** Ne otklanjajte kvarove uživo.
Snimka pokazuje iste taktove; vaša naracija je ono što nosi.

Pripremljeno, po redoslijedu:

1. Snimka čistog prolaza (na jedan pritisak tipke).
2. Snimka ekrana s ispisom triju grešaka i gotovim `paper/nalaz.html`.

---

## Poslije demonstracije — vraćanje

```bash
Rscript demo/vrati.R      # vrati izvorne datoteke
Rscript analysis/run.R    # potvrdi da je sve zeleno
```

Napravite to prije nego što nešto pushate ili prije sljedeće probe, da repozitorij koji ljudi
kloniraju bude u čistom stanju.

---

## Šalabahter (zalijepite na laptop)

```
podmetni → otvori CLAUDE.md → upiši zahtjev (plan prvo) → odobri → pripovijedaj ogradu
→ run.R → TRI GREŠKE → vrati.R → zeleno → git diff → commit
                                  |  zapne >60 s → snimka
```
