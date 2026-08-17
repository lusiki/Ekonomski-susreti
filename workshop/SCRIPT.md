# Scenarij izlaganja — punih šezdeset minuta

*„AI u ekonomskim istraživanjima”* · radionica na Ekonomskim susretima.

Ovo je **govorni scenarij**, dakle što **napraviti**, što **pokazati** i što
**reći**, slajd po slajd. Prati dva druga dokumenta:

- [`slides/slides.qmd`](slides/slides.qmd) — sam deck, riječi na ekranu;
- [`RUNBOOK.md`](RUNBOOK.md) — vlast nad demonstracijom, minute 28–45. Gdje se
  scenarij i rukovanje razilaze, **rukovanje ima prednost**.

**Cijela radionica počiva na jednom pojmu.** Izvršavanje je pojeftinilo,
provjera nije, i razlika se nakuplja kao dug. Četiri datoteke u repozitoriju
taj dug naplaćuju automatski. Ako izgubite nit, vratite se na rečenicu
**biste li primijetili da je ovo krivo**.

**Registar.** U dvorani su ekonomisti. Većina ih AI koristi u pregledniku i to
im radi sasvim solidno. Ne prodajete alat i ne obećavate revoluciju. Prodajete
jedno preseljenje, iz preglednika u repozitorij, i objašnjavate zašto.

**Retci `KAŽI` su izgovorivi, a ne za čitanje naglas.** Deck drži strukturu da
vaše oči mogu ostati na dvorani. Podebljano unutar `KAŽI` označava jedan
naglasak po slajdu.

---

## Prije nego itko uđe u dvoranu

- [ ] Proći **predpoletnu listu iz rukovanja** ([`RUNBOOK.md`](RUNBOOK.md)),
      dakle `Rscript setup.R`, jedan čist prolaz `Rscript analysis/run.R`,
      otvorena agentska sesija, **snimka čistog prolaza na jedan pritisak
      tipke**, jednom uvježbano hvatanje.
- [ ] Repozitorij **kopiran izvan Dropboxa ili OneDrivea**, jer sinkronizacija
      zaključava datoteke i Quarto povremeno padne pri čišćenju.
- [ ] Terminal na prezentacijskoj veličini fonta, svijetla tema, obavijesti
      isključene.
- [ ] **Ne podmetati greške još.** Podmeću se u zadnjoj minuti prije početka,
      vidi minutu 27.
- [ ] Deck u prezentacijskom prikazu, ovaj scenarij na dohvat oka.

**Vremenska kičma, 59 minuta uz pitanja.** Demonstracija je zaštićeni blok.
Ako kasnite, režite **iz sekcije 5**, nikad demonstraciju i nikad zatvaranje.

| Sekcija | Završava | Minuta |
|---|--:|--:|
| Otvaranje, tri pitanja dvorani | 04:00 | 4 |
| 1 · Dug provjere | 14:00 | 10 |
| 2 · Od čega se agent sastoji | 21:00 | 7 |
| 3 · AI sloj | 28:00 | 7 |
| **4 · Demonstracija** | **45:00** | **17** |
| 5 · Granice | 53:00 | 8 |
| 6 · Zaključak | 59:00 | 6 |
| Pitanja | — | do kraja |

---

# Otvaranje · 00:00 – 04:00

### ⏱ 00:00 — Naslovni slajd

**POKAŽI** Naslov. **NAPRAVI** Stanite mirno. Ne dirajte klikač prve dvije
rečenice.

**KAŽI** — „Hvala. Sljedećih sat vremena namjerno je usko. Ovo nije pregled
svega što bi umjetna inteligencija mogla učiniti ekonomiji. Ovo je **jedan
repozitorij** koji možete klonirati danas poslijepodne i **četiri datoteke**
koje u njemu vidite."

**→ prijelaz** — „Ali prvo bih htio znati tko je u dvorani." *(dalje)*

---

### ⏱ 00:30 — „Tri pitanja, dignite ruku"

**POKAŽI** Tri kartice s pitanjima. **NAPRAVI** Postavite ih jedno po jedno i
**stvarno brojite ruke naglas**. Ovo traje dvije minute i vrijedi svake
sekunde. Ne bilježite ništa, samo komentirajte što vidite.

