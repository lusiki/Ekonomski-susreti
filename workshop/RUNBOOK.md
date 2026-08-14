# Rukovanje demonstracijom (minute 28–45)

Demonstracija je **zaštićeni blok**. Ako ranije sekcije odu u prekovrijeme,
režite slajdove iz sekcije 5, nikad demonstraciju. Ovo je scenarij, sigurnosna
mreža i proba.

Sve naredbe pokreću se iz [`projekt/`](projekt/).

**Redoslijed je namjeran. Prvo korist, pa onda šteta.** Stara verzija ove
radionice pokazivala je samo kako se agent uhvati u grešci, pa je publika
izlazila uvjerena u provjere, a ne u AI. Prvi dio to ispravlja.

---

## Prije izlaganja (dan ranije, pa opet 30 minuta prije)

- [ ] **Kopirajte repozitorij izvan sinkronizirane mape.** Dropbox i OneDrive
      zaključavaju datoteke i Quarto povremeno padne pri čišćenju privremenih
      mapa. Ovo je najčešći uzrok pada demonstracije.
- [ ] `Rscript setup.R`, dakle svi paketi prisutni i Quarto pronađen.
- [ ] `Rscript analysis/run.R` mora završiti s
      `== OK: sve izgradeno i provjereno ==`. Time se ujedno zagrijava sve što
      se kasnije gradi.
- [ ] Otvorite jednu agentsku sesiju unaprijed, da prvi odgovor ne čeka.
- [ ] **Snimite oba dijela demonstracije** i držite snimke **na jedan pritisak
      tipke**.
- [ ] Jednom uvježbajte prvi dio do kraja. On je jedini dio koji ovisi o tome
      što će agent napraviti, pa je i jedini koji može iznenaditi.
- [ ] Terminal na prezentacijskoj veličini fonta, tamno na svijetlom,
      obavijesti isključene.
- [ ] Provjerite da je `git` identitet postavljen i da ste na grani na kojoj
      želite raditi.

**Greške podmetnite u zadnjoj minuti prije demonstracije**, oko minute 27:45,
dok govorite zadnju rečenicu sekcije 3.

```bash
Rscript demo/podmetni.R
```

Ispisuje što je točno promijenjeno. Sve promjene zapisane su u `demo/.backup/`
i vraćaju se s `Rscript demo/vrati.R`.

> **Zašto se greške podmeću prije prvog dijela.** Prvi dio je zadatak koji ne
> dira ništa od troje pokvarenog, pa agent radi normalno i gradnja u prvom
> dijelu **ipak pukne na kraju**. To je dobro i planirano. Ako želite da prvi
> dio prođe potpuno čisto, podmetnite greške tek na minuti 38, između dva
> dijela. Odlučite prije izlaganja i držite se toga.

---

## Prvi dio · korist · minute 30–38

### Što agent radi

Zadatak je stvaran, malen i vidljiv. Hrvatska u odnosu na prosjek
europodručja, kao treća slika i kao rečenica u tekstu.

### Zahtjev koji upisujete

> Dodaj treću sliku koja uspoređuje Hrvatsku s neponderiranim prosjekom
> europodručja, za inflaciju, kroz cijelo razdoblje uzorka. Slika ide u
> `R/slike.R` kao zasebna funkcija, poziva se iz `analysis/run.R`, i prati
> postojeći crno bijeli predložak. Dodaj i u `results/procjene.json` godinu i
> visinu vrhunca inflacije u Hrvatskoj, pa to spomeni jednom rečenicom u
> odjeljku Rezultati. Prvo mi daj plan i čekaj odobrenje.

### Što pripovijedati

| Minuta | Na ekranu | Što govorite |
|---|---|---|
| 30–32 | `CLAUDE.md` otvoren | „Ustav projekta. Kratak i čitljiv. **Ovo je sve što agent zna** o projektu." |
| 32–34 | Zahtjev, agent ulazi u **plan** | „Jedna rečenica na hrvatskom. Primijetite da **još nije dirnuo nijednu datoteku.**" |
| 34–35 | Plan naglas, koje datoteke i koje naredbe. **Odobrite.** | „Ovo odobrenje je trenutak delegiranja. Odavde radi sam dok se ne javi." |
| 35–38 | Izvršavanje pod ogradama | Naracija ograde. Smije `Rscript`, pita za commit, **ne smije** `data/restricted/`. |

**Ono što treba pokazati na kraju prvog dijela.** Otvorite `paper/nalaz.qmd` i
pokažite da nova rečenica sadrži `` `r hr(p$hr_vrh, 1)` ``, a ne broj.

**KAŽI** — „Pogledajte što je napisao. **Nije upisao brojku.** Napisao je
referencu na procjenu. Nije mogao drukčije, jer bi gradnja pukla. To nije
pristojnost agenta nego pravilo iz `CLAUDE.md` koje provjera provodi."

### Ako agent zapne ili napravi nešto neočekivano

To je u redu i vrijedi to reći naglas. Ako plan izgleda krivo, **odbijte ga
pred publikom** i tražite drugi. To je vjerodostojniji prizor od uspjeha iz
prve.

