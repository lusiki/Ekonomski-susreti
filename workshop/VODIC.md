# Vodič za izlaganje

Jedini dokument koji ti treba na dan radionice. Sadrži pripremu, vremenski
raspored, što govoriš na svakom slajdu, cijelu demonstraciju i pripremljene
odgovore.

Nije povezan ni s jedne javne stranice.

---

## Radionica u jednoj rečenici

Izvršavanje je pojeftinilo, provjera nije, pa tu razliku zapisujemo u
repozitorij da se naplaćuje sama.

Ako izgubiš nit, vrati se na pitanje **biste li primijetili da je ovo krivo**.

## Šest sekcija, šest pitanja

| Minuta | Sekcija | Pitanje sekcije |
|---|---|---|
| 00–04 | Otvaranje | Tko je u dvorani |
| 04–14 | Dug provjere | Zašto je to važno |
| 14–21 | Od čega se agent sastoji | O čemu ja odlučujem |
| 21–28 | Projekt | Kako to izgleda uživo |
| 28–45 | Demonstracija | Radi li to stvarno |
| 45–53 | Granice | Gdje ovo ne pomaže |
| 53–59 | Zaključak | Što radim u ponedjeljak |

Demonstracija i zaključak se ne diraju. Ako kasniš, režeš iz sekcije 5.

## Načelo cijele druge polovice

Publiku vodiš **obrnuto od redoslijeda kojim je projekt nastao**. Projekt ide
od podataka prema tekstu. Ti ideš od gotovog rada prema podacima.

Čovjek razumije stvar tek kad vidi što ona proizvodi.

---

# Prije dvorane

**Dan ranije**

- [ ] Kopiraj repozitorij **izvan Dropboxa**. Sinkronizacija zaključava
      datoteke i Quarto povremeno padne pri čišćenju. Ovo je najčešći uzrok
      pada demonstracije.
- [ ] `Rscript setup.R`, dakle svi paketi prisutni i Quarto pronađen.
- [ ] `Rscript analysis/run.R` mora završiti zeleno. Time se ujedno zagrijava
      sve što se poslije gradi.
- [ ] Uvježbaj prvi dio demonstracije jednom do kraja. To je jedini dio koji
      ovisi o tome što će agent napraviti.
- [ ] Snimi tri snimke i drži ih na jedan pritisak tipke. Prvi dio, ispis s
      tri greške, čist prolaz.

**Trideset minuta prije**

- [ ] Ponovi `Rscript analysis/run.R`, mora biti zeleno.
- [ ] Otvori agentsku sesiju unaprijed da prvi odgovor ne čeka.
- [ ] Otvori `paper/nalaz.html` u pregledniku, u zasebnoj kartici.
- [ ] Terminal na prezentacijskoj veličini fonta, svijetla tema, obavijesti
      isključene.
- [ ] Provjeri da je `git` identitet postavljen i da si na grani na kojoj
      želiš raditi.
- [ ] **Ne podmeći greške.** Podmeću se uživo, na minuti 38.

**Što drži otvoreno**

Preglednik s `nalaz.html`, uređivač s projektom, terminal, i deck u
prezentacijskom prikazu. Četiri prozora, i znaš prečac za svaki.

---

# Otvaranje · 00:00 – 04:00

### 00:00 · Naslovni slajd

**NA EKRANU** Naslov.

**NAPRAVI** Stani mirno. Ne diraj klikač prve dvije rečenice.

**KAŽEŠ** Hvala. Sljedećih sat vremena namjerno je usko. Ovo nije pregled
svega što bi umjetna inteligencija mogla učiniti ekonomiji. Ovo je **jedan
repozitorij** koji možete klonirati danas poslijepodne i **četiri datoteke**
koje u njemu vidite.

**→** Ali prvo bih htio znati tko je u dvorani.

### 00:30 · Tri pitanja, dignite ruku

**NAPRAVI** Postavi ih jedno po jedno i **stvarno broji ruke naglas**.

**KAŽEŠ**

- Prvo. Tko koristi AI u istraživanju? Nikad, povremeno, svaki dan.
- Drugo, i ovo me zanima više. **Gdje ga pokrećete?** U pregledniku, u
  uređivaču koda, u terminalu?
- Treće. Što vas najviše koči? Povjerenje u ono što vrati, povjerljivost
  podataka, ili ne znate odakle početi?

