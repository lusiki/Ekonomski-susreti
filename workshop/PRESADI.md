# Prijenos AI sloja na vlastiti projekt

Mapa [`projekt/`](projekt/) je pokazni primjer i vrijedi ga jednom pokrenuti
da vidite kako se ponaša. Ali svrha radionice nije da procjenjujete
Phillipsovu krivulju nego da isti sloj postavite na projekt koji već imate.

Ovo su upute za to. Posao traje jedno popodne, a ne tjedan.

## Što se prenosi

Četiri datoteke i jedna mapa. Ništa od toga ne ovisi o R-u, o Quartu ni o
ovom primjeru.

```
CLAUDE.md                    kontekst
.claude/settings.json        dopuštenja
.claude/rules/provjera.md    pravilo uz izmjene koda
tests/checks.R               provjere
```

Ako radite u Stati, Pythonu ili Excelu, mijenja se samo zadnja datoteka i
naredba kojom se pokreće. Prve tri su običan tekst.

## Korak prvi, napišite kontekst

Otvorite `CLAUDE.md` iz primjera i prepišite ga za svoj projekt. Neka ostane
kratak, jer dugu datoteku nitko ne čita, pa ni agent.

Treba sadržavati četiri stvari.

Prvo, jednu rečenicu o tome što projekt radi i čemu služi. Drugo, popis mapa
uz jednu rečenicu o svakoj, dakle gdje su podaci, gdje kod, gdje rezultati i
što je generirano pa se ne uređuje rukom. Treće, naredbe kojima se projekt
gradi i provjerava. Četvrto, tvrda pravila, dakle stvari koje se nikad ne
rade i koje biste rekli novom asistentu prvi dan.

Test je jednostavan. Ako biste to rekli čovjeku koji prvi put sjeda za vaš
projekt, ide u `CLAUDE.md`. Ako ne biste, ne ide.

## Korak drugi, popišite dopuštenja

`.claude/settings.json` ima tri popisa i svaki odgovara na drugo pitanje.

U `allow` idu naredbe koje se smiju izvršiti bez pitanja jer im vidite ishod
i lako ga vratite. Pokretanje analize, gradnja dokumenta, čitanje koda, `git diff`.

U `ask` ide ono što smije, ali vas mora pitati. Zapisivanje promjena u
povijest, pisanje po podacima i, ovo je važno, **datoteka u kojoj nastaje
vaša glavna varijabla**. U primjeru je to `R/zemlje.R`. U vašem projektu je
to skripta koja odlučuje tko ulazi u uzorak i kako se mjeri ono što
proučavate.

U `deny` ide ono što se nikad ne radi. Čitanje povjerljivih podataka,
objavljivanje na udaljeni repozitorij, brisanje bez povratka.

Pravilo za popunjavanje glasi ovako. Ako ne biste primijetili da je nešto
otišlo krivo, to ne ide u `allow`.

## Korak treći, napišite jednu provjeru

Ovo je korak koji se najčešće preskače i bez kojeg ostala tri ne vrijede.

Ne pišite skup testova. Napišite **jednu** provjeru, i to onu koja hvata
grešku koja vam se već jednom dogodila. Svatko ima takvu grešku. Uzorak koji
se tiho promijenio, tablica koja se razišla s tekstom, datoteka koja je
završila gdje nije smjela.

Provjera mora imati tri svojstva. Mora se izvršavati automatski pri gradnji,
a ne kad se sjetite. Mora **rušiti** gradnju kad padne, a ne ispisivati
upozorenje koje nitko ne čita. I mora reći što je krivo brojkom, ne
rečenicom.

U primjeru su tri provjere i vrijedi ih pogledati kao obrasce.

| Provjera | Obrazac koji vrijedi posuditi |
|---|---|
| **ograda** | pretraži svaki izlaz projekta i traži oznaku koja tamo ne smije biti |
| **pokrivenost** | usporedi veličinu uzorka s brojem koji si unaprijed zapisao |
| **provenijencija** | traži broj upisan rukom u odjeljku u kojem svi brojevi moraju doći iz koda |

Provjera pokrivenosti je najkorisnija i najlakša. Zapišite koliko opažanja,
jedinica i razdoblja vaš uzorak ima kad je ispravan, pa neka gradnja pukne
kad to više nije točno.

## Korak četvrti, vežite brojeve uz kod

Ovo nije dio AI sloja nego uvjet da on uopće ima smisla. Ako su brojevi u
tekstu upisani rukom, nijedna provjera ne može znati jesu li točni.

Postupak je uvijek isti. Analiza zapiše sve brojke u jednu datoteku, u
primjeru je to `results/procjene.json`. Tekst tu datoteku čita i nigdje ne
sadrži broj. Provjera odbija tekst u kojem se pojavi decimalni broj koji
nije došao iz te datoteke.

U Stati isti posao rade `estout` ili `putexcel`, koji procjene zapišu u jednu
datoteku iz koje ih tekst poslije čita. U Pythonu je to isti JSON. U Wordu ovo ne radi i to je jedini stvarni
razlog da se odustane od Worda.

## Redoslijed koji preporučam

Ne radite sve odjednom. Prvi tjedan napišite samo `CLAUDE.md`, dvadesetak
redaka, i radite s time. Drugi tjedan popišite dopuštenja, jer ćete do tada znati
što vas je zasmetalo. Treći tjedan dodajte jednu provjeru.

Ako ste nakon tri tjedna na tri datoteke, dobili ste gotovo sve. Četvrta
dolazi sama kad prva provjera jednom uhvati nešto stvarno.

## Kako znati da je uspjelo

Postoji jedan test i nije tehnički. Obrišite radnu kopiju, klonirajte
repozitorij iznova, pokrenite jednu naredbu i pogledajte dobijete li iste
brojke.

Ako da, više ne morate pamtiti kako ste do njih došli. To je cijela poanta i
vrijedi jednako za agenta i za vas nakon godinu dana.
