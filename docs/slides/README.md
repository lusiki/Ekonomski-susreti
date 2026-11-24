# Konferencijska prezentacija

`index.html` je izvor za 27 slajdova u pregledniku, bilješke izlagača i PDF.
Izlaganje prati istraživačko pitanje, podatke, deskriptivne putanje, procjene
odnosa i posljedice za praćenje komunikacije.

- Deskriptivni grafikoni obuhvaćaju siječanj 2021. do kolovoza 2026., ukupno
  68 potpunih mjeseci. Svaki mjesečni stupac prikazuje stvarno opažanje.
- Ekonometrijske procjene obuhvaćaju 2021.–2023., uz 36 mjesečnih i 157 tjednih
  opažanja u osnovnim modelima. Razdoblje je označeno uz rezultate.
- Veza s očekivanjima tumači se prediktivno, uz osjetljivost na mapiranje
  mjesečnih očekivanja u tjedne. Promjena oko eura ne identificira njegov učinak.

Govorni vodič prati isti redoslijed i preuzima naslove i minijature iz slajdova.
Izvor govorne osnove je `materials/speaking-guide/lecture.json`, a objavljeni
PDF je `docs/downloads/Govorni-vodic-izlaganje.pdf`.

## Izgled i obnova PDF-a

`presentation-layout.css` određuje zajednički izgled. Reveal.js prilagodbe su
u `presentation-ekonomski-susreti.css`, a lokalni Roboto u `presentation-fonts.css`.

Iz korijena repozitorija:

```sh
python scripts/build-monthly-figures.py
python scripts/build-original-figures.py
python scripts/build-media-context-figures.py
python scripts/build-presentation-print.py
node scripts/export-presentation.cjs
python scripts/build-speaking-guide.py
```

Grafikoni zahtijevaju Python i matplotlib. PDF zahtijeva Node.js i Playwright.
Za instalirani Chrome može se zadati `CHROME_PATH`. Izvoz čeka slike i pisma,
provjerava dodire sadržaja s podnožjem i sprema `docs/downloads/Ekonomski-susreti.pdf`.
Nakon obnove treba pregledati sve stranice. `?print-pdf` otvara zajednički ispis.
Strelice mijenjaju slajdove, `o` otvara pregled, a `s` bilješke izlagača.

## Živi grafikoni

Slajdovi 6, 8 do 14, 19 i 22 u pregledniku zamjenjuju sliku živim grafikonom iz
istih provjerenih podataka. Početni prikaz odgovara slici. Pokazivač otkriva
vrijednosti, a traka iznad naslova dodaje i uklanja serije. PDF i `print.html`
i dalje koriste statične slike, pa se njihov izgled ne mijenja. Slajdovi 17 i
18 ostaju slike jer njihove točke nisu u repozitoriju.

- `live-charts.js` i `live-charts.css` sadrže cijeli sloj. Bez redaka na kraju
  `index.html` slajdovi ostaju statični.
- `vendor/echarts.min.js` je Apache ECharts 6.1.0 pod licencom Apache 2.0.
  Pohranjen je lokalno kako bi izlaganje radilo bez mreže.
- `data/*.js` nastaju naredbom `python scripts/build-live-data.py` iz četiriju
  JSON datoteka u istoj mapi. Tako grafikoni rade i kada se `index.html`
  otvori s diska.

Serija koja pripada slajdu ostaje u tinti, kao na slici. Boju dobivaju samo
dodane serije. Inflacija je narančasta (`#eb6834`), ponderirani udio plav
(`#2a78d6`), a relativna učestalost tirkizna (`#1baf7a`). Taj je skup provjeren
za sve parove, i za uobičajeni vid i za poremećaje raspoznavanja boja. Doseg i
brojevi objava ostaju crni i sivi. Vrsta linije i oznaka uz kraj linije nose
isto značenje kao boja, pa prikaz ostaje čitljiv i u crno-bijelom ispisu.