**NAPRAVI** Nakon drugog pitanja stani. Golema većina podići će ruku na
preglednik.

**KAŽEŠ** To je slika koju sam očekivao i nije nikakva kritika. Meni je
preglednik godinu dana bio jedini alat. Ali cijela je današnja radionica
**jedno premještanje**, iz onog prozora u sam projekt. I sljedećih deset
minuta objašnjavam zašto to nije stvar udobnosti.

**→** Evo točno s čime izlazite.

### 02:40 · Tri stvari koje odnosite

**NAPRAVI** Broji ih na prste. Fizički.

**KAŽEŠ**

- Prvo, **jedan pojam**. Dug provjere. Vjerojatno ga već plaćate, samo mu
  nemate ime.
- Drugo, **jedan sloj**. Četiri datoteke koje AI ugrađuju u repozitorij.
- Treće, **jedan repozitorij**. Klonirate ga danas i prenesete na svoj projekt.

**KAŽEŠ** Cijela radionica počiva na načelu **najmanje moguće**. Ne petnaest
alata, nego najmanji skup dijelova koji istraživanje čini provjerljivim.
Ispalo je da su to četiri datoteke.

**→** Krenimo od toga što se zapravo promijenilo.

---

# 1 · Dug provjere · 04:00 – 14:00

### 04:00 · Razdjelnik

Pročitaj crtu i dalje. Razdjelnici su dah, a ne sadržaj.

### 04:20 · Cijena je pala samo s jedne strane

**NAPRAVI** Ovaj slajd nosi. Uspori.

**KAŽEŠ**

- Izvršiti nešto je jeftino i svake godine jeftinije. Očistiti podatke,
  napisati kod, nacrtati sliku, procijeniti model. Posao koji je trajao
  tjedan sada traje popodne.
- Provjeriti je li to točno je skupo, i **ne postaje jeftinije samo od sebe**.
  Je li uzorak onaj koji mislite. Znači li koeficijent to što mislite.

**KAŽEŠ** **Ta asimetrija je cijeli problem.** Ne etika, ne moda, ne alati.
Asimetrija troška.

**→** Ali stvar je gora nego što zvuči.

### 07:00 · Problem nije samo u cijeni

**NAPRAVI** Najvažniji slajd prve polovice. Izgovori polako i pusti tišinu.

**KAŽEŠ**

- Sjetite se kako ste radili prije. Napišete deset redaka, pogledate ispis,
  idete dalje. **Provjeravali ste usput**, a da to niste ni zvali provjerom.
- Sada napišete jednu rečenicu i vrati vam se dvjesto redaka odjednom.
  Pogledate prvih dvadeset, izgleda razumno, idete dalje.

**NAPRAVI** Kratka stanka.

**KAŽEŠ** Ono što ste preskočili nije nestalo. **Nakupilo se.** To zovem dug
provjere. Razlika između koda koji daje rezultat i koda za koji znate zašto
ga daje.

**KAŽEŠ** I kao svaki dug, ne otpisuje se nego dospijeva. Na recenziji, kod
koautora koji pita odakle taj broj, i kod vas samih za godinu dana. **Dug se
uvijek naplati, samo u najgorem trenutku.**

**→** Ako je to problem, gdje je granica?

### 10:00 · Što prepustiti agentu

**NAPRAVI** Prstom po redcima, odozgo prema dolje.

**KAŽEŠ**

- Ako rezultat možete odmah pogledati, prepustite ga bez zadrške.
- Ako se može provjeriti automatski, prepustite ga i pustite provjeru da
  potvrdi.
- Ako nema jasnog testa, agent može pomoći, ali **ne odlučuje**.

**KAŽEŠ** Pitanje dakle nije je li ovaj zadatak težak. Pitanje je **biste li
primijetili da je odgovor kriv**. To je jedina os koja vas zanima.

**→** Evo iste podjele na primjeru s kojim ćemo raditi.

### 12:00 · Četiri primjera iz projekta

**NAPRAVI** Prva dva retka brzo, treći i četvrti polako.

**KAŽEŠ**

- Nacrtati sliku po predlošku. Vidim je. Prepuštam.
- Spojiti dvije Eurostatove tablice. Provjerim brojem redaka. Prepuštam.
- **Odabrati oznake zemalja.** Ovo ne vidim. Panel izgleda jednako uredno i
  kad je točan i kad nije. To ne ide meni na provjeru nego u kod.
