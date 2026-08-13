# Scenarij izlaganja — punih šezdeset minuta

*„Otvoreno, reproducibilno i AI-podržano istraživanje”* · radionica na Ekonomskim susretima.

Ovo je **govorni scenarij**: što **napraviti**, što **pokazati** i što **reći**, slajd po slajd.
Prati dva druga dokumenta:

- [`slides/slides.qmd`](slides/slides.qmd) — sam deck (riječi na ekranu);
- [`RUNBOOK.md`](RUNBOOK.md) — vlast nad demonstracijom, minute 30–48. Gdje se scenarij i
  rukovanje razilaze, **rukovanje ima prednost**.

**Jedna sprava nosi cijeli sat.** Istraživanje je tvrdnja plus lanac provjere. Otvorenost čini lanac
javnim, reproducibilnost ga čini ponovljivim, AI čini proizvodnju tvrdnji gotovo besplatnom — i time
lanac pretvara u usko grlo. Ako izgubite nit, vratite se na rečenicu: **agent generira, vi jamčite**.

**Registar.** U dvorani su ekonomisti koji su upravo odslušali izlaganje o IAG-u. Ne prodajemo alat.
Ne obećavamo revoluciju. Cijeli sat drži jedno pitanje: *tko ovo može provjeriti i po kojoj cijeni*.
Izgovorite ga rano, prizemljite ga na demonstraciji, zatvorite njime.

**Retci `KAŽI` su izgovorivi, ne za čitanje naglas.** Deck drži strukturu da vaše oči mogu ostati
na dvorani. Podebljano unutar `KAŽI` označava jedan naglasak po slajdu.

---

## Prije nego itko uđe u dvoranu

- [ ] Proći **predpoletnu listu iz rukovanja** ([`RUNBOOK.md`](RUNBOOK.md)) — `Rscript setup.R`,
      jedan čist prolaz `Rscript analysis/run.R`, otvorena agentska sesija, **snimka čistog prolaza
      na jedan pritisak tipke**, jednom uvježbano hvatanje.
- [ ] Repozitorij **kopiran izvan Dropboxa/OneDrivea** — sinkronizacija zaključava datoteke i Quarto
      povremeno padne pri čišćenju.
- [ ] Terminal na prezentacijskoj veličini fonta, svijetla tema, obavijesti isključene.
- [ ] **Ne podmetati greške još.** Podmeću se u zadnjoj minuti prije početka (vidi minutu 29).
- [ ] Deck u prezentacijskom prikazu; ovaj scenarij ili šalabahter na dohvat oka.

**Vremenska kičma (59 min + pitanja).** Demonstracija je zaštićeni blok. Ako kasnite, režite
**iz sekcije 4** — nikad demonstraciju, nikad zatvaranje.

| Sekcija | Završava | Minuta |
|---|--:|--:|
| Otvaranje — „tri stvari” | 02:00 | 2 |
| 0 · Uvod | 07:00 | 5 |
| 1 · Okvir | 17:00 | 10 |
| 2 · Anatomija | 30:00 | 13 |
| **3 · Demonstracija** | **48:00** | **18** |
| 4 · Granice | 55:00 | 7 |
| 5 · Zaključak | 59:00 | 4 |
| Pitanja | — | do kraja |

---

# Otvaranje · 00:00 – 02:00

### ⏱ 00:00 — Naslovni slajd

**POKAŽI** Naslov. **NAPRAVI** Stanite mirno. Ne dirajte klikač prve dvije rečenice.

**KAŽI** — „Hvala. Sljedećih sat vremena namjerno je usko. Ovo nije pregled svega što bi umjetna
inteligencija mogla učiniti ekonomiji. Ovo je **jedan repozitorij** koji možete klonirati danas
poslijepodne, i tri navike koje se u njemu vide. Idemo od okvira, preko strojarnice, do žive
demonstracije u kojoj ta strojarnica pred vama uhvati tri greške."

**→ prijelaz** — „Evo točno s čime izlazite." *(dalje)*

---

### ⏱ 00:30 — „Sat vremena, tri stvari koje odnosite"