**KAŽI** —
- „Prvo. Tko koristi AI u istraživanju? Nikad, povremeno, svaki dan."
- „Drugo, i ovo me zanima više. **Gdje ga pokrećete?** U pregledniku, u uređivaču koda, u terminalu?"
- „Treće. Što vas najviše koči? Povjerenje u ono što vrati, povjerljivost podataka, ili jednostavno ne znate odakle početi?"

**NAPRAVI** Nakon drugog pitanja stanite. Gotovo sigurno će golema većina
podići ruku na preglednik.

**KAŽI** *(okret, ovo je cijeli uvod u jednoj rečenici)* — „Evo. To je slika
koju sam očekivao i nije nikakva kritika, meni je preglednik godinu dana bio
jedini alat. Ali cijela je današnja radionica **jedno premještanje**. Iz onog
prozora tamo, u sam projekt. I sljedećih deset minuta objašnjavam zašto to
nije stvar udobnosti."

**→ prijelaz** — „Evo točno s čime izlazite." *(dalje)*

---

### ⏱ 02:40 — „Sat vremena, tri stvari koje odnosite"

**POKAŽI** Tri kartice. **NAPRAVI** Brojite ih na prste. Fizički.

**KAŽI** —
- „Prvo, **jedan pojam**. Dug provjere. Vjerojatno ga već plaćate, samo mu nemate ime."
- „Drugo, **jedan sloj**. Četiri datoteke koje AI ugrađuju u repozitorij."
- „Treće, **jedan repozitorij**. Klonirate ga danas i prenesete na svoj projekt."

**KAŽI** *(načelo dizajna)* — „Cijela radionica počiva na jednom načelu, a to
je **najmanje moguće**. Ne petnaest alata, ne osamnaest agenata. Najmanji skup
dijelova koji istraživanje čini provjerljivim. Ispalo je da su to četiri
datoteke."

**→ prijelaz** — „Krenimo od toga što se zapravo promijenilo." *(dalje)*

---

# 1 · Dug provjere · 04:00 – 14:00

### ⏱ 04:00 — Razdjelnik „1 · Dug provjere"

**POKAŽI** Razdjelnik. **NAPRAVI** Pročitajte crtu i idite dalje. Razdjelnici
su dah, a ne sadržaj.

---

### ⏱ 04:20 — „Cijena je pala samo s jedne strane"

**POKAŽI** Dvije kartice. **NAPRAVI** Ovaj slajd nosi. Usporite.

**KAŽI** —
- „Izvršiti nešto je jeftino i svake godine jeftinije. Očistiti podatke, napisati kod, nacrtati sliku, procijeniti model. To je posao koji je nekad trajao tjedan, a sada traje popodne."
- „Provjeriti je li to točno je skupo, i **ne postaje jeftinije samo od sebe**. Je li uzorak onaj koji mislite. Znači li koeficijent to što mislite."

**KAŽI** *(naglasak)* — „**Ta asimetrija je cijeli problem.** Ne etika, ne
moda, ne alati. Asimetrija troška."

**→ prijelaz** — „Ali stvar je gora nego što zvuči, jer nije problem samo u cijeni." *(dalje)*

---

### ⏱ 07:00 — „Ali nije problem samo u cijeni"

**POKAŽI** Dvije rečenice pa krupno „Dug provjere". **NAPRAVI** Ovo je
najvažniji slajd u prvoj polovici. Izgovorite ga polako i pustite tišinu
poslije.

**KAŽI** —
- „Sjetite se kako ste radili prije. Napišete deset redaka, pogledate ispis, idete dalje. **Provjeravali ste usput**, a da to niste ni zvali provjerom."
- „Sada napišete jednu rečenicu i vrati vam se dvjesto redaka odjednom. Pogledate prvih dvadeset, izgleda razumno, i idete dalje."

**NAPRAVI** Kratka stanka.

**KAŽI** *(pojam)* — „Ono što ste preskočili nije nestalo. **Nakupilo se.** Ja
to zovem dug provjere. To je razlika između koda koji daje rezultat i koda za
koji znate zašto ga daje."

**KAŽI** *(dospijeće, ovo je rečenica koju pamte)* — „I kao svaki dug, taj se
dug ne otpisuje nego dospijeva. Na recenziji, kod koautora koji pita odakle
taj broj, i kod vas samih za godinu dana kad se vratite na projekt. **Dug se
uvijek naplati, samo u najgorem trenutku.**"