- **Fiksni učinci zemlje, ili zemlje i godine.** Ovo mijenja pitanje na koje
  odgovaram. To ne prepuštam uopće.

**KAŽEŠ** Treći redak je razlog zbog kojeg ova radionica postoji. Četvrti je
razlog zbog kojeg ćete i dalje biti potrebni.

**→** Sada kratko o tome od čega se agent sastoji.

---

# 2 · Od čega se agent sastoji · 14:00 – 21:00

### 14:20 · Četiri pojma

**NAPRAVI** Drži lagano. Nije lekcija iz informatike nego demistifikacija.

**KAŽEŠ**

- **Model** predlaže tekst ili kod. To je sve. Sam ne može otvoriti datoteku
  ni pokrenuti analizu.
- **Alati** su ono što mu date. Pročitaj datoteku, pokreni naredbu, pretraži
  web. Tek time model postaje agent.
- **Pravila pristupa** stoje između i odlučuju smije li se alat pozvati. To
  niste kupili, to pišete vi.

**KAŽEŠ** A **kontekst** je sve što model u tom trenutku ima pred sobom.
Upute, vaša poruka, sadržaj otvorenih datoteka, ispis naredbi. **Ako nešto
nije u kontekstu, za model ne postoji.**

**→** Pogledajte što iz toga slijedi.

### 17:00 · Što vi određujete

**NAPRAVI** Ovo je zglob cijelog izlaganja. Stani na njemu.

**KAŽEŠ**

- Ako je sve što agent zna kontekst, a sve što smije pravila pristupa, onda
  odlučujete o **točno dvije stvari**. Trećega nema.
- Prva odluka je kontekst. Umjesto da ga ponavljate u svakom razgovoru,
  **zapišete ga u datoteku** koja putuje s projektom.
- Druga su dopuštenja. Umjesto da se pouzdate u dobru namjeru, **popišete što
  agent smije**, što vas mora pitati i što mu je zabranjeno.

**KAŽEŠ** To su prve dvije od četiri datoteke. I važno je da vidite da to
**nije konvencija koju je netko izmislio**. To su jedine dvije odluke koje
uopće postoje.

**→** Ostaje pitanje koje svi postavljaju, a to je koji alat.

### 19:00 · Ne birajte alat, birajte način

**NAPRAVI** Riješi brzo, sedamdeset sekundi.

**KAŽEŠ**

- U pregledniku vidite samo odgovor. Dobro za pitanja, ideje i tekst.
- U uređivaču koda vidite svaku promjenu dok nastaje. Kao da sjedite pokraj.
- U terminalu vidite sažetak na kraju. Kao da ste asistentu poslali mail.

**KAŽEŠ** Ovo **nije ljestvica napretka**. To su tri razine nadzora. Skupa
provjera znači da sjedite pokraj. Jeftina provjera znači da pošaljete mail.

**KAŽEŠ** I ne trošite tjedne na izbor alata. **Bitno je sjedite li pokraj i
po čemu ćete znati da je krivo.**

**→** Dosta okvira. Da vidimo pravi projekt.

---

# 3 · Projekt · 21:00 – 28:00

Ovdje prvi put napuštaš slajdove. Sedam minuta na stvarnim datotekama.

Ništa ne objašnjavaš unaprijed. Pokazuješ, pa imenuješ.

### 21:20 · Gotov rad · dvije minute

**NA EKRANU** Preglednik, `paper/nalaz.html`.

**NAPRAVI** Skrolaj polako od vrha do dna, jednom.

**KAŽEŠ** Ovo projekt proizvodi. Dvije stranice. Pitanje, rezultati, dvije
slike, ograničenja. Phillipsova krivulja u dvadeset zemalja europodručja, od
2014. do 2024.

**NAPRAVI** Vrati se na Rezultate i pročitaj jednu rečenicu naglas. Stavi
prst na `0,61`.

**KAŽEŠ** Rast stope nezaposlenosti za jedan postotni bod prati pad inflacije
za nula zarez šezdeset jedan postotna boda.

**NAPRAVI** Pokaži obje slike, po deset sekundi. Prva je kroz vrijeme, vidi
se skok inflacije na deset posto u 2022. Druga je raspršeni dijagram s dva
pravca različitog nagiba.