**POKAŽI** Tri kartice. **NAPRAVI** Brojite ih na prste. Fizički.

**KAŽI** —
- „Prvo, **jedan okvir**. Zašto otvorenost, reproducibilnost i AI nisu tri mode nego tri odgovora na isto pitanje."
- „Drugo, **jedna ljestvica**. Gdje je vaš projekt danas i koja je sljedeća prečka. Ne ideal — sljedeća prečka."
- „Treće, **jedan repozitorij**. Cjevovod koji se gradi jednom naredbom i koji sam sebe provjerava."

**KAŽI** *(načelo dizajna)* — „Jedna riječ vodi cijeli sat: **najmanje moguće**. Ne petnaest alata,
ne osamnaest agenata. Najmanji skup dijelova koji istraživanje čini provjerljivim. Ispalo je da su
to **tri provjere i jedna petlja**."

**→ prijelaz** — „Krenimo od broja koji ste upravo čuli." *(dalje)*

---

# 0 · Uvod · 02:00 – 07:00

### ⏱ 02:00 — Razdjelnik „0 · Uvod"

**POKAŽI** Razdjelnik. **NAPRAVI** Pročitajte crtu i idite dalje. Razdjelnici su dah, ne sadržaj.

---

### ⏱ 02:20 — „Jedan broj s prethodnog izlaganja"

**POKAŽI** Citat s koeficijentom **0,00201**. **NAPRAVI** Pustite ga da stoji tri sekunde prije nego
progovorite. Ovo je jedini slajd koji izravno spaja izlaganje i radionicu.

**KAŽI** —
- „Prije nekoliko minuta čuli ste ovu tvrdnju. Porast inflacije za jedan postotni bod širi institucionalni jaz u pažnji za nula zarez nula nula dva jedinice."
- „Neću vas pitati vjerujete li joj. **Pitat ću vas nešto konkretnije: koliko bi vas vremena stajalo da je provjerite?**"

**NAPRAVI** Pustite tišinu. Ako netko odgovori — odlično, to je cijeli sat u jednoj rečenici.

**KAŽI** *(okret)* — „Za većinu radova u ovoj sobi odgovor je: **ne znam, ne mogu, ne u razumnom
vremenu**. I to nije optužba. To je opis stanja struke."

**→ prijelaz** — „A to stanje ima svoju ekonomiju." *(dalje)*

---

### ⏱ 04:00 — „Cijena je asimetrična"

**POKAŽI** Dvije kartice: proizvesti / provjeriti. **NAPRAVI** Ovaj slajd nosi. Usporite.

**KAŽI** —
- „Proizvesti tvrdnju je jeftino, i svake godine jeftinije. Provjeriti tvrdnju je skupo, i **ne postaje jeftinije samo od sebe**."
- „Ta asimetrija je cijeli problem. Ne etika, ne moda, ne alati — asimetrija troška."

**KAŽI** *(teza — izgovorite polako, ovo je kičma sata)* — „Iz nje slijedi jedno pitanje na koje
otvorenost, reproducibilnost i AI daju **tri različita odgovora**: *tko ovo može provjeriti i po
kojoj cijeni?* Sve ostalo večeras je razrada te rečenice."

**→ prijelaz** — „Pogledajmo ta tri odgovora." *(dalje)*

---

# 1 · Okvir · 07:00 – 17:00

### ⏱ 07:00 — Razdjelnik „1 · Okvir"

**POKAŽI** Razdjelnik. **NAPRAVI** Najavite oblik sljedećih deset minuta.

---

### ⏱ 07:20 — „Tri stupa, jedno pitanje"

**POKAŽI** Tablica: tko provjerava. **NAPRAVI** Pokažite prstom na svaki redak.

**KAŽI** —
- „**Otvoreno** znači da vas mogu provjeriti drugi ljudi. Kod, podaci, metapodaci — dostupni."
- „**Reproducibilno** znači da vas može provjeriti stroj, i vi sami za godinu dana. Jedna naredba ponovno gradi sve."
- „**AI-podržano** znači da radite brže — ali samo ako prva dva stupa stoje. Inače brže proizvodite nešto što nitko ne može provjeriti."

