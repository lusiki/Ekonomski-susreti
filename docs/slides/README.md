# Konferencijska prezentacija

`index.html` je izvor prezentacije za preglednik. Sadrži svih 17 slajdova i
bilješke za izlagače, osvježene prema radu od 28. rujna 2026. Prikaz obuhvaća
siječanj 2021. – kolovoz 2026. i ostaje deskriptivan. Identifikatori slajdova
ostaju stabilni za postojeće poveznice, iako su raniji naslovi zamijenjeni.

`presentation-layout.css` određuje zajednički izgled slajdova i PDF-a.
`presentation-ekonomski-susreti.css` prilagođava taj raspored Reveal.js pregledniku.
Statična pisma Roboto učitavaju se lokalno preko `presentation-fonts.css`.

## Obnova PDF-a

Iz korijena repozitorija, uz Python 3 i Node.js s paketom Playwright:

```sh
python scripts/build-presentation-print.py
node scripts/export-presentation.cjs
```

Playwright koristi svoj Chromium. Za postojeću instalaciju Chromea može se
postaviti varijabla `CHROME_PATH` na putanju izvršne datoteke.

Prva naredba izrađuje `print.html` iz istog izvora, bez bilježaka za izlagače.
Druga čeka učitavanje pisama i slika, provjerava dodire sadržaja s podnožjem te
sprema `docs/downloads/Ekonomski-susreti.pdf`. Nakon izvoza treba vizualno
provjeriti sve stranice. `?print-pdf` otvara ovu zajedničku verziju za ispis.

Strelice mijenjaju slajd, `o` otvara pregled svih slajdova, `s` bilješke za
izlagača, a izbornik u donjem lijevom kutu pruža ostale alate.

## Izvori grafikona i obuhvat osvježavanja

Izvor je [rad od 28. rujna 2026.](https://lusiki.github.io/HNB_Media_Attention/media/downloads/PAPER_EXT.html),
iz repozitorija `lusiki/HNB_Media_Attention`, revizija
`b2187d34159b5d40caeecb2694640331e4aeae71`.

- Godišnji grafikoni reproduciraju tablicu 1. Udio je omjer godišnjih zbrojeva
  brojnika i nazivnika, ne običan prosjek mjesečnih udjela. Vrijednosti su
  objavljene na dvije decimale. Godina 2026. ima osam mjeseci i nije prognozirana
  niti preračunata na cijelu godinu.
- Mjesečni grafikoni prikazuju izvorne panele slika 1 i 3. CSS ih izdvaja i
  prikazuje u sivim tonovima, bez promjene točaka ili ljestvica. Paneli bez
  vlastite vremenske osi dobivaju godine na položajima izvorne zajedničke osi.
  Mjesečne vrijednosti nisu digitalizirane, procijenjene ni spojene sa starijim CSV-om.
- Zbrojevi tablice 1 daju 124.163 institucionalne i 65.530 relevantnih objava u
  68 potpunih mjeseci. Veći zbrojevi u tekstu rada uključuju nepotpuni rujan.
- Primarni korpus uključuje nazive HNB-a i generičke izraze za središnje banke.
  Nije riječ samo o izričitim spominjanjima HNB-a, vlastitim priopćenjima banke
  ili uredničkim člancima. Potencijalni doseg nije stvarna čitanost.
- Ranije regresijske tablice, instrumentalne varijable, testovi režima,
  projekcije očekivanja i stari graf vlastite komunikacije uklonjeni su iz izlaganja.
  Novi rad ne potvrđuje stabilnu vezu s budućim očekivanjima potrošača.

Podaci, definicije, revizija i kontrolni zbrojevi nalaze se u
`data/descriptive-20260928.json`. Slike i obnovljivi godišnji grafikoni su u
`figures-20260928/`. Za obnovu, uz `beautifulsoup4` i `matplotlib`:

```sh
python scripts/build-descriptive-figures.py
```

Skripta čita točno određenu verziju rada i provjerava njezin SHA-256. Moguće je
zadati lokalni primjerak s `--source PUTANJA`. Ne procjenjuje ekonometrijske modele.

PowerPoint preuzimanje i petostrani pregled zasebni su raniji materijali i ne
sadrže ovo osvježavanje. Aktualni slajdovi i njihov PDF nastaju iz istog HTML-a.
