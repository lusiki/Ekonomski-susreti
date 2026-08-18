# Umjetna inteligencija u ekonomskim istraživanjima

Šezdesetominutna radionica Luke Sikića o radu s umjetnom inteligencijom u
istraživačkom repozitoriju.

[**Slajdovi**](https://lusiki.github.io/Ekonomski-susreti/workshop/slides/) ·
[primjena u vašem projektu](PRESADI.md) · [repozitorij](projekt/) ·
[pojmovnik](GLOSSARY.md) · [literatura](READING.md)

## Ideja

Istraživači se umjetnom inteligencijom najčešće služe u pregledniku. Kopiraju
dio koda u razgovor s alatom, a njegov odgovor zatim prenesu u projekt. Alat
tada vidi samo ono što su mu poslali. Ne poznaje strukturu projekta, ne može
pokrenuti cijelu analizu ni provjeriti uklapa li se odgovor u ostatak rada.

Radionica pokazuje kako s alatom raditi izravno u repozitoriju. Alat tada može
pokrenuti analizu i druge dijelove projekta, a automatske provjere otkrivaju
pogreške u njegovu radu. Provjera tako postaje dio svakog zadatka.

> **Rezultate danas možemo dobiti brže. Temeljita provjera i dalje traži vrijeme.**

Kad sami pišemo kod, obično ga provjeravamo u hodu, svakih nekoliko redaka.
Agent može odjednom napisati dvjesto redaka, pa se provjera lako odgodi i
neprovjereni se dijelovi nakupe. Taj zaostatak nazivamo dugom provjere. Rezultat
se pojavi prije nego što smo temeljito provjerili kako je nastao. Posljedice se
obično vide tijekom recenzije, kada koautor pita odakle dolazi neki broj ili
kada se nakon dulje stanke vratimo projektu.

Četiri datoteke sadrže kontekst, dopuštenja, pravilo i provjere potrebne za rad
agenta. Provjere se pokreću zajedno s ostalim dijelovima projekta i prijavljuju
problem prije objave.

## Pet glavnih poruka

| | |
|---|---|
| **Jedan pojam** | dug provjere, odnosno neprovjereni dijelovi koda koji se nakupljaju |
| **Dvije odluke** | kontekst koji agent vidi i dopuštenja koja mu istraživač daje |
| **Četiri datoteke** | kontekst, dopuštenja, pravilo i provjere |
| **Jedna petlja** | opiši, isplaniraj, odobri, izvrši, **provjeri**, zapiši |
| **Jedno pitanje** | biste li prepoznali pogrešan rezultat? |

## Sloj za rad s umjetnom inteligencijom

Taj sloj ima samo četiri datoteke, a sve stanu na jedan ekran.

| Datoteka | Što je | Čemu služi |
|---|---|---|
| `CLAUDE.md` | kontekst koji agent čita u svakoj sesiji | daje agentu opis i pravila projekta |
| `.claude/settings.json` | dopuštenja: što agent smije učiniti, kada mora tražiti odobrenje i što mu je zabranjeno | ograničava što agent može učiniti samostalno |
| `.claude/rules/provjera.md` | pravilo koje se učitava pri izmjeni koda | zahtijeva pokretanje svih koraka projekta prije završetka zadatka |
| `tests/checks.R` | automatske provjere koje zaustavljaju izvođenje kada pronađu pogrešku | sprječava da pogrešan rezultat završi u tekstu |

Uz te četiri datoteke Git bilježi sve izmjene projekta.

## Kako podijeliti posao s agentom

Zadatke dijelimo prema tome koliko lako možemo prepoznati pogrešan rezultat.
Težina izvršenja pritom je manje važna.

| Kako se provjerava rezultat | Primjer | Što učiniti |
|---|---|---|
| **Možete ga odmah pregledati** | oblikovati sliku prema predlošku | prepustite agentu |
| **Može se provjeriti automatski** | spojiti tablice uz provjeru broja redaka | prepustite agentu i pokrenite provjeru |
| **Ne postoji jasan test** | odabrati uzorak ili specifikaciju modela | odluku donesite sami |

U radionici agent spaja dvije Eurostatove tablice. Unaprijed znamo koliko redaka
rezultat treba imati, pa ga možemo brzo provjeriti. Pri spajanju tablica po
oznakama zemalja rezultat može izgledati uredno i kada zbog pogrešne oznake
nedostaje cijela zemlja. Zato taj korak provjeravamo automatski. Izbor između
fiksnih učinaka samo za zemlje ili za zemlje i godine mijenja istraživačko
pitanje. Tu odluku donosi istraživač.

## Primjer

Pokazni projekt procjenjuje Phillipsovu krivulju za dvadeset zemalja
europodručja od 2014. do 2024. godine. Koristi dvije javne Eurostatove tablice:
jednu za harmonizirani indeks potrošačkih cijena i drugu za stopu
nezaposlenosti.

Primjer je poznat i jednostavan. Podaci su javni i preuzimaju se jednom skriptom.
Put od podataka do završne rečenice možemo objasniti u dvije minute. Zato se
možemo usredotočiti na postupak kojim nastaje nalaz.

## Sadržaj

| Datoteka | Što je |
|---|---|
| [`slides/slides.qmd`](slides/slides.qmd) | izvor prezentacije na hrvatskom u formatu Quarto |
| [`PRESADI.md`](PRESADI.md) | upute za primjenu istog načina rada u vlastitom projektu |
| [`handout.html`](handout.html) | materijal za obostrani ispis na jednom listu formata A4 |
| [`GLOSSARY.md`](GLOSSARY.md) | hrvatsko i englesko nazivlje |
| [`READING.md`](READING.md) | dvanaest naslova u tri skupine |
| [`projekt/`](projekt/) | repozitorij koji se preuzima i pokreće jednom naredbom |

## Izrada materijala

Sljedeća naredba izrađuje sve materijale.

```bash
Rscript workshop/build.R    # izrada slajdova i projekta te objava na mrežnim stranicama
```

Pojedine dijelove možete izraditi odvojeno.

```bash
quarto render slides/slides.qmd        # -> slides/slides.html
cd projekt && Rscript analysis/run.R   # -> paper/nalaz.html + results/
```

Potrebni su Quarto u verziji 1.4 ili novijoj i R u verziji 4.2 ili novijoj.
Grafički procesor nije potreban.

## Demonstracija u tri poteza

```bash
cd projekt
Rscript demo/podmetni.R    # podmetni tri greške
Rscript analysis/run.R     # prijavljuje sve tri pogreške i zaustavlja izradu nalaza
Rscript demo/vrati.R       # vrati čisto stanje
```

## Ako želite vlastitu kopiju

Mapa [`projekt/`](projekt/) zaseban je projekt. Možete je u cijelosti
kopirati u novi repozitorij i pokrenuti bez izmjena jer nijedan njezin korak
ne ovisi o ostatku ovog projekta. Kada provjerite da radi, slijedite
[`PRESADI.md`](PRESADI.md) i primijenite isti način rada u svom postojećem projektu.

## Napomena o podacima

Podaci su stvarni i javni. Dolaze iz Eurostatovih tablica `prc_hicp_aind` i
`une_rt_a`. Mapa `projekt/data/restricted/` sadrži izmišljenu datoteku koja
oponaša mikropodatke. U stvarnom projektu takvi se podaci ne bi smjeli objaviti.

## Licencija

Kod je objavljen pod licencijom MIT, a tekst pod licencijom CC BY 4.0.