**→ prijelaz** — „Ako je to problem, gdje je onda granica? Ovako." *(dalje)*

---

### ⏱ 10:00 — „Gdje agenta pustiti, a gdje ne"

**POKAŽI** Tablica dva puta dva. **NAPRAVI** Prstom po kvadrantima, redom
lijevo gore, desno gore, lijevo dolje, desno dolje.

**KAŽI** —
- „Vodoravno je koliko je teško **izvršiti**. Okomito je koliko je teško **provjeriti**. AI je pomaknuo samo vodoravnu os."
- „Lako izvršiti i lako provjeriti, delegirajte bez zadrške. Teško izvršiti a lako provjeriti, **tu je dobitak najveći** i tu je AI stvarno promijenio posao."
- „Donji red je opasan. Teško provjeriti znači da nećete vidjeti da je krivo."

**KAŽI** *(naglasak)* — „I zato pitanje nije *je li ovaj zadatak težak*. Pitanje
je **biste li primijetili da je odgovor kriv**. To je jedina os koja vas
zanima."

**→ prijelaz** — „Da to ne ostane apstraktno, evo ista tablica na primjeru s kojim ćemo raditi." *(dalje)*

---

### ⏱ 12:00 — „Ista podjela na našem primjeru"

**POKAŽI** Tablica četiri retka. **NAPRAVI** Prva dva retka brzo, treći i
četvrti polako.

**KAŽI** —
- „Spojiti dvije Eurostatove tablice. Provjerim brojem redaka na izlazu. Delegiram bez zadrške."
- „Nacrtati sliku po predlošku. Vidim je. Delegiram."
- „**Odabrati koje su oznake zemlje.** Ovo ne vidim. Panel izgleda jednako uredno i kad je točan i kad nije. To ne ide meni na provjeru nego u kod."
- „**Fiksni učinci zemlje, ili zemlje i godine.** Ovo mijenja pitanje na koje odgovaram, a ne odgovor. To ne delegiram uopće."

**KAŽI** *(zatvaranje sekcije)* — „Treći redak je razlog zbog kojeg ova
radionica postoji. Četvrti je razlog zbog kojeg ćete i dalje biti potrebni."

**→ prijelaz** — „Sada pet minuta o tome od čega se agent zapravo sastoji, da znamo o čemu govorimo." *(dalje)*

---

# 2 · Od čega se agent sastoji · 14:00 – 21:00

### ⏱ 14:00 — Razdjelnik „2 · Od čega se agent sastoji"

---

### ⏱ 14:20 — „Četiri pojma i gotovi ste"

**POKAŽI** Tri kartice pa krupno o kontekstu. **NAPRAVI** Ovaj slajd držite
lagano. Nije lekcija iz informatike nego demistifikacija.

**KAŽI** —
- „**Model** predviđa sljedeću riječ. To je sve. Ništa ne zna o vašem projektu i ništa ne može učiniti."
- „**Alati** su ono što mu date. Pročitaj datoteku, pokreni naredbu, pretraži web. Tek time model postaje agent."
- „**Ograda** je program koji stoji između i odlučuje smije li se taj alat pozvati. To niste kupili, to pišete vi."

**KAŽI** *(krupno, polako)* — „A **kontekst** je sve što model u tom trenutku
vidi. Sustavska uputa, vaša poruka, sadržaj datoteka, ispis naredbi. **Ako
nešto nije u kontekstu, za model ne postoji.** Nema pamćenja, nema intuicije o
vašem projektu, nema ničega osim toga."

**→ prijelaz** — „I sad pogledajte što iz toga slijedi." *(dalje)*

---

### ⏱ 17:00 — „Iz toga slijedi cijela radionica"

**POKAŽI** Dvije kartice. **NAPRAVI** Ovo je zglob cijelog izlaganja. Stanite
na njemu.

**KAŽI** —
- „Ako je sve što agent zna kontekst, a sve što smije ograda, onda odlučujete o **točno dvije stvari**. Trećega nema."
- „Prva odluka je kontekst. Umjesto da ga svaki put ponavljate u razgovoru, **zapišete ga u datoteku** koja putuje s projektom."
- „Druga odluka su dopuštenja. Umjesto da se pouzdate u dobru namjeru, **popišete što agent smije**, što vas mora pitati i što mu je zabranjeno."