**KAŽEŠ** **Namjerno najobičniji mogući primjer.** Phillipsova krivulja je
gradivo prve godine. Da je primjer zanimljiv, raspravljali bismo o nalazu.
Radionica nije o nalazu nego o tome kako je nalaz nastao.

**→** A sada isti taj rad, ali iznutra.

### 23:00 · Ista rečenica, dva puta · minutu i dvadeset

**NA EKRANU** Uređivač, `paper/nalaz.qmd`, ista rečenica.

**NAPRAVI** Ovo je jedini trenutak u prvoj polovici koji traži tišinu. Stani.

**KAŽEŠ** Ovo je ista rečenica koju smo upravo pročitali. Pogledajte gdje je
bila brojka.

**KAŽEŠ** U izvoru nema brojke. **Ima uputa gdje je potražiti.** Kad se rad
gradi, na tom mjestu ispadne nula zarez šezdeset jedan.

**KAŽEŠ** Posljedica je da tekst ne može zaostati za analizom. Promijenite
išta u podacima ili modelu i sve se brojke pomaknu same, u istom pokretanju.
Nema koraka u kojem netko rukom prepisuje rezultat iz konzole u dokument, a
to je korak u kojem u stvarnom radu nastaje najviše tihih grešaka.

**→** Odakle onda ta brojka dolazi.

### 24:20 · Gdje brojevi žive · pedeset sekundi

**NA EKRANU** `results/procjene.json`.

**NAPRAVI** Skrolaj kroz njega jednom, pa stavi prst na `beta`.

**KAŽEŠ** Ovdje završava svaka brojka koju analiza proizvede. Koeficijenti,
standardne pogreške, broj zemalja, broj opažanja, vrhunac inflacije. Dvadeset
i osam brojeva u jednoj datoteci.

**KAŽEŠ** Ovo je onaj broj iz rečenice. **Analiza ovamo piše, tekst odavde
čita, i ta dva koraka nikad ne razgovaraju izravno.**

**→** Da vidimo cijeli put.

### 25:10 · Cijeli put · trideset sekundi

**NA EKRANU** Slajd s dijagramom.

**NAPRAVI** Prati ga prstom odozgo prema dolje, jednom. Ne objašnjavaj svaki
korak.

**KAŽEŠ** Gore ulaze dvije sirove Eurostatove tablice. `R/zemlje.R` odlučuje
što je zemlja. `R/podaci.R` ih spaja u panel. Modeli daju procjene. Procjene
idu u onu JSON datoteku. Tekst je čita.

**KAŽEŠ** Označio sam jedan korak, `R/zemlje.R`, **mjerni sloj**. Zapamtite
ga, vratit će nam se i to bolno.

**→** Cijeli ovaj put prolazi jedna naredba.

### 25:40 · Jedan čist prolaz uživo · jedna minuta

**NA EKRANU** Terminal, `Rscript analysis/run.R`.

**NAPRAVI** Pusti da ispis teče i pripovijedaj dok ide. Ovo je najvažnija
minuta u cijeloj sekciji.

**KAŽEŠ** Jedna naredba radi sve. Podaci, procjene, slike, brojevi, provjere,
rad.

**NAPRAVI** Prstom na redak `podaci: 220 opazanja, 20 zemalja`.

**KAŽEŠ** **Zapamtite ovaj redak.** Ne objašnjavaj zašto.

**NAPRAVI** Dok prolaze provjere, imenuj ih.

**KAŽEŠ** Ograda traži povjerljiv sadržaj u izlazima. Pokrivenost broji
zemlje i redke. Provenijencija traži broj upisan rukom.

**KAŽEŠ** *(zadnji redak)* Sve izgrađeno i provjereno. **Ovako izgleda kad je
dobro.** Zapamtite i to, jer ćemo za deset minuta gledati kako izgleda kad
nije.

**→** A sada četiri datoteke zbog kojih ovo radi.

### 26:40 · Četiri datoteke · četrdeset sekundi

**NA EKRANU** Slajd s tablicom.

**KAŽEŠ**

- `CLAUDE.md` je kontekst. Sprječava da se agent vrati na opće pretpostavke.
- `settings.json` su dopuštenja. Sprječavaju da samostalan proces dira što
  god želi.
- `rules/provjera.md` je pravilo uz svaku izmjenu koda. Sprječava da posao
  bude proglašen gotovim bez gradnje.
