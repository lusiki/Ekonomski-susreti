# Kada inflacija istisne glas središnje banke

Ovo je javni repozitorij istraživanja **„Pasivno zamijenjena. Cijena inflacije koju ne mjeri indeks potrošačkih cijena”** Petre Palić i Luke Sikića. Projekt prati mijenja li se relativna medijska vidljivost Hrvatske narodne banke s rastom inflacije. Istražuje i može li učestalost članaka o HNB-u pomoći u predviđanju inflacijskih očekivanja kućanstava.

[![Prezentacija](https://img.shields.io/badge/prezentacija-otvori-000000?style=flat-square&labelColor=000000)](https://lusiki.github.io/Ekonomski-susreti/slides/)
[![Sažeci](https://img.shields.io/badge/sažeci-pročitaj-000000?style=flat-square&labelColor=000000)](https://lusiki.github.io/Ekonomski-susreti/abstracts/)
[![Pregled](https://img.shields.io/badge/pregled_istraživanja-PDF-000000?style=flat-square&labelColor=000000)](https://lusiki.github.io/Ekonomski-susreti/downloads/Pregled-istrazivanja.pdf)
[![GitHub Pages](https://github.com/lusiki/Ekonomski-susreti/actions/workflows/pages.yml/badge.svg)](https://lusiki.github.io/Ekonomski-susreti/)

<a href="https://lusiki.github.io/Ekonomski-susreti/"><img src="docs/assets/qr-projekt.svg" alt="QR kod koji vodi na stranicu projekta" width="150" align="right"></a>

Skenirajte QR kod mobitelom kako biste otvorili stranicu projekta sa sažecima, prezentacijom i svim materijalima radionice. Kod vodi na [lusiki.github.io/Ekonomski-susreti](https://lusiki.github.io/Ekonomski-susreti/).

<br clear="right">

## Materijali

| Sadržaj | Pregled | Preuzimanje |
|---|---|---|
| Sažetak izlaganja | [Kada inflacija istisne glas središnje banke](https://lusiki.github.io/Ekonomski-susreti/abstracts/#izlaganje) | [tekst](materials/abstract-presentation.md) |
| Sažetak radionice | [Umjetna inteligencija u ekonomskim istraživanjima](https://lusiki.github.io/Ekonomski-susreti/abstracts/#radionica) | [tekst](materials/abstract-workshop.md) |
| Sažeti prikaz istraživanja | Pet stranica s glavnim nalazima i grafikonima | [PDF](https://lusiki.github.io/Ekonomski-susreti/downloads/Pregled-istrazivanja.pdf) · [izvor](materials/brief/pregled.qmd) |
| Konferencijska prezentacija | [Otvori slajdove u pregledniku](https://lusiki.github.io/Ekonomski-susreti/slides/) | [PDF](https://lusiki.github.io/Ekonomski-susreti/downloads/Ekonomski-susreti.pdf) · [PowerPoint](https://lusiki.github.io/Ekonomski-susreti/downloads/Ekonomski-susreti.pptx) |
| Materijali radionice | [Rad u repozitoriju i demonstracija](https://lusiki.github.io/Ekonomski-susreti/workshop/) | [slajdovi](https://lusiki.github.io/Ekonomski-susreti/workshop/slides/) · [jedna stranica](https://lusiki.github.io/Ekonomski-susreti/workshop/handout.html) |

## Sadržaj

- [Istraživački problem](#istraživački-problem)
- [Radionica](#radionica)
- [Glavni nalazi](#glavni-nalazi)
- [Podaci i metode](#podaci-i-metode)
- [Zašto je rezultat važan](#zašto-je-rezultat-važan)
- [Sadržaj prezentacije](#sadržaj-prezentacije)
- [Ponovljivost analize i podaci](#ponovljivost-analize-i-podaci)
- [Oblikovanje](#oblikovanje)
- [Autori i citiranje](#autori-i-citiranje)

## Istraživački problem

Poruka središnje banke može utjecati na očekivanja tek kada stigne do javnosti. U digitalnim medijima urednici biraju koje će vijesti objaviti, a mnoge se teme istodobno natječu za pažnju publike.

Projekt zato postavlja dva povezana pitanja.

1. Povećava li viša inflacija **institucionalni jaz u pažnji**, odnosno odmak vidljivosti HNB-a u vijestima o cijenama od razine iz prve polovice 2021.?
2. Pomaže li manji udio članaka o HNB-u među vijestima o cijenama predvidjeti pesimističnija inflacijska očekivanja kućanstava?

## Radionica

Uz izlaganje Luka Sikić vodi šezdesetominutnu radionicu **[Umjetna inteligencija u ekonomskim istraživanjima](workshop/)**. Radionica se može pratiti samostalno, bez prethodnog izlaganja.

Istraživači se umjetnom inteligencijom najčešće služe u pregledniku, odvojeno od datoteka na kojima rade. Alat tada vidi samo dio koda koji mu pošalju. Ne poznaje ostatak projekta, ne može pokrenuti cijeli postupak ni koristiti provjere koje su već ugrađene u projekt. Na radionici s alatom radimo izravno u repozitoriju. Alat tada može pokrenuti analizu i druge dijelove projekta, a automatske provjere otkrivaju pogreške u njegovu radu.

Umjetna inteligencija može vrlo brzo napisati mnogo koda. Provjera tog koda i dalje traži vrijeme. Odgođena provjera stvara **dug provjere**. Četiri datoteke u repozitoriju čuvaju kontekst, određuju dopuštenja, postavljaju pravilo za izmjene i pokreću automatske provjere. Sudionici dobivaju repozitorij koji mogu preuzeti i pokrenuti jednom naredbom te upute za primjenu istog načina rada u vlastitom projektu.

U pokaznom primjeru procjenjujemo Phillipsovu krivulju za dvadeset zemalja europodručja s pomoću dviju javnih Eurostatovih tablica. U projekt namjerno unosimo tri greške koje automatske provjere pronalaze. U prvoj podaci s ograničenim pristupom završe u javnom tekstu. U drugoj ručno upisan koeficijent više ne odgovara procjeni. Treća izostavlja cijelu zemlju zbog pogrešne oznake. Eurostat za Grčku koristi EL, a većina drugih izvora GR.

Materijali se nalaze u mapi [`workshop/`](workshop/) i obuhvaćaju [slajdove](workshop/slides/slides.qmd), [upute za primjenu](workshop/PRESADI.md), [jednu stranicu za tisak](workshop/handout.html), [pojmovnik](workshop/GLOSSARY.md), [literaturu](workshop/READING.md) i [sam repozitorij](workshop/projekt/).

## Glavni nalazi

- Viša inflacija povezana je s većim institucionalnim jazom u pažnji. Kad je inflacija viša za jedan postotni bod, procijenjeni jaz veći je za približno **0,0021 jedinicu**.
- Kad raste broj vijesti o cijenama, udio članaka u kojima se spominje HNB smanjuje se. Za prosječan doseg objave ne nalazimo jednako jasnu promjenu.
- Manji udio članaka o HNB-u pomaže predvidjeti pesimističnija očekivanja kućanstava **2 do 12 tjedana** poslije. To ne znači da medijska izloženost uzrokuje promjenu očekivanja.
- HNB je tijekom inflacijskog vala objavljivao više vlastitih sadržaja. Njegov se udio u vijestima o cijenama ipak smanjio.
- Nakon uvođenja eura 1. siječnja 2023. veza između inflacije i jaza slabi. Ton medijskog izvještavanja postaje važniji.

## Podaci i metode

Analiza obuhvaća hrvatske digitalne medije od siječnja 2021. do siječnja 2024.

- više od **19 milijuna** dostupnih digitalnih objava
- **58.448** objava o HNB-u
- **263.601** objava o inflaciji
- **1.239** medijskih izvora
- 36 mjesečnih opažanja i 157 tjednih opažanja u glavnoj analizi

Glavna procjena povezuje jaz s inflacijom i uključuje kontrolne varijable. Instrumentalnim varijablama provjeravamo može li smjer veze biti obrnut. Kao vanjske izvore promjena hrvatske inflacije koristimo cijene hrane i energije u europodručju. Razdoblja prije i nakon uvođenja eura uspoređujemo metodom razlike u razlikama. Vezu s očekivanjima pratimo lokalnim projekcijama. Pouzdanost rezultata provjeravamo specifikacijskim krivuljama, permutacijskim testovima i usporedbom s HANFA-om, institucijom koja nema mandat za stabilnost cijena.

## Zašto je rezultat važan

Jasna i vjerodostojna poruka može djelovati tek kada dovoljno često stigne do javnosti. Projekt zato pokazuje da je za prijenos monetarne politike važno koliko često poruka dolazi do publike. Središnja banka taj prijenos može ojačati češćim stručnim objašnjenjima inflacije u neovisnim medijima.

Nakon ulaska Hrvatske u europodručje ključnu kamatnu stopu određuje Europska središnja banka. HNB i dalje ima prednost u objašnjavanju domaćih kretanja cijena i može javnosti objasniti kako se odluke ECB-a prenose na Hrvatsku.

## Sadržaj prezentacije

Konferencijsko izlaganje traje dvadeset minuta i prati deset koraka.

1. paradoks medijske vidljivosti HNB-a
2. način na koji mediji prenose poruke središnje banke
3. istraživačka pitanja i doprinos rada
4. podaci korišteni u analizi
5. institucionalni jaz u pažnji, broj objava i njihov doseg
6. način procjene i granice zaključaka
7. tri glavna nalaza
8. provjera vlastite komunikacijske aktivnosti HNB-a
9. promjene nakon uvođenja eura
10. provjere pouzdanosti, ograničenja i preporuke za komunikacijsku politiku

## Ponovljivost analize i podaci

U ovom su repozitoriju javno dostupni materijali projekta: sažeci izlaganja i radionice, pregled istraživanja na pet stranica, konferencijska prezentacija i svi materijali radionice.

Cjeloviti rad još je u radnoj verziji i dostupan je na upit autorima. Izvorna baza medijskog praćenja i izvedeni podaci o pojedinim objavama nisu objavljeni zbog uvjeta pristupa izvornom sustavu i mogućeg sadržaja trećih strana. Zato se iz ovih materijala ne može u cijelosti ponoviti analiza. Rezultati u prezentaciji dolaze iz analitičkog projekta autora. U radu i slajdovima jasno navodimo govori li pojedini rezultat o uzročnoj vezi ili samo pomaže u predviđanju.

## Oblikovanje

Svi materijali koriste isti vizualni sustav, zapisan u mapi [`design/`](design/). Datoteka [`README.md`](design/README.md) opisuje pravila, a [`design-system.md`](design/design-system.md) daje sažetak na jednoj stranici. Mapa `tokens/` sadrži boje, pismo, tipografiju i raster. U `guidelines/` su primjeri, u `components/core/` pet komponenti koje se ponavljaju, a u [`pages/`](design/pages/) tri radne stranice s obrascima navigacije, oznaka sekcija i podnožja.

Predložak slijedi bauhausovski stil s mnogo praznog prostora, crnim tekstom na bijeloj podlozi, tankim linijama, oštrim kutovima i bez sjena. Veličina i debljina slova razlikuju naslove, međunaslove i tekući tekst. Sadržaj je smješten u stupac širine najviše 1120 piksela s rubom od 48 piksela. Odjeljke dijele linije od jednog piksela, a razmaci rastu u koracima od osam piksela. Pismo Roboto priloženo je u mapi [`fonts/`](fonts/) za izradu PDF-a i u [`docs/fonts/`](docs/fonts/) za stranicu, uz Apache licenciju. Grafikoni koriste sive tonove, a serije se razlikuju debljinom i vrstom linije.

Pravila oblikovanja za svaki oblik materijala nalaze se u zasebnim datotekama. Stranica koristi [`docs/style.css`](docs/style.css), a prezentacije [`docs/slides/presentation-ekonomski-susreti.css`](docs/slides/presentation-ekonomski-susreti.css) i [`workshop/slides/theme.scss`](workshop/slides/theme.scss). Tiskani materijali koriste [`workshop/handout.html`](workshop/handout.html) i [`materials/brief/pregled.qmd`](materials/brief/pregled.qmd), a grafikoni [`workshop/projekt/R/slike.R`](workshop/projekt/R/slike.R).

## Autori i citiranje

**Petra Palić** i **Luka Sikić**  
Hrvatsko katoličko sveučilište

Radionicu drži **Luka Sikić**.

Za citiranje predlažemo sljedeći zapis.

> Palić, P. i Sikić, L. (2026). *Pasivno zamijenjena. Cijena inflacije koju ne mjeri indeks potrošačkih cijena. Institucionalni jaz u pažnji u hrvatskom digitalnom medijskom ekosustavu*. Radni materijal.

Strojno čitljivi metapodaci dostupni su u datoteci [`CITATION.cff`](CITATION.cff).

---

Materijali su radna verzija istraživanja. Stavovi izneseni u radu isključivo su stavovi autora i ne odražavaju nužno stavove Hrvatskog katoličkog sveučilišta.