Svaki panel ima jednu ljestvicu. Serije u istoj jedinici dijele os. Serije u
različitim jedinicama prikazuju se kao indeks u kojem prva polovica 2021. iznosi
100, što je referenca institucionalnog jaza. Inflacija se ne indeksira. Kada
ne može dijeliti os u postocima, dobiva vlastiti poravnati panel. Na slajdu 11
dodana serija ulazi u panel svoje jedinice. Na slajdu 19 uz linearno se može
dodati stepenasto mapiranje iz iste Tablice 7a. Slajdovi 6, 14 i 22 pripadaju
širem medijskom kontekstu i opisani su u nastavku.

Tipke 1 do 5 dodaju ili uklanjaju serije redom kojim stoje u traci, `I` uključuje
indeks, a `0` vraća izvorni prikaz. PNG, SVG i CSV preuzimaju trenutačni prikaz.
Popis `FIGURES` na vrhu `live-charts.js` određuje koje su slike žive.
Oznaka `data-live-chart` na slici čuva vezu s grafikonom i pri izvozu samostalnog
HTML-a s ugrađenim slikama. Govorni vodič na drugoj stranici sažima kontrole za
izlaganje. Prije obnove HTML-a pokrenuti `python scripts/build-live-data.py`.

## Širi medijski kontekst

Slajdovi 6, 14 i 22 koriste javne agregate iz repozitorija
`lusiki/HNB_Media_Attention`, revizija `b2187d34159b5d40caeecb2694640331e4aeae71`,
mapa `media-hub/public/data`. Odabrane vrijednosti i SHA-256 svake izvorne
datoteke spremljeni su u `data/media-context-20260921.json`. Obnova iz lokalne
kopije tog repozitorija:

```sh
python scripts/build-media-context.py --source ../HNB_Media_Attention
python scripts/build-media-context-figures.py
python scripts/build-live-data.py
```

- Slajdovi 6 i 14 opisuju 33.235 objava koje izričito spominju HNB u 281 izvoru,
  izdanje podataka 2026-09-21.1. Taj je skup uži od institucionalnog korpusa
  ostalih slajdova i ne smije se s njim zbrajati ni dijeliti os bez oznake.
- Tematska područja su preklapajući popisi riječi bez neovisne provjere. Pokazuju
  prisutnost riječi u objavi, a ne njezinu glavnu temu.
- Oznake na slajdu 14 navode područja čije su riječi u tim mjesecima najčešće.
  Povezivanje s događajima u bilješkama izlagača autorsko je tumačenje.
- Gornji panel slajda 22 dolazi iz zamrznutog panela studije od 17. rujna 2026.
  Nema opažanja za siječanj do ožujka 2024. i završava u svibnju 2026. Donji
  panel je isti ponderirani udio kao na slajdu 9, iz izdanja od 28. rujna 2026.
  Paneli imaju zasebne ljestvice i različito su izvedeni, pa slajd opisuje smjer
  i ne uspoređuje razine.
- Zabilježene vlastite objave HNB-a su stavke iz kanala HNB-a koje je zabilježio
  sustav praćenja, a ne potpuni popis službenih dokumenata.
- Redak o kanalima na slajdu 24 dolazi iz razvojnog pregleda arhiva bez neovisne
  provjere. Redak o riječi inflacija na slajdu 26 odnosi se na potpuna tromjesečja.
- Broj od 480.221 objave o inflaciji na slajdu 5 zbroj je mjesečnih vrijednosti
  `inflation_posts` iz `data/monthly-20260928.json`.

## Deskriptivne serije