- `tests/checks.R` su provjere koje ste upravo vidjeli kako prolaze.

**KAŽEŠ** Peta je git, ali git već imate.

**KAŽEŠ** *(petlja)* Opišem što treba. Agent napravi plan. **Ja odobrim**, i
to je trenutak delegiranja. Agent izvrši. Sustav provjeri. **Ja commitam.**

**→** Jednu od te četiri vrijedi vidjeti izbliza.

### 27:20 · Dopuštenja · trideset sekundi

**NA EKRANU** Slajd s isječkom.

**KAŽEŠ** Dopušteno, `Rscript`, `quarto render`, `git diff`. Pita, `git
commit`. Zabranjeno, čitanje `data/restricted/` i `git push`.

**KAŽEŠ** Agent orkestrira analizu čije osjetljive ulaze **nikada ne vidi**.
To nije politika iz priručnika koji nitko ne čita. To je datoteka koju alat
provodi.

**KAŽEŠ** I pogledajte što je još u `ask`. **Mjerni sloj.** Nije zabranjen,
jer ga ponekad treba mijenjati. Ali **me mora pitati**.

**→** Dosta o strojarnici. Da vidimo hoće li izdržati.

---

# 4 · Demonstracija · 28:00 – 45:00

**Redoslijed je namjeran. Prvo korist, pa onda šteta.**

Greške se podmeću **uživo na minuti 38**, pred publikom, a ne unaprijed. Tako
prvi dio prođe čisto, a ti ne moraš ništa skrivati.

### 28:20 · Što gledati · minuta i pol

**NA EKRANU** Slajd s dva dijela i tablicom triju grešaka.

**NAPRAVI** Najavi oba dijela prije nego otvoriš terminal. Publika mora znati
što lovi.

**KAŽEŠ**

- Demonstracija ima dva dijela. **Prvo korist, pa onda šteta.**
- U prvom dijelu agent dobiva stvaran zadatak i radi ga dobro.
- U drugom dijelu unosim tri tihe greške. **Nijedna ne ruši program i sve tri
  bi prošle recenziju.**

**KAŽEŠ** *(imenuj ih)* Curenje, dakle ograničen sadržaj završi u tekstu.
Odstupanje, dakle koeficijent upisan rukom više ne odgovara procjeni.
Pokrivenost, dakle Grčka postane `GR` umjesto `EL`.

**→** Idemo u terminal.

## Prvi dio · korist · 30:00 – 38:00

### 30:00 · CLAUDE.md

**NA EKRANU** `CLAUDE.md` otvoren, skrolaj kroz njega.

**KAŽEŠ** Ustav projekta. Kratak i čitljiv. **Ovo je sve što agent zna** o
projektu.

**NAPRAVI** Zaustavi se na odjeljku Tvrda pravila.

**KAŽEŠ** Ovdje piše da svaki broj u Rezultatima mora biti referenca na
`procjene.json`. To pravilo ste maloprije vidjeli kako izgleda u tekstu.

### 32:00 · Zahtjev

**NA EKRANU** Agentska sesija.

**NAPRAVI** Upiši zahtjev.

> Dodaj treću sliku koja uspoređuje Hrvatsku s neponderiranim prosjekom
> europodručja, za inflaciju, kroz cijelo razdoblje uzorka. Slika ide u
> `R/slike.R` kao zasebna funkcija, poziva se iz `analysis/run.R`, i prati
> postojeći crno bijeli predložak. Dodaj i u `results/procjene.json` godinu i
> visinu vrhunca inflacije u Hrvatskoj, pa to spomeni jednom rečenicom u
> odjeljku Rezultati. Prvo mi daj plan i čekaj odobrenje.

**KAŽEŠ** Jedna rečenica na hrvatskom. Primijetite da **još nije dirnuo
nijednu datoteku.**

### 34:00 · Plan i odobrenje

**NAPRAVI** Pročitaj plan naglas, koje datoteke i koje naredbe. Onda odobri.

**KAŽEŠ** Ovo odobrenje je trenutak delegiranja. Odavde radi sam dok se ne
javi.

**Ako plan izgleda krivo, odbij ga pred publikom** i traži drugi. To je
vjerodostojniji prizor od uspjeha iz prve.

### 35:00 · Izvršavanje

**NAPRAVI** Pripovijedaj dopuštenja dok radi. Smije `Rscript`, pita za
commit, ne smije `data/restricted/`.