**KAŽI** *(naglasak)* — „To su prve dvije od četiri datoteke koje ću vam
pokazati. I sad je važno da vidite da to **nisu konvencija koju je netko
izmislio**. To su jedine dvije odluke koje uopće postoje."

**→ prijelaz** — „Ostaje pitanje koje svi postavljaju, a to je koji alat." *(dalje)*

---

### ⏱ 19:00 — „Ne birajte alat, birajte način"

**POKAŽI** Tablica tri načina. **NAPRAVI** Ovo riješite brzo, sedamdeset
sekundi, jer je slajd koji sprječava krivo pitanje.

**KAŽI** —
- „U pregledniku vidite samo odgovor. Dobro za pitanja, ideje i tekst."
- „U uređivaču koda vidite svaku promjenu dok nastaje. Kao da sjedite pokraj."
- „U terminalu vidite sažetak na kraju. Kao da ste asistentu poslali mail."

**KAŽI** *(naglasak)* — „Primijetite da ovo **nije ljestvica napretka**. To su
tri razine nadzora, a način birate prema gornjoj tablici. Skupa provjera
znači da sjedite pokraj. Jeftina provjera znači da pošaljete mail."

**KAŽI** *(kratko, da se skine s dnevnog reda)* — „I molim vas, ne trošite
tjedne na izbor alata. To je kao pitati je li iPhone 17 ili 18. **Bitno je
sjedite li pokraj i po čemu ćete znati da je krivo.**"

**→ prijelaz** — „Dosta okvira. Da vidimo kako to izgleda u repozitoriju." *(dalje)*

---

# 3 · AI sloj · 21:00 – 28:00

### ⏱ 21:00 — Razdjelnik „3 · AI sloj"

---

### ⏱ 21:20 — „Projekt koji ćemo gledati"

**POKAŽI** Dijagram lanca. **NAPRAVI** Pratite ga prstom odozgo prema dolje,
jednom.

**KAŽI** —
- „Phillipsova krivulja u dvadeset zemalja europodručja, od 2014. do 2024. Dvije javne Eurostatove tablice, inflacija i nezaposlenost. **Namjerno najobičniji mogući primjer**, jer radionica nije o nalazu nego o tome kako je nalaz nastao."
- „Gore ulaze dvije sirove tablice. `R/zemlje.R` odlučuje što je zemlja. `R/podaci.R` ih spaja u panel. Modeli daju procjene. Procjene idu u jednu JSON datoteku. Tekst čita tu datoteku."

**KAŽI** *(naglasak)* — „Označio sam jedan korak, `R/zemlje.R`, **mjerni sloj**.
Zapamtite ga, vratit će nam se na demonstraciji i to bolno."

**→ prijelaz** — „A sada četiri datoteke zbog kojih smo ovdje." *(dalje)*

---

### ⏱ 23:30 — „Četiri datoteke i kvar koji svaka sprječava"

**POKAŽI** Tablica pa krupno petlja. **NAPRAVI** Prijeđite tablicu redak po
redak, pa petlju prstom slijeva nadesno.

**KAŽI** —
- „`CLAUDE.md` je kontekst. Sprječava da se agent vrati na opće pretpostavke o tome kako se radi ekonomija."
- „`settings.json` su ograde. Sprječavaju da samostalan proces dira što god želi."
- „`rules/provjera.md` je pravilo uz svaku izmjenu koda. Sprječava da posao bude proglašen gotovim bez gradnje."
- „`tests/checks.R` su provjere. Sprječavaju da uvjerljiva besmislica uđe u tekst."

**KAŽI** — „Peta je git, ali git već imate."

**KAŽI** *(petlja)* — „Opišem što treba. Agent napravi plan. **Ja odobrim**, i to
je trenutak delegiranja. Agent izvrši. Sustav provjeri. **Ja commitam.**"

**→ prijelaz** — „Jednu od te četiri vrijedi vidjeti izbliza." *(dalje)*

---

### ⏱ 25:30 — „Ograde su datoteka, ne obećanje"

**POKAŽI** Isječak `settings.json`. **NAPRAVI** Pokažite tri retka redom, pa
se vratite na drugi.

**KAŽI** —
- „Dopušteno, `Rscript`, `quarto render`, `git diff`. Pita, `git commit`. Zabranjeno, čitanje `data/restricted/` i `git push`."
- „Agent orkestrira analizu čije osjetljive ulaze **nikada ne vidi**. To nije politika napisana u priručniku koji nitko ne čita. To je datoteka koju alat provodi."

