# Kada inflacija istisne glas središnje banke

Javni repozitorij istraživanja **„Pasivno zamijenjena. Cijena inflacije koju ne mjeri indeks potrošačkih cijena”** Petre Palić i Luke Sikića. Projekt proučava gubi li Hrvatska narodna banka relativnu medijsku vidljivost upravo kada inflacija raste te je li učestalost prisutnosti institucionalnog glasa u vijestima povezana s inflacijskim očekivanjima kućanstava.

[![Prezentacija](https://img.shields.io/badge/prezentacija-otvori-000000?style=flat-square&labelColor=000000)](https://lusiki.github.io/Ekonomski-susreti/slides/)
[![Sažetci](https://img.shields.io/badge/sažetci-pročitaj-000000?style=flat-square&labelColor=000000)](https://lusiki.github.io/Ekonomski-susreti/abstracts/)
[![Pregled](https://img.shields.io/badge/pregled_istraživanja-PDF-000000?style=flat-square&labelColor=000000)](https://lusiki.github.io/Ekonomski-susreti/downloads/Pregled-istrazivanja.pdf)
[![GitHub Pages](https://github.com/lusiki/Ekonomski-susreti/actions/workflows/pages.yml/badge.svg)](https://lusiki.github.io/Ekonomski-susreti/)

## Materijali

| Sadržaj | Pregled | Preuzimanje |
|---|---|---|
| Sažetak izlaganja | [Kada inflacija istisne glas središnje banke](https://lusiki.github.io/Ekonomski-susreti/abstracts/#izlaganje) | [tekst](materials/abstract-presentation.md) |
| Sažetak radionice | [Otvoreno, reproducibilno i AI-podržano istraživanje](https://lusiki.github.io/Ekonomski-susreti/abstracts/#radionica) | [tekst](materials/abstract-workshop.md) |
| Sažeti prikaz istraživanja | Pet stranica s glavnim nalazima i grafikonima | [PDF](https://lusiki.github.io/Ekonomski-susreti/downloads/Pregled-istrazivanja.pdf) · [izvor](materials/brief/pregled.qmd) |
| Konferencijska prezentacija | [Otvori slajdove u pregledniku](https://lusiki.github.io/Ekonomski-susreti/slides/) | [PDF](https://lusiki.github.io/Ekonomski-susreti/downloads/Ekonomski-susreti.pdf) · [PowerPoint](https://lusiki.github.io/Ekonomski-susreti/downloads/Ekonomski-susreti.pptx) |
| Materijali radionice | [Ljestvica, cjevovod i demonstracija](https://lusiki.github.io/Ekonomski-susreti/workshop/) | [slajdovi](https://lusiki.github.io/Ekonomski-susreti/workshop/slides/) · [jedna stranica](https://lusiki.github.io/Ekonomski-susreti/workshop/handout.html) |

## Sadržaj

- [Istraživački problem](#istraživački-problem)
- [Radionica](#radionica)
- [Glavni nalazi](#glavni-nalazi)
- [Podatci i metode](#podatci-i-metode)
- [Zašto je rezultat važan](#zašto-je-rezultat-važan)
- [Sadržaj prezentacije](#sadržaj-prezentacije)
- [Reproduktivnost i podatci](#reproduktivnost-i-podatci)
- [Oblikovanje](#oblikovanje)
- [Autori i citiranje](#autori-i-citiranje)

## Istraživački problem

Komunikacija središnje banke može utjecati na očekivanja samo ako njezin signal stigne do javnosti. U digitalnom medijskom okruženju taj signal prolazi kroz uredničku selekciju, konkurentske narative i nejednaku raspodjelu pažnje.

Projekt zato postavlja dva povezana pitanja.

1. Širi li viša inflacija **institucionalni jaz u pažnji**, dakle razliku između vidljivosti koju bi HNB trebao imati u vijestima o cijenama i vidljivosti koju stvarno ima?
2. Predviđa li manja učestalost članaka o HNB-u pesimističnija inflacijska očekivanja kućanstava?

## Radionica

Uz izlaganje se drži šezdesetominutna radionica **[Otvoreno, reproducibilno i AI-podržano istraživanje](workshop/)** Luke Sikića. Izlaganje iznosi tvrdnju, a radionica pokazuje kako se ta tvrdnja može provjeriti i koliko takva provjera stoji.

Cijeli sat drži jedno pitanje, a ono glasi **tko ovo može provjeriti i uz koliki trošak?** Otvorenost, reproducibilnost i AI tri su odgovora na to pitanje. Sudionici dobivaju ljestvicu s četiri prečke, petlju rada s AI agentom i cjevovod koji se gradi jednom naredbom te uživo otkriva tri podmetnute pogreške. Prva je curenje ograničenih podataka u javni tekst, druga je koeficijent upisan rukom koji više ne odgovara tablici, a treća je pravilo pretrage koje ne prepoznaje hrvatsku dijakritiku.

Materijali se nalaze u mapi [`workshop/`](workshop/) i obuhvaćaju [slajdove](workshop/slides/slides.qmd), [scenarij izlaganja](workshop/SCRIPT.md), [rukovanje demonstracijom](workshop/RUNBOOK.md), [jednu stranicu za tisak](workshop/handout.html), [pojmovnik](workshop/GLOSSARY.md), [literaturu](workshop/READING.md) i [cjevovod](workshop/pipeline/).

## Glavni nalazi

- Viša inflacija povezana je sa širim institucionalnim jazom u pažnji. Porast inflacije za jedan postotni bod širi jaz za približno **0,0021 jedinicu**.
- Istiskivanje se odvija prvenstveno kroz **broj objava**, jer u rastućem razgovoru o cijenama pada relativni udio članaka o HNB-u. Za doseg pojedine objave nema jednako jasnog učinka.
- Manji udio članaka o HNB-u predviđa pesimističnija očekivanja potrošača na horizontima od **2 do 12 tjedana**. Taj se rezultat tumači prediktivno, a ne kao potpuno identificiran kauzalni učinak.
- Vlastita komunikacijska aktivnost HNB-a ne pada tijekom inflacijskog vala. Jaz zato nije isto što i institucionalna šutnja, nego nastaje u prijenosu informacija kroz neovisne medije.
- Oko uvođenja eura 1. siječnja 2023. mijenja se mehanizam. Sama inflacija postaje slabiji, a ton medijskog izvještavanja važniji pokretač jaza.

## Podatci i metode

Analiza obuhvaća hrvatski digitalni medijski prostor od 2021. do 2023. godine.

- više od **19 milijuna** dostupnih digitalnih objava
- **58.448** objava u primarnom HNB korpusu
- **263.601** objava u inflacijskom korpusu
- **1.239** jedinstvenih izvora
- mjesečni panel s 36 opažanja i primarni tjedni panel sa 157 opažanja

Procjena počiva na regresiji jaza na inflaciju uz kontrole. Da veza ne ide u suprotnom smjeru provjerava se instrumentalnim varijablama, u kojima ulogu vanjskog izvora inflacije imaju cijene hrane i energije u europodručju, te usporedbom razdoblja prije i poslije uvođenja eura metodom razlike u razlikama. Slijede lokalne projekcije za vezu s očekivanjima, specifikacijske krivulje, permutacijski testovi i usporedba s HANFA-om kao institucijom bez mandata za stabilnost cijena.

## Zašto je rezultat važan

Standardna rasprava o komunikaciji središnjih banaka naglašava jasnoću i kredibilitet poruke. Ovaj projekt pokazuje da je **dostupnost signala** zaseban uvjet transmisije. Učinkovita komunikacija zato ne znači samo proizvesti više priopćenja nego povećati broj neovisnih medijskih kontakata s autoritativnim institucionalnim tumačenjem inflacije.

Nakon ulaska Hrvatske u europodručje ta uloga postaje osobito važna. HNB više ne određuje samostalno ključnu kamatnu stopu, ali zadržava komparativnu prednost u objašnjavanju domaćih kretanja cijena i prijenosa odluka ECB-a.

## Sadržaj prezentacije

Konferencijsko izlaganje organizirano je kao dvadesetominutna priča u deset koraka.

1. paradoks medijske vidljivosti HNB-a
2. mediji kao filtar monetarnog signala
3. istraživačko pitanje i doprinos
4. podatkovni okvir
5. institucionalni jaz u pažnji i njegove dvije margine
6. empirijska strategija i granice tvrdnji
7. tri glavna empirijska nalaza
8. alternativno objašnjenje o komunikacijskoj aktivnosti HNB-a
9. promjena režima nakon uvođenja eura
10. robusnost, ograničenja i preporuke za komunikacijsku politiku

## Reproduktivnost i podatci

Ovaj repozitorij služi kao **javna prezentacijska i diseminacijska stranica** projekta. Objavljeni su sažetci izlaganja i radionice, sažeti prikaz istraživanja na pet stranica, konferencijska prezentacija i svi materijali radionice.

Puni tekst rada nije objavljen jer je u radnoj verziji, a dostupan je na upit autorima. Izvorna baza medijskog monitoringa i izvedeni podatci na razini pojedine objave nisu redistribuirani jer podliježu uvjetima pristupa izvornom sustavu i mogu sadržavati sadržaj trećih strana. Repozitorij stoga nije potpuni replikacijski paket. Rezultati u prezentaciji generirani su iz analitičkog projekta autora, a status kauzalnih i prediktivnih tvrdnji izričito je označen u radu i slajdovima.

## Oblikovanje

Svi materijali dijele jedan vizualni sustav. Predložak je bauhausovski, dakle crno-bijeli i prozračan, bez boje, sjena i zaobljenih rubova. Hijerarhiju nosi isključivo tipografija, pa razliku između naslova, međunaslova i teksta pravi veličina i debljina slova. Pismo je Roboto, priloženo u mapi [`fonts/`](fonts/) za gradnju PDF-a i u [`docs/fonts/`](docs/fonts/) za stranicu, uz Apache licenciju. Grafikoni su sivi i serije se razlikuju debljinom i vrstom linije, a ne bojom.

## Autori i citiranje

**Petra Palić** i **Luka Sikić**  
Hrvatsko katoličko sveučilište

Radionicu drži **Luka Sikić**.

Predloženo citiranje glasi ovako.

> Palić, P. i Sikić, L. (2026). *Pasivno zamijenjena. Cijena inflacije koju ne mjeri indeks potrošačkih cijena. Institucionalni jaz u pažnji u hrvatskom digitalnom medijskom ekosustavu*. Radni materijal.

Strojno čitljivi metapodatci dostupni su u datoteci [`CITATION.cff`](CITATION.cff).

---

Materijali su radna verzija istraživanja. Stavovi izneseni u radu isključivo su stavovi autora i ne odražavaju nužno stavove Hrvatskog katoličkog sveučilišta.
