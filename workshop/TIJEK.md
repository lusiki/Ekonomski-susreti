# Tijek radionice na jednoj stranici

Pojednostavljena karta izlaganja. Puni govorni tekst je u [`SCRIPT.md`](SCRIPT.md),
a demonstracija u [`RUNBOOK.md`](RUNBOOK.md). Ova datoteka služi da u svakom
trenutku znate gdje ste i zašto ste tu.

## Cijela radionica u jednoj rečenici

Izvršavanje je pojeftinilo, provjera nije, pa tu razliku zapisujemo u
repozitorij da se naplaćuje sama.

## Šest sekcija, šest pitanja

Svaka sekcija odgovara na jedno pitanje i postavlja sljedeće.

| Minuta | Sekcija | Pitanje sekcije | Odgovor koji dajete |
|---|---|---|---|
| 00–04 | Otvaranje | Tko je u dvorani | Gotovo svi rade u pregledniku, a danas taj posao selimo u projekt |
| 04–14 | Dug provjere | Zašto je to važno | Rezultat sada stiže brže nego provjera, pa se neprovjereno nakuplja |
| 14–21 | Od čega se agent sastoji | O čemu uopće odlučujem | Samo o dvije stvari, kontekstu i dopuštenjima |
| 21–28 | AI sloj | Kako to izgleda u repozitoriju | Četiri datoteke, kontekst, dopuštenja, pravilo i provjere |
| 28–45 | Demonstracija | Radi li to stvarno | Prvo korist, pa tri tihe greške koje zaustave gradnju |
| 45–53 | Granice | Gdje ovo ne pomaže | Osjetljivi podaci, nabava, i odluke koje ostaju vaše |
| 53–59 | Zaključak | Od čega početi | Opisati projekt u `CLAUDE.md`, a zatim dodati jednu automatsku provjeru |

## Zašto baš tim redom

Otvaranje pokazuje gdje publika radi danas. Podignute ruke za preglednik nisu
anketa nego postavljanje problema, jer sve poslije objašnjava zašto se isplati
premjestiti se u projekt.

Prva sekcija daje razlog. Izvršavanje je pojeftinilo, provjera nije, i ta se
razlika nakuplja kao dug. Tablica s tri konkretna slučaja pokazuje kada agent
može raditi samostalno, kada ga mora pratiti automatska provjera i kada odluku
mora donijeti istraživač.

Druga sekcija skida mistiku. Agent se sastoji od modela, alata, pravila pristupa
i konteksta. Istraživač određuje koji radni materijal agent dobiva i koje radnje
smije izvršiti. Te se dvije odluke zapisuju u prve dvije datoteke projektnog AI
sloja.

Treća sekcija pokazuje kako te odluke izgledaju kao datoteke i imenuje tri
provjere. Ovdje se pojavljuje `R/zemlje.R` kao mjerni sloj, i to je namjerno
sijanje jer se isti taj korak vraća kao vrhunac demonstracije.

Četvrta sekcija je dokaz. Sve dotad su tvrdnje, a ovdje se vide na ekranu.

Peta sekcija je poštenje. Publika ionako sprema pitanje o osjetljivim podacima,
pa im odgovarate prije nego stignu pitati. Popis onoga što se ne delegira nije
stvar ukusa nego izravno slijedi iz tablice iz prve sekcije.

Šesta sekcija traži jedan mali korak umjesto preuređenja načina rada, jer je
tako izvediv.

## Demonstracija u dva poteza

Redoslijed je namjeran. Prvo korist, pa onda šteta.

**Prvi dio, minute 30 do 38.** Agent dobiva stvaran i malen zadatak, treću sliku
i jednu rečenicu u tekstu. Publika vidi plan prije rada, vaše odobrenje kao
trenutak delegiranja, i izvršavanje pod ogradama. Poanta je na kraju, kada
otvorite `paper/nalaz.qmd` i pokažete da agent nije upisao brojku nego referencu
na procjenu. Nije mogao drukčije jer bi gradnja pukla.

**Drugi dio, minute 38 do 43.** U projektu su tri tihe greške. Curenje
ograničenog sadržaja, koeficijent upisan rukom, i Grčka označena kao `GR`
umjesto `EL`. Jedna naredba ih prijavljuje sve tri i zaustavlja izradu nalaza.

Bez prvog dijela publika izlazi uvjerena u provjere, a ne u umjetnu
inteligenciju. Bez drugog dijela izlazi uvjerena da je sve lako. Trebate oboje.

**Vrhunac je treća greška.** Panel padne s 220 na 209 opažanja, nagib se pomakne
s 0,61 na 0,69, i ništa ne pukne. Kod se izvrši, slike se nacrtaju, tekst se
sastavi. To je jedini trenutak u cijeloj radionici u kojem publika osjeti
problem umjesto da ga čuje opisanog.

## Jedna nit kroz sve

Isto pitanje vraća se pet puta u pet oblika. Ako izgubite nit, vratite se na
njega.

| Minuta | Oblik u kojem se pojavljuje |
|---|---|
| 10 | Tri konkretna slučaja, od izravnog pregleda do odluke bez jasnog testa |
| 25 | `R/zemlje.R` je u `ask` jer je to korak koji ne biste primijetili |
| 43 | Grčka tiho nestane i nitko ne dobije poruku o grešci |
| 49 | Ne delegira se ono što ne biste primijetili da je krivo |
| 53 | Zadnji redak, biste li primijetili da je ovo krivo |

## Ako kasnite

Režite iz sekcije 5. Demonstracija i zaključak se ne diraju. Ako u
demonstraciji bilo što stoji dulje od šezdeset sekundi, prijeđite na snimku bez
isprike i nastavite pripovijedati.

## Šalabahter

```
preglednik → dug provjere → dvije odluke → četiri datoteke
   → korist uživo → tri tihe greške → EL umjesto GR → jedan CLAUDE.md
```