**KAŽI** *(naglasak)* — „**Agent generira. Vi jamčite.** AI ne mijenja standard dokaza ni za milimetar.
Mijenja samo cijenu proizvodnje tvrdnji — pa dokazni lanac postaje usko grlo. Zato radionica o AI-u
mora biti i radionica o reproducibilnosti. Drukčije nema smisla."

**→ prijelaz** — „Sad praktično pitanje: gdje ste vi?" *(dalje)*

---

### ⏱ 10:30 — „Ljestvica reproducibilnosti"

**POKAŽI** Četiri prečke, s istaknutom prečkom 1. **NAPRAVI** Ovo je slajd koji ljudi fotografiraju.
Ostanite na njemu.

**KAŽI** —
- „Prečka nula: objavljen je samo PDF. Prečka jedan: postoji stranica projekta, citat i metapodaci. Prečka dva: kod je javan, a podaci dokumentirani. Prečka tri: jedna naredba gradi sve, okruženje je zaključano, a kontinuirana integracija to provjerava pri svakoj izmjeni."
- „**Naš rad koji ste upravo čuli je na prečki jedan.** Ne na tri. Na jedan. Repozitorij ima stranicu, rad, slajdove i `CITATION.cff` — i tu staje."

**NAPRAVI** Ovo je trenutak vjerodostojnosti. Ne ublažavajte ga.

**KAŽI** *(okret)* — „Govorim vam o ljestvici s prečke jedan, ne s vrha. Zato pitanje na kraju sata
nije *jeste li otvoreni*, nego **koju prečku uzimate ove godine**."

**→ prijelaz** — „Ali čekajte — naši podaci ne smiju van. Znači li to da smo zaglavili?" *(dalje)*

---

### ⏱ 13:30 — „Kada podaci ne smiju van"

**POKAŽI** Dvije kartice: ne izlazi / izlazi. **NAPRAVI** Ovo je slajd za koji će vas pola dvorane
zavoljeti, jer opisuje njihovu stvarnost.

**KAŽI** —
- „Naš izvorni korpus je licenciran. Sirovi tekst objava ne smije se redistribuirati. To je **normalno stanje u našoj struci**, a ne iznimka — Determ, HNB-ovi mikropodaci, porezni registri, bolnički podaci."
- „Van ne ide sirovi tekst i sadržaj trećih strana. Ali van **ide sve ostalo**: kod, pravila pretrage, izvedeni tjedni agregati, manifest izvora, kodna knjiga, sjeme slučajnog generatora."

**KAŽI** *(naglasak)* — „Ograničeni podaci **nisu izlika za prečku nula**. Prečka dva dostižna je
gotovo uvijek. A razlika između jedinice i dvojke je upravo ono što recenzent zapravo može provjeriti."

**→ prijelaz** — „Kako onda izgleda projekt na prečki tri? Ovako." *(dalje)*

---

# 2 · Anatomija · 17:00 – 30:00

### ⏱ 17:00 — Razdjelnik „2 · Anatomija"

---

### ⏱ 17:20 — „Lanac je kratak i vidljiv"

**POKAŽI** Dijagram lanca. **NAPRAVI** Pratite ga prstom odozgo prema dolje, jednom.

**KAŽI** —
- „Sirovi naslovi ulaze gore. Pravilo pretrage ih pretvara u brojeve. Brojevi postaju udjeli i institucionalni jaz. Modeli daju procjene. Procjene idu u jednu JSON datoteku. Tekst čita tu datoteku."
- „Sedam koraka. **Bez okvira za orkestraciju, bez okvira za testiranje.** Jedna skripta koja se može pročitati naglas u dvije minute."

**KAŽI** *(naglasak)* — „Označio sam jedan korak: `R/korpus.R`, **mjerni sloj**. Zapamtite ga —
vratit će nam se na demonstraciji, i to bolno."

**→ prijelaz** — „Tri pravila drže taj lanac na okupu." *(dalje)*

---

### ⏱ 20:30 — „Tri pravila koja sve drže"

