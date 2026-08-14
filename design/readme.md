# Ekonomski susreti 2026 — dizajn sustav

Javno lice jednog istraživanja i jedne radionice za konferenciju Ekonomski susreti,
Split, hotel Lav, 27. i 28. studenog 2026. Istraživanje mjeri institucionalni jaz u
pažnji Hrvatske narodne banke u medijima, radionica pita tko istraživačku tvrdnju
može provjeriti i uz koliki trošak. Autori su Petra Palić i Luka Sikić,
Hrvatsko katoličko sveučilište.

Stil je Bauhaus u doslovnom smislu. Bijeli papir, crna tinta, ništa drugo. Tanke
linije umjesto okvira, strogi raster umjesto kartica, pravi kutovi, bez sjena i
gradijenata, mnogo namjerno prazne bijele površine. Cijelu hijerarhiju nosi tipografija.

## Izvori

Tekstovi potječu iz konferencijske prijave i sažetaka u `uploads/`. Nije priložen
logotip ni Figma. Roboto se učitava s Google Fonts dok se ne prilože lokalne datoteke pisma.

## Kazalo

- `styles.css` — ulazna točka, samo uvozi tokene
- `tokens/` — boje, tipografija, raster, pismo
- `guidelines/` — kartice s uzorcima boja, pisma, razmaka, grafikona i pisanja
- `components/core/` — SectionLabel, Stat, NavBar, LadderRow, PageFooter
- `slides/` — uzorci naslovnog, sekcijskog i grafikonskog slajda, 1280 na 720
- `Pocetna.dc.html`, `Sazeci.dc.html`, `Radionica.dc.html` — žive stranice, ujedno UI kit
- `SKILL.md` — uputa za agente

## Temelji sadržaja

Mirna tekuća proza na hrvatskom, bez crtica, dvotočaka i točke sa zarezom. Metode se
imenuju riječima koje razumije opći čitatelj, a pojam poput jaza u pažnji objasni se
gdje se prvi put spomene. Nema uzvika, nema marketinškog tona, nema emojija. Obraćanje
je neutralno, u trećem licu ili mi obliku. Primjer tona, iz sažetka. "Vlastita
komunikacija banke pritom nije oslabjela, nego je bila intenzivnija u razdobljima jače
inflacije, pa jaz nastaje u prijenosu kroz medije, a ne u šutnji institucije."
Brojevi se pišu hrvatski, decimalni zarez i točka za tisućice, na primjer 0,00201 i 58.448.

## Vizualni temelji

- Boje. Papir #ffffff i tinta #000000. Sivi tonovi #555555, #8a8a8a, #bdbdbd samo za
  sekundarni tekst i serije grafikona. Meka linija popisa #d9d9d9. Ništa drugo.
- Pismo. Roboto u svim materijalima. Naslovi vrlo veliki i vrlo lagani, težina 100 do
  300. Oznake sekcija 11 do 12 px, težina 700, verzal, razmak slova 0.16 do 0.2 em,
  uvijek nad linijom od 1 px. Tekući tekst težina 400, 15 do 17 px, prored 1.65.
  Naglasak je težina 500 ili 700, nikad boja.
- Pozadine. Uvijek čisti papir. Nema slika, tekstura, uzoraka ni gradijenata.
  Fotografija se ne koristi. Ako slika ikad zatreba, crno bijela i iza tanke linije.
- Raster. Sadržaj u stupcu do 1120 px, rub 48 px, mjera teksta do 720 px. Razmaci u
  skoku od 8 px, tipično 16, 24, 32, 48, 64, 96. Susjedne cjeline slaže flex ili grid s gap.
- Rubovi i kutovi. Pravi kutovi, polumjer 0. Tanka linija od 1 px umjesto svake kutije,
  kartice i okvira. Bez sjena, unutarnjih i vanjskih. Bez prozirnosti i zamućenja.
- Stanja. Poveznice su crne i podcrtane, na prijelaz miša postanu #555555. Trenutna
  stranica u navigaciji je podcrtana. Bez animacija, iznimno diskretan fade do 200 ms.
- Grafikoni. Sivi tonovi, serije razdvojene debljinom linije i crticama, ne bojom.
  Oznake izravno uz kraj serije, bez legendi u okvirima. Stranica mora izgledati
  jednako na projektoru, u tisku i u sivim tonovima.

## Ikonografija

Nema ikona, ikonskog pisma ni emojija. Dopušteni su samo tipografski znakovi, srednja
točka · kao razdjelnik i strelica → uz poveznice kada je nužna. Nema logotipa, marka
se piše čistim verzalom, Ekonomski susreti 2026. Ne crtati ni rekonstruirati znakove.

## Namjerna dopuna

Komponente su autorske jer izvor ne definira komponentnu knjižnicu, izvedene su iz
živih stranica projekta i svedene na pet dijelova koji se stvarno ponavljaju.