**NAPRAVI** Kad završi, pusti da se izgradi. Mora proći zeleno.

### 37:00 · Poanta prvog dijela

**NA EKRANU** `paper/nalaz.qmd`, nova rečenica.

**NAPRAVI** Stavi prst na mjesto gdje je referenca, ondje gdje bi čovjek
očekivao broj.

**KAŽEŠ** Pogledajte što je napisao. **Nije upisao brojku.** Napisao je
referencu, isti onaj oblik koji smo vidjeli na početku. Nije mogao drukčije,
jer bi gradnja pukla. To nije pristojnost agenta nego pravilo iz `CLAUDE.md`
koje provjera provodi.

## Drugi dio · šteta · 38:00 – 43:00

### 38:00 · Podmetanje, otvoreno

**NA EKRANU** Terminal, `Rscript demo/podmetni.R`.

**KAŽEŠ** Sad ću u projekt namjerno unijeti tri greške, one koje sam
najavio. Ispisat će što je promijenio.

**NAPRAVI** Ne skrivaj ovo. Otvorenost ovdje kupuje povjerenje za sve poslije.

### 38:30 · Prolaz koji pada

**NA EKRANU** Terminal, `Rscript analysis/run.R`.

**NAPRAVI** Pusti da teče. Ne komentiraj gornji dio.

Ispis koji tražiš.

```
== Provjere ================================================
  [GRESKA] ograda -- ogranicen sadrzaj procurio u: paper/nalaz.qmd
           Sadrzaj iz data/restricted/ ne ulazi ni u jedan izlaz.
  [GRESKA] pokrivenost/zemlje -- panel ima 19 zemalja umjesto 20.
           Nedostaje: GR
           Provjerite oznake zemalja u R/zemlje.R. Grcka je EL, a ne GR.
  [ok]     pokrivenost/agregati
  [GRESKA] pokrivenost/uravnotezen -- panel ima 209 redaka umjesto 220.
  [ok]     shema/varijable
  [ok]     shema/raspon
  [GRESKA] provenijencija -- broj upisan rukom u odjeljku Rezultati:
           0,45 postotna boda uz standardnu pogresku .
           Svaki broj mora doci iz results/procjene.json.
Error: Provjere nisu prosle: 4 od 7. Rukopis se ne gradi.
```

**KAŽEŠ** Tri greške, jedan prolaz, prije nego išta ode van.

**NAPRAVI** Zadrži se na zadnjem retku.

**KAŽEŠ** **Rukopis se ne gradi.** To nije upozorenje koje netko preskoči
pred rok. Datoteke jednostavno nema.

### 40:00 · Vrhunac

**NAPRAVI** Idi gore na redak `Nedostaje: GR` i zaustavi se.

**KAŽEŠ** Eurostat Grčku označava kao **EL**. Vi ste, kao i cijeli ostatak
svijeta, napisali **GR**. Panel je izgubio jednu zemlju i jedanaest redaka.

**NAPRAVI** Skrolaj gore na redak gradnje.

**KAŽEŠ** I evo gdje je to pisalo cijelo vrijeme. **Sjećate se retka koji sam
tražio da zapamtite?** Prije je pisalo 220 opažanja i 20 zemalja. Sada piše
209 i 19.

**NAPRAVI** Stanka.

**KAŽEŠ** Prošlo je pokraj mene. **Ništa nije puklo.** Da nema donjeg dijela
ispisa, ovaj bi rad izašao van s devetnaest zemalja i s krivim koeficijentom.

**KAŽEŠ** *(prizemljenje)* Ovo nije izmišljena opasnost. Jedna je od
najčešćih tihih grešaka u radu s europskim podacima i **dogodila se meni**.

### 42:00 · Zatvaranje

**NA EKRANU** Terminal.

```
Rscript demo/vrati.R
Rscript analysis/run.R
git diff
```

**KAŽEŠ** Malo, pregledno, i sve se može poništiti. To je cijela petlja.

### 43:00 · Treća greška, pobliže

**NA EKRANU** Slajd s dva retka ispisa.

**NAPRAVI** Ovaj slajd je zbog kojeg će te pamtiti. Ne žuri.

**KAŽEŠ** Panel padne s 220 na 209. Nagib se pomakne s nula zarez šezdeset
jedan na nula zarez šezdeset devet. I **ništa ne pukne.** Kod se izvrši,
slike se nacrtaju, tekst se sastavi.

