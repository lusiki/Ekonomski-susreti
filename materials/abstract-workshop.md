# Umjetna inteligencija u ekonomskim istraživanjima

**Kako umjetnu inteligenciju uključiti u istraživački repozitorij**

Luka Sikić · Hrvatsko katoličko sveučilište

## Sažetak

Istraživači se umjetnom inteligencijom najčešće služe u pregledniku. Kopiraju
dio koda u razgovor s alatom, a njegov odgovor zatim prenesu u projekt. Alat
tada vidi samo ono što su mu poslali. Ne poznaje ostatak projekta, ne može
pokrenuti analizu ni upotrijebiti provjere zapisane u projektu. Radionica
pokazuje kako s alatom raditi izravno u repozitoriju. Alat tada može pokrenuti
analizu i druge dijelove projekta, a automatske provjere otkrivaju pogreške u
njegovu radu.

Umjetna inteligencija može vrlo brzo napisati mnogo koda. Provjera tog koda i
dalje traži vrijeme. Kad sami pišemo kod, obično ga provjeravamo u hodu, svakih
nekoliko redaka. Agent može odjednom napisati dvjesto redaka, pa se provjera lako
odgodi. Tako nastaje dug provjere. Rezultat se pojavi prije nego što smo temeljito
provjerili kako je nastao. Posljedice se obično vide tijekom recenzije, u razgovoru
s koautorom ili kada se nakon dulje stanke vratimo projektu.

Posao između istraživača i agenta zato dijelimo prema tome koliko je lako
prepoznati pogrešan rezultat. Zadaci s jasnim i lako provjerljivim ishodom mogu
se prepustiti agentu i provjeriti kratkim pregledom. Kada pogrešan rezultat
izgleda uvjerljivo, provjeru treba unaprijed zapisati u kod. Istraživač određuje
istraživačko pitanje i odlučuje o njegovim promjenama.

Radionica zatim pokazuje kako takav način rada organizirati. Agentu su potrebni
model, alati, jasno određena pravila pristupa i kontekst. Istraživač određuje
što agent mora znati o projektu te što smije učiniti sam. Kontekst se čuva u
datoteci pa ga nije potrebno iznova objašnjavati u svakom razgovoru. U
dopuštenjima piše što agent smije učiniti, kada mora tražiti odobrenje i što mu
je zabranjeno. Još dvije datoteke sadrže pravilo za izmjene koda i automatske
provjere koje prekidaju postupak čim otkriju problem. Te četiri datoteke čine
sloj za rad s umjetnom inteligencijom.

U pokaznom primjeru procjenjujemo Phillipsovu krivulju za dvadeset zemalja
europodručja od 2014. do 2024. s pomoću dviju javnih Eurostatovih tablica.
Primjer je poznat i jednostavan, pa se možemo usredotočiti na postupak. U prvom
dijelu agent sastavlja plan, provodi analizu i unosi nove rezultate u tekst. Svi
se brojevi automatski preuzimaju iz rezultata analize. U drugom dijelu u projekt
unosimo tri greške koje automatske provjere pronalaze. U prvoj u javnom tekstu
završe podaci s ograničenim pristupom. U drugoj se ručno upisani koeficijent
više ne podudara s procjenom. Treća se odnosi na oznaku Grčke. Eurostat za Grčku
koristi EL, a većina drugih izvora GR. Zbog pogrešne oznake cijela zemlja
nestane iz analize bez poruke o pogrešci, pa se procjena promijeni. Bez
automatskih provjera program bi se unatoč tim greškama izvršio i dao naizgled
uredan rezultat. Sve tri pogreške mogle bi ostati neopažene i tijekom recenzije.
Provjere zaustavljaju postupak čim otkriju problem.

## Program

1. Kako nastaje dug provjere i zašto se s agentom brže gomila.
2. Kako odlučiti koje zadatke prepustiti agentu.
3. Model, alati, ograničenja pristupa i kontekst.
4. Kontekst i dopuštenja koja istraživač određuje prije rada.
5. Izbor načina rada prema razini nadzora koju zadatak traži.
6. Prikaz ispravnog rada agenta i tri greške koje otkrivaju automatske provjere.
7. Rad s povjerljivim podacima, uvjeti korištenja usluga i modeli koji se
   pokreću na vlastitom računalu.
8. Podjela odgovornosti između istraživača i agenta.

## Što sudionici dobivaju

Sudionici dobivaju repozitorij koji mogu preuzeti i pokrenuti jednom naredbom
na svom prijenosnom računalu. Dobivaju i upute koje u tri koraka pokazuju kako
isti način rada primijeniti u vlastitom projektu, pravilo za podjelu posla s
agentom te sažetak radionice na jednoj stranici.

## Ključne riječi

umjetna inteligencija u istraživanju, rad s agentom, dug provjere,
reproducibilnost, podaci s ograničenim pristupom, mjerni sloj, automatske
provjere, sljedivost rezultata

## Praktične informacije

Radionica traje 60 minuta i uključuje vrijeme za pitanja. Sudionici se ne
trebaju unaprijed pripremati ni instalirati programe. Programersko iskustvo
nije potrebno. Radionica je namijenjena istraživačima, doktorandima i
analitičarima u institucijama. Za održavanje je potreban samo projektor.
Izlaganje je na hrvatskom. Kod je pisan na engleskom, a za tehničke se pojmove
rabe engleski nazivi. Uz materijale je priložen hrvatski pojmovnik. Radionica
se može pratiti samostalno, bez prethodnog izlaganja.
