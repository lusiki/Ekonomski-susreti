# AI u ekonomskim istraživanjima

**Kako AI ugraditi u istraživački repozitorij, a ne u prozor preglednika**

Luka Sikić · Hrvatsko katoličko sveučilište

## Sažetak

Umjetna inteligencija u istraživanju danas se najčešće koristi u prozoru
preglednika, dakle izvan projekta na kojem se radi. Kod se prenosi van,
odgovor se prenosi natrag, a alat pritom ne poznaje strukturu projekta, ne
može pokrenuti nijedan njegov korak i njegov se rad ne može provjeriti
sredstvima samog projekta. Radionica pokazuje što se mijenja kada se alat
premjesti u repozitorij i zašto je ta razlika metodološka, a ne stvar
udobnosti.

Polazna tvrdnja je da je izvršavanje pojeftinilo, a provjera nije. Dok je
istraživač kod pisao sam, provjeravao ga je usput, u razmacima od nekoliko
redaka, i ta provjera nije imala zasebnu cijenu. Agent vraća dvjesto redaka
odjednom, pa se provjera odgađa i nakuplja. Razliku između koda koji daje
rezultat i koda za koji znamo zašto ga daje radionica naziva dugom provjere.
Taj se dug ne otpisuje sam od sebe nego dospijeva kasnije, u recenziji, u
pitanju koautora o podrijetlu pojedinog broja i pri povratku na vlastiti
projekt nakon dulje stanke.

Iz toga slijedi mjerilo za podjelu rada između istraživača i agenta.
Mjerodavno pitanje nije koliko je zadatak zahtjevan nego bi li istraživač
prepoznao pogrešan ishod. Zadaci čija se ispravnost utvrđuje izravnim uvidom
delegiraju se bez zadrške. Zadaci čiji ishod izgleda jednako uredno i kada je
točan i kada nije dobivaju provjeru zapisanu u kodu. Odluke koje mijenjaju
istraživačko pitanje, a ne odgovor na njega, ne delegiraju se.

Središnji dio radionice pokazuje kako se to mjerilo provodi. Nakon kratkog
prikaza sastavnica agentskog rada, dakle modela, alata, ograde i konteksta,
slijedi zaključak da istraživač odlučuje o samo dvije stvari. Prva je
kontekst, koji se zapisuje u datoteku umjesto da se ponavlja u razgovoru.
Druga su dopuštenja, koja istraživač popisuje sam, dakle što agent smije
učiniti, što mora zatražiti i što mu je zabranjeno. Te dvije odluke, zajedno
s pravilom koje se učitava uz svaku izmjenu koda i sa skupom provjera koje
ruše gradnju kada padnu, čine AI sloj od četiri datoteke.

Pokazni primjer je Phillipsova krivulja u dvadeset zemalja europodručja od
2014. do 2024. godine, procijenjena na dvije javne Eurostatove tablice.
Primjer je namjerno poznat i jednostavan jer predmet radionice nije nalaz
nego postupak kojim je nalaz nastao. Demonstracija ima dva dijela. U prvom
agent dobiva stvaran zadatak i izvršava ga ispravno, od plana preko izvršenja
do osvježenog teksta u kojem nijedan broj nije upisan rukom. U drugom se u
projekt unose tri greške koje projekt otkriva sam. Prva je ulazak ograničenih
podataka u javni tekst. Druga je koeficijent upisan rukom koji više ne
odgovara procjeni iz koje je nastao. Treća je oznaka zemlje, jer Eurostat
Grčku bilježi kao EL, a većina drugih izvora piše GR, pa filtar bez
upozorenja izgubi cijelu zemlju i pomakne procjenu. Nijedna od tri greške ne
prekida izvršavanje programa i sve tri bi prošle recenziju.

## Sadržaj

1. Dug provjere, njegov nastanak i razlog zbog kojeg raste brže nego prije.
2. Podjela zadataka prema trošku provjere ishoda, a ne prema težini izvršenja.
3. Sastavnice agentskog rada, dakle model, alati, ograda i kontekst.
4. Dvije odluke koje iz toga slijede i četiri datoteke u kojima su zapisane.
5. Izbor načina rada prema razini nadzora koju zadatak traži.
6. Demonstracija uživo, najprije ispravan rad agenta pa onda tri tihe greške.
7. Povjerljivi podaci, uvjeti korištenja usluga i modeli koji rade lokalno.
8. Podjela rada između istraživača i agenta te odluke koje se ne delegiraju.

## Što sudionici odnose

Sudionici odnose repozitorij koji se klonira i pokreće jednom naredbom na
svakom prijenosnom računalu, upute za prenošenje istog sloja na vlastiti
projekt u tri koraka, mjerilo za odluku o tome što se delegira, i sažetak
radionice na jednoj stranici.

## Ključne riječi

umjetna inteligencija u istraživanju, agentski rad, dug provjere,
reproducibilnost, ograničeni podaci, mjerni sloj, podrijetlo rezultata

## Održavanje

Radionica traje 60 minuta uz pitanja. Prati se bez pripreme i bez
instalacije, a potreban je samo projektor. Izlaganje je na hrvatskom jeziku,
dok su kod i tehnički nazivi na engleskom uz priloženi pojmovnik. Namijenjena
je istraživačima, doktorandima i analitičarima u institucijama, bez
pretpostavke o programerskom iskustvu. Radionica stoji samostalno i ne
pretpostavlja da je publika slušala ijedno drugo izlaganje.