Ako stoji dulje od 60 sekundi, prijeđite na snimku.

---

## Drugi dio · šteta · minute 38–43

### Tri greške i što svaka pokazuje

| # | Greška | Gdje | Uhvati je |
|---|---|---|---|
| 1 | **Curenje**, redak iz `data/restricted/` zalijepljen u tekst | `paper/nalaz.qmd` | `ograda` |
| 2 | **Odstupanje**, koeficijent `0,45` upisan rukom | `paper/nalaz.qmd` | `provenijencija` |
| 3 | **Pokrivenost**, Grčka označena kao `GR` umjesto `EL` | `R/zemlje.R` | `pokrivenost` |

Treća je najvažnija i najtiša. Panel padne s **220 na 209** opažanja, nagib se
pomakne s **0,61 na 0,69**, a **ništa ne pukne**. Kod se izvrši, slike se
nacrtaju, tekst se sastavi.

### Ispis koji tražite (minuta 38)

```
== Provjere ================================================
  [GRESKA] ograda -- ogranicen sadrzaj procurio u: paper/nalaz.qmd
           Sadrzaj iz data/restricted/ ne ulazi ni u jedan izlaz.
  [GRESKA] pokrivenost/zemlje -- panel ima 19 zemalja umjesto 20.
           Nedostaje: GR
           Provjerite oznake zemalja u R/zemlje.R. Grcka je EL, a ne GR.
  [ok]     pokrivenost/agregati
  [GRESKA] pokrivenost/uravnotezen -- panel ima 209 redaka umjesto 220 (20 zemalja x 11 godina).
  [ok]     shema/varijable
  [ok]     shema/raspon
  [GRESKA] provenijencija -- broj upisan rukom u odjeljku Rezultati:
           0,45 postotna boda uz standardnu pogresku .
           Svaki broj mora doci iz results/procjene.json.
Error: Provjere nisu prosle: 4 od 7. Rukopis se ne gradi.
```

Zadržite se na zadnjem retku. **Rukopis se ne gradi**, to je cijela poanta.

### Vrhunac, minute 40–42

Prijeđite gore na redak `Nedostaje: GR` i zaustavite se.

**KAŽI** — „Eurostat Grčku označava kao **EL**. Vi ste, kao i cijeli ostatak
svijeta, napisali **GR**. Panel je izgubio jednu zemlju i jedanaest redaka."

**NAPRAVI** Pokažite gornji redak ispisa gradnje, `podaci: 209 opazanja, 19
zemalja`, koji je prošao **prije** provjera i nikoga nije uznemirio.

**KAŽI** — „I evo gdje je to bilo napisano cijelo vrijeme. Prošlo je pokraj
mene. **Ništa nije puklo.** Da nema donjeg dijela ispisa, ovaj bi rad izašao
van s devetnaest zemalja i s krivim koeficijentom."

### Zatvaranje, minute 42–43

```bash
Rscript demo/vrati.R
Rscript analysis/run.R    # sve zeleno
git diff
```

**KAŽI** — „Malo, pregledno, povratno. To je cijela petlja."

---

## Što publika treba ponijeti iz svakog takta

- **Plan** → dogovor prije akcije.
- **Referenca umjesto broja** → korist, i to nevidljiva dok se ne pokvari.
- **Ograda** → zabrana je datoteka, ne dobra namjera.
- **Hvatanje** → poštenje. *Ovdje se skeptici obraćaju.*
- **`git diff` i commit** → povratnost.

---

## Ako zapne, pravilo 60 sekundi

Ako bilo što stoji dulje od **60 sekundi**, dakle spor odgovor modela, mreža
ili neočekivana greška, **prijeđite na snimku bez isprike i nastavite
pripovijedati.** Ne otklanjajte kvarove uživo. Snimka pokazuje iste taktove,
a vaša naracija je ono što nosi.

Pripremljeno, po redoslijedu:

1. Snimka prvog dijela, od zahtjeva do gotove treće slike.
2. Snimka ispisa s tri greške i porukom da se rukopis ne gradi.
3. Snimka čistog prolaza.

---

## Poslije demonstracije, vraćanje

```bash
Rscript demo/vrati.R      # vrati izvorne datoteke
git checkout -- .         # ako je prvi dio ostavio izmjene koje ne zelite
Rscript analysis/run.R    # potvrdi da je sve zeleno
```

Napravite to prije nego što nešto pushate ili prije sljedeće probe, da
repozitorij koji ljudi kloniraju bude u čistom stanju.

> Prvi dio demonstracije mijenja `R/slike.R`, `analysis/run.R`,
> `R/provenijencija.R` i `paper/nalaz.qmd`. `demo/vrati.R` **ne vraća te
> izmjene** jer ih nije on napravio. Za to služi `git checkout`.

---

## Šalabahter (zalijepite na laptop)

```
podmetni → CLAUDE.md → ZAHTJEV (plan prvo) → odobri → pripovijedaj ogradu
   → prvi dio radi → POKAŽI REFERENCU, NE BROJ
   → run.R → TRI GRESKE → zadrzi se na EL/GR → vrati.R → zeleno → git diff
                                     |  zapne >60 s → snimka
```