**NAPRAVI** Vratite se prstom na drugi redak.

**KAŽI** *(naglasak, ovo je fini detalj koji publika voli)* — „Pogledajte što
je još u `ask`. **`R/zemlje.R`**, dakle mjerni sloj. Nije zabranjen, jer ga
ponekad treba mijenjati. Ali **me mora pitati.** Sjećate se donjeg desnog
kvadranta? Ovako on izgleda kad ga zapišete."

**→ prijelaz** — „I zadnja od četiri, ona zbog koje ostale tri vrijede." *(dalje)*

---

### ⏱ 27:00 — „Provjera je mjesto gdje se dug plaća"

**POKAŽI** Tablica triju provjera. **NAPRAVI** Imenujte sve tri.

**KAŽI** —
- „**Ograda** traži ograničen sadržaj u bilo kojem izlazu projekta."
- „**Pokrivenost** uspoređuje veličinu uzorka s brojem koji sam unaprijed zapisao."
- „**Provenijencija** traži broj upisan rukom u odjeljku Rezultati."

**KAŽI** *(naglasak, ovo je teza cijele radionice)* — „I sad ono bitno. **Ne
provjeravam ja svaki put. Provjerava repozitorij, svaki put.** Tu se dug
provjere prestaje nakupljati, i to ne zato što sam ja discipliniran, nego zato
što gradnja pukne ako nisam."

**⏱ 27:45 — podmetnite greške** *(dok govorite zadnju rečenicu ili odmah nakon)*

```bash
Rscript demo/podmetni.R
```

**→ prijelaz** — „Dosta o strojarnici. Da vidimo hoće li izdržati." *(dalje)*

---

# 4 · Demonstracija · 28:00 – 45:00

> **Od ove točke vlast ima [`RUNBOOK.md`](RUNBOOK.md).** Ovdje je samo kičma.

### ⏱ 28:00 — Razdjelnik „4 · Demonstracija"

---

### ⏱ 28:20 — „Što gledati u sljedećih sedamnaest minuta"

**POKAŽI** Dvije kartice pa tablica triju grešaka. **NAPRAVI** Najavite oba
dijela prije nego otvorite terminal. Publika mora znati što lovi.

**KAŽI** —
- „Demonstracija ima dva dijela i redoslijed je namjeran. **Prvo korist, pa onda šteta.**"
- „U prvom dijelu agent dobiva stvaran zadatak i radi ga dobro. Od plana do gotove slike i osvježenog teksta."
- „U drugom dijelu u projektu su tri tihe greške. **Nijedna ne ruši program i sve tri bi prošle recenziju.**"

**KAŽI** *(imenujte tri)* — „Curenje, dakle ograničen sadržaj završi u tekstu.
Odstupanje, dakle koeficijent upisan rukom više ne odgovara procjeni.
Pokrivenost, dakle Grčka postane `GR` umjesto `EL`."

**→ prijelaz** — „Idemo u terminal." *(dalje na crni slajd)*

---

### ⏱ 30:00 – 43:00 — Terminal

Redoslijed taktova, puni detalji u [`RUNBOOK.md`](RUNBOOK.md):

| Minuta | Na ekranu | Što radite i govorite |
|---|---|---|
| 30–32 | `CLAUDE.md` otvoren | „Ustav projekta. Kratak, čitljiv. Ovo je sve što agent zna." |
| 32–34 | **Prvi dio.** Zahtjev na hrvatskom, agent ulazi u plan | „Jedna rečenica. Primijetite da još nije dirnuo nijednu datoteku." |
| 34–35 | Plan naglas → **odobrenje** | „Ovo odobrenje je trenutak delegiranja." |
| 35–38 | Izvršavanje pod ogradama, pa čist prolaz | „Radi. Slika je nova, brojka u tekstu se sama pomaknula." |
| 38–40 | **Drugi dio.** `Rscript analysis/run.R` — tri greške u jednom ispisu | „Tri greške, jedan prolaz, prije nego išta ode van." |
| 40–42 | Zadržite se na `EL` i `GR` | Vidi sljedeći slajd, ovo je vrhunac. |
| 42–43 | `vrati.R` → zeleno → `git diff` → commit | „Malo, pregledno, povratno. To je cijela petlja." |

