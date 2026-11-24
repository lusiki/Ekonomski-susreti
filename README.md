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

Izlaganje povezuje medijsku zastupljenost, inflaciju i očekivanja kućanstava.
Mjesečni stupčasti grafikoni prikazuju siječanj 2021. do kolovoza 2026.
Regresijske procjene odnose se na 2021.–2023., uz 36 mjesečnih i 157 tjednih
opažanja u osnovnim modelima. [Dokumentacija slajdova](docs/slides/README.md)
navodi izvore podataka, definicije i postupak izrade.

Govorni vodič prati svih 27 slajdova, s minijaturama, tekstom za izlaganje,
prijelazima i kratkim odgovorima za raspravu.

| Sadržaj | Pregled | Preuzimanje |
|---|---|---|
| Sažetak izlaganja | [Kada inflacija istisne glas središnje banke](https://lusiki.github.io/Ekonomski-susreti/abstracts/#izlaganje) | [tekst](materials/abstract-presentation.md) |
| Sažetak radionice | [Umjetna inteligencija u ekonomskim istraživanjima](https://lusiki.github.io/Ekonomski-susreti/abstracts/#radionica) | [tekst](materials/abstract-workshop.md) |
| Sažeti prikaz istraživanja | Pet stranica s glavnim nalazima i grafikonima | [PDF](https://lusiki.github.io/Ekonomski-susreti/downloads/Pregled-istrazivanja.pdf) · [izvor](materials/brief/pregled.qmd) |
| Konferencijska prezentacija | [Otvori slajdove u pregledniku](https://lusiki.github.io/Ekonomski-susreti/slides/) | [PDF](https://lusiki.github.io/Ekonomski-susreti/downloads/Ekonomski-susreti.pdf) · [PowerPoint](https://lusiki.github.io/Ekonomski-susreti/downloads/Ekonomski-susreti.pptx) |
| Govorni vodič za izlaganje | Govorna osnova uz svih 27 slajdova | [PDF](https://lusiki.github.io/Ekonomski-susreti/downloads/Govorni-vodic-izlaganje.pdf) · [izvor](materials/speaking-guide/) |
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
- Manji udio članaka o HNB-u pomaže predvidjeti pesimističnija očekivanja kućanstava na testiranim horizontima **2 do 12 tjedana**, uz linearno mapiranje mjesečnih očekivanja u tjedne. Pri stepenastom mapiranju 10. i 12. tjedan ne prolaze korekciju za višestruko testiranje. Veza je prediktivna, a ne dokaz uzročnog učinka medijske izloženosti.
- HNB je tijekom inflacijskog vala objavljivao više vlastitih sadržaja. Njegov se udio u vijestima o cijenama ipak smanjio.
- Nakon uvođenja eura 1. siječnja 2023. veza između inflacije i jaza slabi. Ton medijskog izvještavanja postaje važniji.

## Podaci i metode

Deskriptivni prikaz obuhvaća 68 potpunih mjeseci od siječnja 2021. do kolovoza 2026.

- **124.163** institucionalne objave
- **65.530** objava relevantnih za inflacijski diskurs
- HNB i generički izrazi za središnje banke u promatranim digitalnim izvorima
- mjesečni stupci inflacije, ponderiranog udjela, broja objava, učestalosti i dosega
- 2026. obuhvaća osam mjeseci, bez preračunavanja na cijelu godinu

Ponderirani udio kombinira potencijalni doseg i istaknutost institucije. Godišnji
udio računa se iz zbrojeva brojnika i nazivnika. Potencijalni doseg nije stvarna
čitanost.

Ekonometrijski uzorak obuhvaća 2021.–2023., uz 36 mjesečnih i 157 tjednih
opažanja u osnovnim modelima. Glavna procjena povezuje jaz s inflacijom i uključuje
kontrolne varijable te Newey–West standardne pogreške. Instrumentalne varijable
koriste eurozonsku hranu i energiju, uz potrebne pretpostavke isključenja drugih
kanala. Lokalne projekcije ispituju prediktivnu vezu s očekivanjima. Chowov test i
interakcije ispituju promjenu odnosa oko uvođenja eura. Dodatne provjere obuhvaćaju
specifikacije, permutacije, HANFA-u te vladinu i vlastitu komunikaciju.

## Zašto je rezultat važan

Jasna i vjerodostojna poruka može djelovati tek kada dovoljno često stigne do javnosti. Projekt zato pokazuje da je za prijenos monetarne politike važno koliko često poruka dolazi do publike. Središnja banka taj prijenos može ojačati češćim stručnim objašnjenjima inflacije u neovisnim medijima.

Nakon ulaska Hrvatske u europodručje ključnu kamatnu stopu određuje Europska središnja banka. HNB i dalje ima prednost u objašnjavanju domaćih kretanja cijena i može javnosti objasniti kako se odluke ECB-a prenose na Hrvatsku.

## Sadržaj prezentacije

Konferencijsko izlaganje ima 27 slajdova i traje oko 23 minute. Za dvadeset minuta
uvodni, metodološki i tri slajda šireg medijskog konteksta prolaze se kratko; za
dulju raspravu prikladno je 25 minuta.

1. broj objava i relativni prostor u raspravi
2. tri istraživačka pitanja
3. korpus, tematska područja uz HNB i ponderiranje dosega i istaknutosti
4. mjesečni stupci inflacije, udjela, broja objava, učestalosti i dosega te najveći medijski mjeseci
5. godišnji sažetak cijelog razdoblja
6. institucionalni jaz i ekonometrijska strategija
7. rezultati o inflaciji, marginama i očekivanjima
8. promjena oko eura i provjere osjetljivosti
9. rasprava o vladinim mjerama i tumačenje relativnog prostora u raspravi
10. praćenje komunikacije, ograničenja i rasprava

## Ponovljivost analize i podaci

U ovom su repozitoriju javno dostupni materijali projekta: sažeci izlaganja i radionice, pregled istraživanja na pet stranica, konferencijska prezentacija i svi materijali radionice.

Cjeloviti [radni tekst istraživanja](https://lusiki.github.io/HNB_Media_Attention/media/downloads/PAPER_EXT.html) dostupan je na stranici projekta. Izvorna baza medijskog praćenja i izvedeni podaci o pojedinim objavama nisu objavljeni zbog uvjeta pristupa izvornom sustavu i mogućeg sadržaja trećih strana. Zato se iz ovih materijala ne može u cijelosti ponoviti analiza. Rezultati u prezentaciji dolaze iz analitičkog projekta autora. U radu i slajdovima jasno navodimo govori li pojedini rezultat o uzročnoj vezi ili samo pomaže u predviđanju.

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
