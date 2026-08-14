# AI u ekonomskim istraživanjima

**Kako AI ugraditi u istraživački repozitorij, a ne u prozor preglednika**

Luka Sikić · Hrvatsko katoličko sveučilište

## Sažetak

Većina istraživača danas koristi umjetnu inteligenciju u prozoru preglednika,
dakle izvan vlastitog projekta. Kod se kopira van, odgovor se kopira natrag.
Alat pritom ne zna ništa o projektu, ne može ništa pokrenuti i ne može biti
provjeren. Radionica pokazuje što se dogodi kada ga preselite unutra, u sam
repozitorij, i zašto to nije stvar udobnosti.

Polazište je opažanje da je izvršavanje pojeftinilo, a provjera nije. Dok je
istraživač kod pisao sam, provjeravao je usput, po nekoliko redaka. Agent
vrati dvjesto redaka odjednom, pa se provjera odgađa i nakuplja. Ta razlika
između koda koji radi i koda za koji znamo zašto radi ovdje se zove dug
provjere. Kao svaki dug, ima kamate, a plaćaju se na recenziji, kod koautora
i kod samog istraživača nakon dužeg vremena.

Iz toga slijedi jednostavno mjerilo za podjelu rada. Pitanje nije koliko je
zadatak težak nego bismo li primijetili da je odgovor kriv. Zadaci koji se
lako provjere delegiraju se bez razmišljanja. Zadaci koje ne bismo mogli
provjeriti pogledom dobivaju provjeru zapisanu u kodu. Odluke koje mijenjaju
pitanje, a ne odgovor, ne delegiraju se uopće.

Središnji dio radionice pokazuje kako to izgleda u praksi. Nakon kratkog
objašnjenja onoga što se zapravo događa ispod haube, dakle razlike između
modela, alata, ograde i konteksta, slijedi zaključak da postoje samo dvije
ručke kojima istraživač raspolaže. Prva je da kontekst zapiše u datoteku
umjesto da ga ponavlja u razgovoru. Druga je da sam popiše što agent smije,
što ga mora pitati i što je zabranjeno. Te dvije ručke, zajedno s pravilom
uz izmjene koda i skupom provjera koje ruše gradnju, čine AI sloj od četiri
datoteke.

Pokazni primjer je Phillipsova krivulja u dvadeset zemalja europodručja od
2014. do 2024. godine, na dvije javne Eurostatove tablice. Primjer je namjerno
običan i svakome poznat, jer radionica nije o nalazu nego o tome kako je nalaz
nastao. Demonstracija ima dva dijela. U prvom agent dobiva stvaran zadatak i
radi ga dobro, od plana preko izvršenja do osvježenog teksta u kojem nijedan
broj nije upisan rukom. U drugom se pokazuju tri tihe greške koje projekt sam
otkriva. Prva je curenje ograničenih podataka u javni tekst. Druga je
koeficijent upisan rukom koji više ne odgovara procjeni. Treća je oznaka
zemlje, jer Eurostat Grčku bilježi kao EL, a ostatak svijeta piše GR, pa
filtar tiho izgubi cijelu zemlju i pomakne rezultat. Nijedna od tri greške ne
ruši program i sve tri bi prošle recenziju.

## Sadržaj

1. Dug provjere i razlog zbog kojeg raste brže nego prije.
2. Podjela zadataka prema tome koliko je skupo provjeriti ishod.
3. Model, alati, ograda i kontekst, dakle što se zapravo događa ispod haube.
4. Dvije ručke koje iz toga slijede i četiri datoteke koje ih zapisuju.
5. Izbor načina rada prema potrebnoj razini nadzora.
6. Demonstracija uživo, prvo korist pa onda tri tihe greške.
7. Povjerljivi podaci, uvjeti korištenja i lokalni modeli.
8. Podjela rada i odluke koje se ne delegiraju.

## Što sudionici odnose

Sudionici odnose repozitorij koji se klonira i pokreće jednom naredbom na
svakom prijenosnom računalu, upute za presađivanje istog sloja na vlastiti
projekt u tri koraka, kratko mjerilo za odluku o tome što se delegira, te
sažetak na jednoj stranici.

## Ključne riječi

umjetna inteligencija u istraživanju, agentski rad, dug provjere,
reproducibilnost, ograničeni podaci, mjerni sloj, podrijetlo rezultata

## Održavanje

Radionica traje 60 minuta uz pitanja. Prati se bez pripreme i bez instalacije,
a potreban je samo projektor. Izlaganje je na hrvatskom jeziku, dok su kod i
tehnički nazivi na engleskom uz priloženi pojmovnik. Namijenjena je
istraživačima, doktorandima i analitičarima u institucijama, bez pretpostavke
o programerskom iskustvu. Radionica stoji samostalno i ne pretpostavlja da je
publika slušala ijedno drugo izlaganje.