**Ako bilo što stoji dulje od 60 sekundi, prijeđite na snimku bez isprike i
nastavite pripovijedati.**

---

### ⏱ 43:00 — „Treća greška, pobliže"

**POKAŽI** Dvije kartice. **NAPRAVI** Ovo je slajd zbog kojeg će vas pamtiti.
Nemojte žuriti.

**KAŽI** —
- „Eurostat Grčku označava kao **`EL`**. Cijeli ostatak svijeta, uključujući ISO standard i vjerojatno vaš kod, piše **`GR`**."
- „Tko filtrira po `GR`, tiho izgubi cijelu zemlju. Panel padne s 220 na 209 opažanja. Nagib se pomakne s nula zarez šezdeset jedan na nula zarez šezdeset devet."

**NAPRAVI** Stanka.

**KAŽI** *(naglasak)* — „I sada ono bitno. **Ništa ne pukne.** Kod se izvrši,
slike se nacrtaju, tekst se sastavi, gradnja prođe do kraja. Jedna zemlja tiho
nestane i **nitko ne dobije poruku o grešci.**"

**KAŽI** *(prizemljenje)* — „Ovo nije izmišljena opasnost. Ovo je jedna od
najčešćih tihih grešaka u radu s europskim podacima i **dogodila se meni**."

**→ prijelaz** — „Da sažmemo što smo vidjeli." *(dalje)*

---

### ⏱ 44:00 — „Što smo upravo vidjeli"

**POKAŽI** Tri kartice. **NAPRAVI** Poklopite ih s tri greške koje ste
najavili.

**KAŽI** —
- „Plan prije rada. Ograda koja drži. Provjera koja hvata."
- „**I ovo je poanta. Sve tri greške su tihe.** Nijedna ne ruši kod. Sve tri bi prošle recenziju. Sve tri promakle bi umornom čovjeku pred rok, uključujući mene."

**→ prijelaz** — „Sad tri granice, pošteno." *(dalje)*

---

# 5 · Granice · 45:00 – 53:00

### ⏱ 45:00 — Razdjelnik „5 · Granice"

---

### ⏱ 45:20 — „Ako podaci ne smiju izaći"

**POKAŽI** Tri kartice. **NAPRAVI** Ovo je pitanje koje su vam htjeli
postaviti, pa im odgovorite prije nego stignu.

**KAŽI** —
- „Ovo je pitanje koje sam dobio na svakom razgovoru o ovoj temi, i pošteno je da na njega odgovorim prije pitanja."
- „Prvo, **ograda**. Kako je ovdje postavljeno, agent orkestrira analizu čije ulaze ne čita. Zabrana je u datoteci, a provjera je dokazuje."
- „Drugo, **uvjeti**. Pretplata i plaćanje po upotrebi nemaju iste uvjete o tome što se smije s vašim podacima. Pročitajte ih prije nego uvedete alat u instituciju."
- „Treće, **lokalno**. Za podatke koji ne smiju napustiti zgradu postoje modeli s otvorenim težinama koji rade na vašem računalu. Slabiji su, ali za označavanje i čišćenje su sasvim dovoljni."

**KAŽI** *(naglasak)* — „Primijetite da su druga i treća stavka **nabava, a ne
alat**. Riješite to prije projekta, ne usred njega."

**→ prijelaz** — „I posljednja granica, podjela rada." *(dalje)*

---

### ⏱ 49:00 — „Što ne delegirati"

**POKAŽI** Dvije kartice. **NAPRAVI** Lijevu pročitajte brzo, desnu polako.

**KAŽI** —
- „Delegirajte čišćenje podataka, spajanje tablica, slike po predlošku, refaktoriranje, dokumentaciju, testove, ponovne procjene, robusnost."
- „Ne delegirajte istraživačko pitanje, izbor specifikacije, tumačenje nalaza, **snagu tvrdnje**, odluku o objavi."

**KAŽI** *(naglasak, ovo vraća cijelu radionicu u jednu točku)* — „I sad primijetite
da desni stupac **nije stvar ukusa**. To nije popis stvari koje su meni drage.
To su redci iz **gornje polovice one tablice**, oni koje ne biste primijetili
da su krivi. Cijela podjela rada ispada iz jedne osi."

