# Konferencijska prezentacija

`index.html` je izvor za 24 slajda u pregledniku, bilješke izlagača i PDF.
Prezentacija spaja dva jasno označena sloja:

- Ažurirana deskriptiva od siječnja 2021. do kolovoza 2026., prema radu od
  28. rujna 2026. Mjesečni grafikoni imaju po 68 stupaca.
- Ekonometrijski rezultati početnog rada za 2021.–2023., uz 36 mjesečnih i
  157 tjednih opažanja u osnovnim modelima. Izvorni rad navodi granicu
  prikupljanja 1. siječnja 2024. Ti modeli nisu ponovno procijenjeni.

Izvorni nalaz o očekivanjima nije predstavljen kao rezultat cijelog razdoblja
do 2026. Dulji rad ne potvrđuje stabilnu vezu s budućim očekivanjima. Ranija
IV potpora također ne prenosi se automatski na dulji uzorak.

## Izgled i obnova PDF-a

`presentation-layout.css` određuje zajednički izgled. Reveal.js prilagodbe su
u `presentation-ekonomski-susreti.css`, a lokalni Roboto u `presentation-fonts.css`.

Iz korijena repozitorija:

```sh
python scripts/build-monthly-figures.py
python scripts/build-original-figures.py
python scripts/build-presentation-print.py
node scripts/export-presentation.cjs
```

Grafikoni zahtijevaju Python i matplotlib. PDF zahtijeva Node.js i Playwright.
Za instalirani Chrome može se zadati `CHROME_PATH`. Izvoz čeka slike i pisma,
provjerava dodire sadržaja s podnožjem i sprema `docs/downloads/Ekonomski-susreti.pdf`.
Nakon obnove treba pregledati sve stranice. `?print-pdf` otvara zajednički ispis.
Strelice mijenjaju slajdove, `o` otvara pregled, a `s` bilješke izlagača.

## Ažurirane deskriptivne serije

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

## Izvorni ekonometrijski rezultati

Zadržani su rezultati ranije prezentacije iz revizije
`21ed849073dcc13e48a16a2e5fcf5fcaecd59ddd`. Glavne vrijednosti provjerene su u
autorskom `renders/PAPER_FINAL.html`; hash i izabrani rezultati su u
`data/original-results.json`.

- Tablica 4: tjedni koeficijent 0,00213 (slajd 0,0021), s kontrolom obujma,
  N = 157. To nije procjena ukupnog učinka niti novi model do 2026.
- Tablica 6: mjesečni koeficijent ekstenzivne margine −0,00474, odnosno
  približno −0,47 postotnih bodova; p = 0,0124. Intenzivna margina p = 0,3457.
- Tablica 7a: linearno mapiranje očekivanja daje Bonferroni-značajne testirane
  horizonte 2, 3, 4, 6, 8, 10 i 12. Kod stepenastog mapiranja 10. i 12. tjedan
  ne prolaze korekciju. Ispravljena je ranija preširoka tvrdnja o robusnosti.
- Graf očekivanja ponovno je nacrtan iz objavljene tablice 7a jer ranija slika
  nije odgovarala njezinim procjenama. Skala je promjena bilance uz 1 postotni
  bod veći udio objava. Intervali su β ± 1,96 SE iz objavljenih vrijednosti;
  ispunjenost točke označava Bonferroni p, ne pojedinačni interval.

Prediktivni horizonti i regresijski odnosi nisu mjesečne deskriptivne putanje.
Zato su točkasti grafikoni i intervali u izvornom ekonometrijskom dijelu
zadržani, uz mjesečne stupce u deskriptivnom dijelu.

PowerPoint i petostrani pregled zasebni su raniji materijali. Aktualni HTML i PDF
slajdovi nastaju iz istog izvora.