**POKAŽI** Tri kartice. **NAPRAVI** Treće pravilo izgovorite sporije od prva dva.

**KAŽI** —
- „Prvo, **konstante**. Ako se broj pojavljuje na dva mjesta u projektu, jedno od ta dva je greška. Sve konstante žive u jednoj datoteci."
- „Drugo, **izlošci**. Svaka slika i svaka tablica ima funkciju koja je proizvodi. Nijedna ne nastaje u interaktivnoj sesiji koju nitko neće ponoviti."
- „Treće, **brojevi**. Nijedan broj u odjeljku Rezultati nije upisan rukom. Svi dolaze iz `procjene.json` inline referencom."

**KAŽI** *(naglasak)* — „Treće je najjače, i to iz jednog razloga: tekst **ne može** tiho odstupiti od
tablice. Gradnja se ruši na svaki decimalni broj upisan rukom. Ne upozori — **ruši se**."

**→ prijelaz** — „Sada dodajmo agenta u taj lanac." *(dalje)*

---

### ⏱ 24:00 — „Petlja s agentom"

**POKAŽI** Petlja i tablica pet komponenti. **NAPRAVI** Prijeđite petlju prstom slijeva nadesno.

**KAŽI** —
- „Opišem što treba. Agent napravi plan. **Ja odobrim** — to je trenutak delegiranja. Agent izvrši. Sustav provjeri. **Ja commitam.**"
- „Pet komponenti, i svaka sprječava točno određeni kvar. Kontekst sprječava povratak na generičke pretpostavke. Plan sprječava da brzo riješi krivi problem. Ograde sprječavaju da autonoman proces dira što god želi. Provjera sprječava da uvjerljiva besmislica uđe u tekst. Git sprječava da se greška ponovi i da ostanemo bez povratka."

**KAŽI** — „Ovo nije informatička vodovodna instalacija. **To je dizajn ugovora pod asimetričnom
informacijom.** Vi ste principal, agent je agent, njegov output je jeftin za proizvodnju i skup za
provjeru. Ekonomisti imaju pravi okvir za ovo — mi smo ga izmislili."

**→ prijelaz** — „Jedna od tih pet komponenti je datoteka koju vrijedi vidjeti." *(dalje)*

---

### ⏱ 27:30 — „Ograde su datoteka, ne obećanje"

**POKAŽI** Isječak `settings.json`. **NAPRAVI** Pokažite tri retka redom.

**KAŽI** —
- „Dopušteno: `Rscript`, `quarto render`, `git diff`. Pita: `git commit`. Zabranjeno: čitanje `data/restricted/`, `git push`, `rm -rf`."
- „Agent orkestrira analizu čije osjetljive ulaze **nikada ne vidi**. To nije politika napisana u priručniku koji nitko ne čita. To je datoteka koju alat provodi."

**KAŽI** *(institucionalna napomena, kratko)* — „Za rad u instituciji: provjerite komercijalne uvjete
prije uvođenja i **zaključajte verziju alata** u zajedničkoj konfiguraciji, da vam se ponašanje ne
promijeni usred projekta."

**→ prijelaz** — „Dosta o strojarnici. Da vidimo hoće li izdržati." *(dalje)*

---

# 3 · Demonstracija · 30:00 – 48:00

> **Od ove točke vlast ima [`RUNBOOK.md`](RUNBOOK.md).** Ovdje je samo kičma.

### ⏱ 29:00 *(prije nego krenete u sekciju)* — podmetnite greške

```bash
Rscript demo/podmetni.R
```

### ⏱ 30:00 — Razdjelnik „3 · Demonstracija"

---

### ⏱ 30:20 — „Što gledati u sljedećih petnaest minuta"

**POKAŽI** Tablica triju grešaka. **NAPRAVI** Imenujte sve tri prije nego otvorite terminal. Publika
mora znati što lovi.

**KAŽI** —
- „**Curenje.** Ograničen sadržaj završi u rukopisu. To je stup otvorenosti — ne zato što je otvorenost lijepa, nego zato što otvorenost bez kontrole curenja nije moguća."
- „**Odstupanje.** Koeficijent upisan rukom više ne odgovara tablici. To je stup reproducibilnosti."
- „**Pokrivenost.** Pravilo pretrage izgubi normalizaciju dijakritike."