**KAŽI** *(zatvaranje sekcije)* — „Postoji empirijski nalaz koji ovo lijepo
sažima. Alat **podiže pod, ne strop**. Najviše dobivaju početnici, iskusni
gotovo ništa. Što znači da iskusna prosudba postaje **rjeđi**, a ne suvišniji
ulaz."

**→ prijelaz** — „Sažmimo radionicu u pet redaka." *(dalje)*

---

# 6 · Zaključak · 53:00 – 59:00

### ⏱ 53:00 — „Pet redaka za ponijeti"

**POKAŽI** Tablica pet redaka. **NAPRAVI** Pročitajte ih naglas, sve. Traje
dvadeset sekundi.

**KAŽI** — „Jedan pojam, dug provjere, i raste dok ga ne pogledate. Dvije
odluke, kontekst i ograda, trećega nema. Četiri datoteke, ustav,
ograde, pravilo, provjere. Jedna petlja, opiši, plan, odobri, izvrši,
**provjeri**, commit. I jedno pitanje, **biste li primijetili da je ovo
krivo**."

---

### ⏱ 55:00 — „Jedan zadatak, ovaj tjedan"

**POKAŽI** Zadnja krupna tvrdnja. **NAPRAVI** Stanite mirno. Ovo je zadnja
stvar koju pamte.

**KAŽI** —
- „Ne tražim od vas da preuredite način rada. Tražim jedno. **Klonirajte repozitorij, uzmite jedan svoj projekt i napišite mu `CLAUDE.md`.**"
- „Dvadeset redaka. Što je projekt, gdje što stoji, što se nikad ne dira. **Bez ijednog retka novog istraživanja.**"
- „Sljedeći tjedan dodajte jednu provjeru. I to ne bilo koju, nego onu koja hvata grešku koja vam se **već jednom dogodila.** Svatko ima takvu grešku."

**KAŽI** *(zadnja rečenica, polako)* — „Jer ako je proizvodnja rezultata
postala gotovo besplatna, onda je jedino što još razlikuje istraživanje od
teksta **to što se može provjeriti, i to bez vas.**"

---

### ⏱ 57:30 — „Materijali"

**POKAŽI** Poveznice. **NAPRAVI** Recite gdje je repozitorij i otvorite
pitanja.

**KAŽI** — „Sve je gore. Slajdovi, repozitorij, rukovanje demonstracijom,
upute za prijenos na vlastiti projekt, pojmovnik i literatura. Kod pod
MIT-om, tekst pod CC BY. Podaci su stvarni i javni, dvije Eurostatove tablice.
Izvolite pitanja."

---

## Pripremljeni odgovori

**„Nije li ovo previše režije za jedan rad?"**
Četiri datoteke i jedna naredba. Prve tri su obični tekst i pišu se popodne.
Režija je jednokratna, a plaća se pri prvom koautorstvu, prvoj recenziji i
prvom povratku na projekt nakon šest mjeseci.

**„Mi radimo u Stati ili Excelu."**
Prve tri datoteke su obični tekst i ne ovise ni o čemu. Mijenja se samo
četvrta i naredba kojom se pokreće. U Stati je to master do-datoteka koja na
kraju pokreće nekoliko `assert` naredbi. U Excelu ovo ne radi i to je jedini
stvarni razlog da se iz Excela izađe.

**„Smijemo li uopće koristiti AI na osjetljivim podacima?"**
Kako je postavljeno, agent nikad ne vidi ograničene podatke, nego orkestrira
analizu čije ulaze ne čita. Ali komercijalne uvjete i verziju alata provjerite
prije institucionalne primjene. To nije stvar alata nego nabave.

**„Koliko to košta?"**
Manje od jedne studentske pomoći po istraživaču mjesečno, ali cijene se
mijenjaju. Provjerite ih u tjednu izlaganja umjesto da vjerujete slajdu.

**„Zar agent ne može sam napisati te provjere?"**
Može, i to je dobar prvi zadatak. Ali provjeru koja hvata **vašu** tipičnu
grešku morate opisati vi, jer agent ne zna što vam se već dogodilo. Zato je
zadatak za ovaj tjedan `CLAUDE.md`, a ne provjere.

**„Što ako se model promijeni pa se ponašanje promijeni usred projekta?"**
Zato su provjere u repozitoriju, a ne u glavi. Promjena modela ne može
promijeniti to da gradnja pukne na broju upisanom rukom. Za institucionalni
rad dodatno zaključajte verziju alata u zajedničkoj konfiguraciji.
