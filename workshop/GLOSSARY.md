# Pojmovnik — hrvatski i engleski

Nazivlje oko rada s AI agentima u hrvatskom još nije ustaljeno, a dio se
pojmova u praksi uopće ne prevodi. Ovdje su izrazi kojima se služimo na
radionici, s engleskim izvornikom, da se u razgovoru zna o čemu je riječ.
Gdje postoji više uvriježenih prijevoda, naveden je i drugi oblik.

## Kako alat radi

| Hrvatski | Engleski | Napomena |
|---|---|---|
| veliki jezični model | large language model, LLM | predviđa sljedeću riječ, ništa ne zna i ništa ne može učiniti |
| alat | tool | pročitaj datoteku, pokreni naredbu, pretraži web |
| agent | agent | model kojem su dani alati, pa može djelovati |
| ograda | harness | program koji odlučuje smije li se alat pozvati |
| kontekst | context | sve što model u tom trenutku vidi, ništa više |
| kontekstni prozor | context window | koliko toga u kontekst uopće stane |
| sustavska uputa | system prompt | uputa koju alat sam dodaje prije vaše poruke |
| lanac razmišljanja | chain of thought, reasoning | tekst koji model piše sebi prije odgovora |
| model s otvorenim težinama | open weight model | model koji možete pokrenuti na svom računalu |
| plaćanje po upotrebi | per token, API pricing | drukčiji uvjeti o podacima nego pretplata |

## AI sloj u projektu

| Hrvatski | Engleski | Napomena |
|---|---|---|
| ustav projekta | project constitution | `CLAUDE.md`, kontekst koji agent čita svaku sesiju |
| ograde, dopuštenja | permissions, guardrails | `settings.json`, popis dopuštenog, upitnog i zabranjenog |
| pravilo | rule | uputa koja se učitava uz određenu vrstu izmjene |
| plan prije rada | plan first, plan gate | agent planira, čovjek odobrava, tek onda mijenja |
| trenutak delegiranja | approval, handoff | odobrenje plana, jedina točka u kojoj predajete kontrolu |
| dug provjere | verification debt | razlika između koda koji radi i koda za koji znate zašto radi |
| trošak provjere | verification cost | koliko ljudskog vremena treba da se izlaz provjeri |
| pokrivenost | coverage | je li uzorak još onaj koji mislite da jest |
| provenijencija broja | numeric provenance | svaki broj u tekstu vezan uz kod koji ga proizvodi |
| halucinacija | hallucination | uvjerljiv, ali netočan izlaz |
| izjava o korištenju AI-a | AI use disclosure | traže je časopisi i sve češće financijeri |

## Oko projekta

| Hrvatski | Engleski | Napomena |
|---|---|---|
| cjevovod | pipeline | lanac koraka od podataka do rezultata |
| jedna ulazna točka | single entry point | jedna naredba gradi sve |
| mjerni sloj | measurement layer | korak u kojem nastaje varijabla, prije modela |
| izvedeni podaci | derived data | agregati koji se smiju objaviti iako sirovi ne smiju |
| ograničeni podaci | restricted data | licencirani, povjerljivi ili osobni podaci |
| manifest izvora | data manifest | zapis o tome što je točno preuzeto i kada |
| kodna knjiga | codebook | definicije varijabli, jedinice, raspon, izvor |
| zaključano okruženje | pinned environment | `renv.lock`, Docker |
| gradnja iz čistog stanja | clean room build | ponovna gradnja iz svježeg klona |
| reproducibilnost | reproducibility | isti podaci i kod daju isti rezultat |

## Napomena o upotrebi

U tekstu radova držimo se hrvatskih izraza, a engleski navodimo u zagradi pri
prvom spominjanju. U kodu, nazivima datoteka i konfiguraciji držimo se
engleskog jer se tako podudaraju s dokumentacijom alata. Jedina su iznimka
komentari i poruke provjera, koji su na hrvatskom.

Dvije riječi vrijedi izgovarati pažljivo. **Ograda** je u ovoj radionici
program koji stoji između modela i vašeg računala, dakle ono što se u
engleskom zove harness. Kada govorimo o popisu dopuštenog i zabranjenog,
kažemo **dopuštenja**. U svakodnevnom razgovoru te se dvije stvari često
brkaju jer obje ograničavaju agenta, ali prva je alat, a druga vaša odluka.