**KAŽEŠ** *(najoštriji dio, vrijedi ga izgovoriti)* A recenzent to ne bi
uhvatio **baš zato što je ostatak projekta dobro napravljen.** Tekst brojeve
dohvaća sam, pa bi u radu pisalo devetnaest zemalja i 209 opažanja, posve
dosljedno. Rad koji je iznutra savršen i izvana kriv.

### 44:00 · Što smo vidjeli

**KAŽEŠ** Plan prije rada. Dopuštenja koja drže. Provjera koja hvata.

**KAŽEŠ** **I ovo je poanta. Sve tri greške su tihe.** Nijedna ne ruši kod.
Sve tri bi prošle recenziju. Sve tri promakle bi umornom čovjeku pred rok,
uključujući mene.

**→** Sad tri granice, pošteno.

---

# 5 · Granice · 45:00 – 53:00

### 45:20 · Ako podaci ne smiju izaći

**NAPRAVI** Ovo je pitanje koje su ti htjeli postaviti. Odgovori prije nego
stignu.

**KAŽEŠ**

- Prvo, **pravila pristupa**. Kako je ovdje postavljeno, agent orkestrira
  analizu čije ulaze ne čita. Zabrana je u datoteci, a provjera je dokazuje.
- Drugo, **uvjeti**. Pretplata i plaćanje po upotrebi nemaju iste uvjete o
  tome što se smije s vašim podacima. Pročitajte ih prije nego uvedete alat u
  instituciju.
- Treće, **lokalno**. Za podatke koji ne smiju napustiti zgradu postoje
  modeli s otvorenim težinama koji rade na vašem računalu. Slabiji su, ali za
  označavanje i čišćenje sasvim dovoljni.

**KAŽEŠ** Druga i treća stavka su **nabava, a ne alat**. Riješite to prije
projekta, ne usred njega.

**→** I posljednja granica, podjela rada.

### 49:00 · Što ne delegirati

**NAPRAVI** Lijevu karticu pročitaj brzo, desnu polako.

**KAŽEŠ**

- Delegirajte čišćenje podataka, spajanje tablica, slike po predlošku,
  refaktoriranje, dokumentaciju, testove, ponovne procjene, robusnost.
- Ne delegirajte istraživačko pitanje, izbor specifikacije, tumačenje nalaza,
  **snagu tvrdnje**, odluku o objavi.

**KAŽEŠ** Desni stupac **nije stvar ukusa**. To nije popis stvari koje su
meni drage. To su redci iz gornje polovice one tablice, oni koje ne biste
primijetili da su krivi. Cijela podjela rada ispada iz jedne osi.

**KAŽEŠ** Postoji empirijski nalaz koji ovo sažima. Alat **podiže pod, ne
strop**. Najviše dobivaju početnici, iskusni gotovo ništa. Iskusna prosudba
time postaje **rjeđi**, a ne suvišniji ulaz.

**→** Sažmimo radionicu u pet redaka.

---

# 6 · Zaključak · 53:00 – 59:00

### 53:00 · Pet redaka za ponijeti

**NAPRAVI** Pročitaj ih naglas, sve. Traje dvadeset sekundi.

**KAŽEŠ** Jedan pojam, dug provjere, i raste dok ga ne pogledate. Dvije
odluke, kontekst i dopuštenja, trećega nema. Četiri datoteke, ustav,
dopuštenja, pravilo, provjere. Jedna petlja, opiši, plan, odobri, izvrši,
**provjeri**, commit. I jedno pitanje, **biste li primijetili da je ovo
krivo**.

### 55:00 · Zadatak za početak

**NAPRAVI** Stani mirno. Ovo je zadnja stvar koju pamte.

**KAŽEŠ**

- Ne tražim od vas da preuredite način rada. Tražim jedno. **Klonirajte
  repozitorij, uzmite jedan svoj projekt i napišite mu `CLAUDE.md`.**
- Dvadeset redaka. Što je projekt, gdje što stoji, što se nikad ne dira.
  **Bez ijednog retka novog istraživanja.**
- Sljedeći tjedan dodajte jednu provjeru. I to ne bilo koju, nego onu koja
  hvata grešku koja vam se **već jednom dogodila.** Svatko ima takvu grešku.