**KAŽI** *(treću objasnite, vrijedi truda)* — „Treća je **hrvatska specijalnost**. Naši portali pišu i
*središnja* i *sredisnja*, i *Vujčić* i *Vujcic*. Ispadne li jedan redak normalizacije, pravilo tiho
izgubi pola korpusa. Koeficijent se prepolovi. I sada ono bitno: **ništa ne pukne**. Kod se izvrši,
slike se nacrtaju, rad se sastavi. Samo je rezultat kriv."

**→ prijelaz** — „Idemo u terminal." *(dalje na crni slajd)*

---

### ⏱ 32:00 – 46:00 — Terminal

Redoslijed taktova — puni detalji u [`RUNBOOK.md`](RUNBOOK.md):

| Minuta | Na ekranu | Što radite / govorite |
|---|---|---|
| 32–34 | `CLAUDE.md` otvoren | „Ustav projekta. Kratak, čitljiv. Ovo je sve što agent zna." |
| 34–36 | Zahtjev na hrvatskom, agent ulazi u plan | „Jedna rečenica. Primijetite da još nije dirnuo nijednu datoteku." |
| 36–38 | Plan naglas → **odobrenje** | „Ovo odobrenje je trenutak delegiranja." |
| 38–42 | Izvršavanje pod ogradama | Naracija ograde: što smije, što je blokirano. |
| 42–46 | **`Rscript analysis/run.R`** — tri greške u jednom ispisu | „Tri greške, jedan prolaz, prije nego išta ode van." |
| 46–47 | `git diff` → commit | „Malo, pregledno, povratno. To je cijela petlja." |

**Ako bilo što stoji dulje od 60 sekundi — prijeđite na snimku bez isprike i nastavite pripovijedati.**

---

### ⏱ 47:00 — „Što smo upravo vidjeli"

**POKAŽI** Tri kartice. **NAPRAVI** Poklopite ih s tri greške koje ste najavili.

**KAŽI** —
- „Plan prije rada. Ograda koja drži. Provjera koja hvata."
- „**I ovo je poanta: sve tri greške su tihe.** Nijedna ne ruši kod. Sve tri bi prošle recenziju. Sve tri promakle bi umornom čovjeku pred rok — uključujući mene."

**→ prijelaz** — „Sad tri granice, pošteno." *(dalje)*

---

# 4 · Granice · 48:00 – 55:00

### ⏱ 48:00 — Razdjelnik „4 · Granice"

---

### ⏱ 48:20 — „Kada AI proizvodi vašu varijablu"

**POKAŽI** Dvije kartice: pravilo / u tekstu. **NAPRAVI** Vratite se na izlaganje s početka.

**KAŽI** —
- „Vratimo se na naš rad. **Naša zavisna varijabla je strojno konstruirana.** IAG ne postoji u prirodi — nastaje tako da pravilo pretrage prođe kroz milijune objava i odluči što je objava o HNB-u."
- „Zato ovo nije apstraktna opasnost nego naša. Pravilo glasi: **nijedna strojno označena varijabla ne ulazi u regresiju bez ljudski označenog validacijskog poduzorka.** I u tekstu se prijavljuje kako je varijabla nastala, koliko je validirano i s kojom pouzdanošću."

**KAŽI** *(naglasak)* — „Greška u mjerenju ne ruši ništa. **Ona samo tiho pomiče koeficijent.** To je
razlog zašto mjerni sloj treba vlastitu provjeru, a ne samo pažnju."

**→ prijelaz** — „I posljednja granica: podjela rada." *(dalje)*

---

### ⏱ 51:30 — „Što ne delegirati"

**POKAŽI** Dvije kartice. **NAPRAVI** Lijevu pročitajte brzo, desnu polako.