Izvor je [rad od 28. rujna 2026.](https://lusiki.github.io/HNB_Media_Attention/media/downloads/PAPER_EXT.html),
revizija repozitorija `lusiki/HNB_Media_Attention`
`b2187d34159b5d40caeecb2694640331e4aeae71`.

Mjesečni agregati preuzeti su iz autorskog spremljenog panela
`results/refresh_20260928/panel_monthly_analysis.csv`. SHA-256 izvornog panela je
`00891b1b173ed94d82b635fd51502f4c4155215c1e58d01182ccd57b3b6548be`.
Kontrolni zbroj odgovara `DELIVERY_MANIFEST.json`, a pripadajući HTML rada
byte-identičan je objavljenom radu. Odabrani agregati i provjera godišnjih zbrojeva
spremljeni su u `data/monthly-20260928.json`. Izvorni panel, tekstovi objava i
ostali privatni analitički stupci nisu kopirani u ovaj repozitorij.

Svih šest godišnjih zbrojeva broja objava i ponderiranih udjela podudara se s
tablicom 1. U prikazu je 124.163 institucionalne i 65.530 relevantnih objava u
68 uzastopnih potpunih mjeseci. Veći zbrojevi u tekstu rada uključuju nepotpuni
rujan, koji nije u grafikonima. Godišnji udio računa se iz zbrojeva brojnika i
nazivnika, uz korekciju +1 u nazivniku, a ne kao običan prosjek mjesečnih udjela.
Godina 2026. ima osam mjeseci i nije preračunata na cijelu godinu.

Stupci izravno koriste spremljene `pi_t`, `s_infl_core`, `IAG_ext`, `IAG_int` i
`n_infl_hnb`. Udjeli se množe sa 100; intenzivna margina ostaje omjer. Nema
digitaliziranja slika, interpolacije ni spajanja sa starijim javnim CSV-om.
Primarni korpus uključuje HNB i generičke izraze za središnje banke. Nije riječ
samo o izričitim spominjanjima HNB-a ili vlastitim priopćenjima banke.
Potencijalni doseg nije stvarna čitanost.

Godišnji graf obnovljiv je naredbom `python scripts/build-descriptive-figures.py`.
Ta skripta čita zamrznutu verziju rada i provjerava SHA-256. Izvorni rasteri
slika 1 i 3 zadržani su kao referenca, ali ih aktualni slajdovi zamjenjuju stupcima.

## Ekonometrijski rezultati

Izvor procjena je autorski `renders/PAPER_FINAL.html`. Hash izvornog dokumenta
i izabrani rezultati nalaze se u `data/original-results.json`. Slike regresijskih
odnosa potječu iz revizije `21ed849073dcc13e48a16a2e5fcf5fcaecd59ddd`.
Skripta za grafikone prikazuje spremljene procjene i ne procjenjuje modele.

- Tablica 4: tjedni koeficijent 0,00213 (slajd 0,0021), s kontrolom obujma,
  N = 157. Riječ je o uvjetnoj povezanosti uz kontrolu obujma.
- Tablica 6: mjesečni koeficijent ekstenzivne margine −0,00474, odnosno
  približno −0,47 postotnih bodova; p = 0,0124. Intenzivna margina p = 0,3457.
- Tablica 7a: linearno mapiranje očekivanja daje Bonferroni-značajne testirane
  horizonte 2, 3, 4, 6, 8, 10 i 12. Kod stepenastog mapiranja 10. i 12. tjedan
  ne prolaze korekciju. Slajd i govorni vodič navode tu osjetljivost.
- Graf očekivanja izrađuje se iz objavljene tablice 7a. Skala je promjena bilance uz 1 postotni
  bod veći udio objava. Intervali su β ± 1,96 SE iz objavljenih vrijednosti;
  ispunjenost točke označava Bonferroni p, ne pojedinačni interval.

Prediktivni horizonti i regresijski odnosi nisu mjesečne deskriptivne putanje.
Zato su točkasti grafikoni i intervali u ekonometrijskom dijelu
zadržani, uz mjesečne stupce u deskriptivnom dijelu.

HTML i PDF slajdovi nastaju iz istog izvora. Govorni vodič izrađuje se nakon
PDF-a kako bi njegove minijature odgovarale prikazanoj prezentaciji. PowerPoint
i petostrani pregled pohranjeni su kao zasebni materijali.
