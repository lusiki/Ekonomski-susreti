# Sustav oblikovanja za Ekonomske susrete 2026

Ovaj sustav oblikuje javne materijale istraživanja i radionice za konferenciju
Ekonomski susreti, koja će se održati 27. i 28. studenoga 2026. u Hotelu Lav u
Splitu. Istraživanje mjeri institucionalni jaz u medijskoj vidljivosti HNB-a.
Radionica pokazuje kako s umjetnom inteligencijom raditi u istraživačkom
repozitoriju. Autori su Petra Palić i Luka Sikić s Hrvatskoga katoličkog sveučilišta.

Sustav se oslanja na bauhausovski stil. Koristi bijelu podlogu, crni tekst i samo
jednu crvenu boju. Tanke linije zamjenjuju okvire, a strogi raster kartice. Kutovi
su pravi, nema sjena ni gradijenata, a praznog prostora ima mnogo. Tipografija
određuje hijerarhiju. Crvena označava elemente na koje se može kliknuti.

## Izvori

Tekstovi potječu iz konferencijske prijave i sažetaka u `uploads/`. Nisu priloženi
logotip ni datoteka iz Figme. Roboto se učitava iz datoteka u `docs/fonts/`, pa
paket radi i bez mrežne veze.

## Kazalo

- `styles.css` — glavna stilska datoteka; uvozi samo varijable
- `tokens/` — `colors.css`, `typography.css`, `layout.css`, `fonts.css`
- `guidelines/` — kartice s uzorcima boja, pisma, razmaka, linija i grafikona
- `components/core/` — SectionLabel, Stat, NavBar, LadderRow, PageFooter, svaki
  u tri datoteke, `.jsx` je kod, `.d.ts` je sučelje, `.prompt.md` je opis uporabe
- `slides/` — uzorci sekcijskog i grafikonskog slajda, 1280 na 720
- `pages/` — `Pocetna.dc.html`, `Sazeci.dc.html`, `Radionica.dc.html` uz `support.js`,
  radni primjeri stranica i zbirka elemenata sučelja
- `design-system.md` — sažetak sustava na jednoj stranici
- `SKILL.md` — uputa za agente
- `uploads/` — ulazni tekstovi, ostaju lokalno jer sadrže radne dokumente

## Stanje paketa

Pri izvozu su datoteke dobile pogrešna imena, pa je svaka preimenovana prema
svojem sadržaju. U izvozu nedostaju kartica o pisanju, naslovni slajd i opis
uporabe komponente Stat. Tipografske su varijable definirane ovdje jer ih
`styles.css` uvozi, a koriste ih sve komponente.

## Temelji sadržaja

Mirna tekuća proza na prirodnom hrvatskom, bez crtica, dvotočaka i točke sa zarezom.
Rečenice su kratke, glagoli konkretni, a riječi razumljive općem čitatelju. Metoda i
svaki stručni pojam objašnjavaju se gdje se prvi put spomenu. Izbjegavaju se nepotrebne
tuđice, gomilanje imenica i obrasci poput „nije X, nego Y” i „ne samo X, nego i Y”.
Nema uzvika, marketinškog tona ni emojija. Obraćanje je neutralno, u trećem licu ili
u prvom licu množine. Primjer tona iz sažetka glasi ovako. „HNB je u razdobljima više inflacije
objavljivao više vlastitih sadržaja. Doseg poruka banke ovisi i o tome koliko ih često
neovisni mediji prenose.” Brojevi se zapisuju prema hrvatskim pravilima, s
decimalnim zarezom i točkom za tisućice, na primjer 0,00201 i 58.448.

## Vizualni temelji

- Boje. Papir #ffffff i tinta #000000. Sivi tonovi #555555, #8a8a8a, #bdbdbd samo za
  sekundarni tekst i serije grafikona. Meka linija popisa #d9d9d9. Crvena #c8102e i
  tamnija #8e0b20 samo za poveznice i stanja fokusa. Ništa drugo.
- Pismo. Roboto u svim materijalima. Naslovi vrlo veliki i vrlo lagani, težina 100 do
  300. Oznake sekcija 11 do 12 px, težina 700, verzal, razmak slova 0.16 do 0.2 em,
  uvijek nad linijom od 1 px. Tekući tekst težina 400, 15 do 17 px, prored 1.65.
  Naglasak je težina 500 ili 700, nikad boja.
- Pozadine. Uvijek čisti papir. Nema slika, tekstura, uzoraka ni gradijenata.
  Fotografija se ne koristi. Ako slika ikad zatreba, treba biti crno-bijela i
  odvojena tankom linijom.
- Raster. Sadržaj u stupcu do 1120 px, rub 48 px, mjera teksta do 720 px. Razmaci se
  povećavaju u koracima od 8 px, najčešće 16, 24, 32, 48, 64 i 96 px. Susjedne
  cjeline raspoređuju se s pomoću CSS rasporeda `flex` ili `grid`, a razmak se
  zadaje svojstvom `gap`.
- Rubovi i kutovi. Kutovi su pravi i bez zaobljenja. Tanka linija od 1 px zamjenjuje
  kutije, kartice i okvire. Nema sjena, prozirnosti ni zamućenja.
- Stanja. Poveznice su crne i podcrtane, a pri prelasku pokazivačem postaju sive.
  Trenutačna stranica u navigaciji je podcrtana. Nema animacija, osim vrlo blagog
  prijelaza koji traje najviše 200 ms.
- Grafikoni. Koriste sive tonove. Serije se razlikuju debljinom i vrstom linije.
  Oznake izravno uz kraj serije, bez legendi u okvirima. Stranica mora izgledati
  jednako na projektoru, u tisku i u sivim tonovima.

## Ikonografija

Nema ikona, ikonskog pisma ni emojija. Dopušteni su samo tipografski znakovi, srednja
točka · kao razdjelnik i strelica → uz poveznice kada je nužna. Nema logotipa. Naziv
Ekonomski susreti 2026 piše se velikim slovima. Ne treba crtati ni rekonstruirati znakove.

## Namjerna dopuna

Izvor ne sadrži zbirku komponenata, pa su one izrađene za ovaj projekt. Izvedene
su iz postojećih stranica i svedene na pet dijelova koji se ponavljaju.