**KAŽI** —
- „Delegirajte: refaktoriranje, dokumentaciju, testove, ponovne procjene, formatiranje, robusnost, pretrage literature."
- „Ne delegirajte: istraživačko pitanje, izbor identifikacije, tumačenje nalaza, **snagu tvrdnje**, odluku o objavi."

**KAŽI** *(zatvaranje sekcije)* — „Postoji empirijski nalaz koji ovo lijepo sažima: alat **podiže pod,
ne strop**. Najviše dobivaju početnici, iskusni gotovo ništa. Što znači da iskusna prosudba postaje
**rjeđi**, a ne suvišniji ulaz. Zato je zadnja stavka na desnoj strani i dalje vaša."

**→ prijelaz** — „Sažmimo sat u pet redaka." *(dalje)*

---

# 5 · Zaključak · 55:00 – 59:00

### ⏱ 55:00 — „Pet redaka za ponijeti"

**POKAŽI** Tablica pet redaka. **NAPRAVI** Pročitajte ih naglas, sve. Traje dvadeset sekundi.

**KAŽI** — „Jedno pitanje: tko ovo može provjeriti i po kojoj cijeni. Tri stupa: otvoreno,
reproducibilno, AI-podržano. Jedna ljestvica: četiri prečke, popnite se za jednu. Jedna petlja: opiši,
plan, odobri, izvrši, **provjeri**, commit. Tri greške: curenje, odstupanje, pokrivenost."

---

### ⏱ 56:30 — „Jedna prečka"

**POKAŽI** Zadnja krupna tvrdnja. **NAPRAVI** Stanite mirno. Ovo je zadnja stvar koju pamte.

**KAŽI** —
- „Ne tražim od vas da postanete laboratorij za reproducibilnost. Tražim jedno: **odaberite jedan projekt, odredite na kojoj je prečki, i popnite se za jednu — ovaj tjedan.**"
- „Za većinu je to prečka dva: javni kod i dokumentirani podaci. **Bez ijednog retka novog istraživanja.**"

**KAŽI** *(zadnja rečenica — polako)* — „Jer ako je proizvodnja tvrdnji postala gotovo besplatna, onda
je jedino što još razlikuje istraživanje od teksta — **lanac po kojem se može provjeriti**."

---

### ⏱ 58:00 — „Materijali"

**POKAŽI** Poveznice. **NAPRAVI** Recite gdje je repozitorij i otvorite pitanja.

**KAŽI** — „Sve je gore: slajdovi, cjevovod, rukovanje demonstracijom, pojmovnik i literatura. Kod pod
MIT-om, tekst pod CC BY. **I jedna poštena napomena:** podaci u demonstraciji su kalibrirani, ne
izvorni — brojke su reda veličine objavljenih, ali se ne smiju citirati kao rezultati. Izvolite pitanja."

---

## Pripremljeni odgovori

**„Nije li ovo previše režije za jedan rad?"**
Cijeli cjevovod je dvadesetak datoteka i jedna naredba. Režija je jednokratna, a plaća se pri prvom
koautorstvu, prvoj recenziji i prvom povratku na projekt nakon šest mjeseci.

**„Mi radimo u Stati / Excelu."**
Ljestvica ne ovisi o alatu. Prečka dva u Stati je master do-datoteka, konstante na vrhu i tablica
generirana iz koda. Prečka tri je jedan `do master.do` koji gradi sve od nule.

**„Smijemo li uopće koristiti AI na osjetljivim podacima?"**
Kako je postavljeno — agent nikad ne vidi ograničene podatke. Orkestrira analizu čije ulaze ne čita.
Ali komercijalne uvjete i verziju alata provjerite prije institucionalne primjene; to nije stvar alata
nego nabave.

**„Koliko to košta?"**
Manje od jedne studentske pomoći po istraživaču mjesečno, ali cijene se mijenjaju — provjerite ih u
tjednu izlaganja umjesto da vjerujete slajdu.

**„Zašto vaš rad nije na prečki tri?"**
Zato što je licenca izvornog korpusa ograničava, i zato što smo počeli od kraja — od rezultata, a ne
od cjevovoda. To je i razlog zašto ovu radionicu držimo s prečke jedan, a ne s vrha.