**KAŽEŠ** *(zadnja rečenica, polako)* Jer ako je proizvodnja rezultata
postala gotovo besplatna, onda je jedino što još razlikuje istraživanje od
teksta **to što se može provjeriti, i to bez vas.**

### 57:30 · Materijali

**KAŽEŠ** Sve je gore. Slajdovi, repozitorij, upute za prijenos na vlastiti
projekt, pojmovnik i literatura. Kod pod MIT-om, tekst pod CC BY. Podaci su
stvarni i javni, dvije Eurostatove tablice. Izvolite pitanja.

---

# Ako zapne

**Pravilo šezdeset sekundi.** Ako bilo što stoji dulje od minute, dakle spor
odgovor modela, mreža ili neočekivana greška, **prijeđi na snimku bez isprike
i nastavi pripovijedati.** Ne otklanjaj kvarove uživo.

Snimke, po redoslijedu.

1. Prvi dio, od zahtjeva do gotove treće slike.
2. Ispis s tri greške i porukom da se rukopis ne gradi.
3. Čist prolaz.

**Ako agent napravi nešto neočekivano**, reci to naglas. Odbijanje lošeg
plana pred publikom vrijedi više od glatkog uspjeha.

**Ako kasniš**, režeš iz sekcije 5. Demonstracija i zaključak se ne diraju.
Unutar sekcije 3 prvo pada slajd s dijagramom puta, on je jedini koji nije
nužan.

---

# Poslije demonstracije

```
Rscript demo/vrati.R
git checkout -- .
Rscript analysis/run.R
```

Prva naredba vraća podmetnute greške. Druga vraća izmjene koje je agent
napravio u prvom dijelu, jer njih `vrati.R` ne dira. Treća potvrđuje da je
sve zeleno.

Napravi to prije nego išta objaviš ili prije sljedeće probe, da repozitorij
koji ljudi kloniraju bude čist.

---

# Pripremljena pitanja

**Nije li ovo previše režije za jedan rad?**
Četiri datoteke i jedna naredba. Prve tri su obični tekst i pišu se popodne.
Režija je jednokratna, a plaća se pri prvom koautorstvu, prvoj recenziji i
prvom povratku na projekt nakon šest mjeseci.

**Mi radimo u Stati ili Excelu.**
Prve tri datoteke su obični tekst i ne ovise ni o čemu. Mijenja se samo
četvrta i naredba kojom se pokreće. U Stati je to master do-datoteka koja na
kraju pokreće nekoliko `assert` naredbi. U Excelu ovo ne radi i to je jedini
stvarni razlog da se iz Excela izađe.

**Smijemo li uopće koristiti AI na osjetljivim podacima?**
Kako je postavljeno, agent nikad ne vidi ograničene podatke, nego orkestrira
analizu čije ulaze ne čita. Ali komercijalne uvjete i verziju alata
provjerite prije institucionalne primjene. To nije stvar alata nego nabave.

**Koliko to košta?**
Manje od jedne studentske pomoći po istraživaču mjesečno, ali cijene se
mijenjaju. Provjerite ih u tjednu izlaganja umjesto da vjerujete slajdu.

**Zar agent ne može sam napisati te provjere?**
Može, i to je dobar prvi zadatak. Ali provjeru koja hvata **vašu** tipičnu
grešku morate opisati vi, jer agent ne zna što vam se već dogodilo. Zato je
zadatak za ovaj tjedan `CLAUDE.md`, a ne provjere.

**Što ako se model promijeni pa se ponašanje promijeni usred projekta?**
Zato su provjere u repozitoriju, a ne u glavi. Promjena modela ne može
promijeniti to da gradnja pukne na broju upisanom rukom. Za institucionalni
rad dodatno zaključajte verziju alata u zajedničkoj konfiguraciji.

---

# Šalabahter

```
ruke gore  ->  dug provjere  ->  dvije odluke
  ->  GOTOV RAD  ->  ista recenica u izvoru  ->  procjene.json  ->  CIST PROLAZ
  ->  CLAUDE.md  ->  zahtjev  ->  plan  ->  odobri  ->  REFERENCA, NE BROJ
  ->  podmetni  ->  run.R  ->  TRI GRESKE  ->  skrolaj gore na 19 zemalja
  ->  vrati.R  ->  zeleno  ->  git diff  ->  jedan CLAUDE.md ovaj tjedan
                                     |  zapne >60 s  ->  snimka
```
