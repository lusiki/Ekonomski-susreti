# Pojmovnik — hrvatski i engleski

Nazivlje otvorene znanosti u hrvatskom još nije ustaljeno. Ovdje su izrazi kojima se služimo na
radionici, s engleskim izvornikom, da se u razgovoru zna o čemu je riječ. Gdje postoji više
uvriježenih prijevoda, naveden je i drugi oblik.

## Otvorenost

| Hrvatski | Engleski | Napomena |
|---|---|---|
| otvorena znanost | open science | krovni pojam |
| otvoreni kod | open source | kod dostupan i pod licencom koja dopušta ponovnu upotrebu |
| otvoreni podaci | open data | podaci dostupni bez ograničenja ponovne upotrebe |
| ograničeni podaci | restricted data | licencirani, povjerljivi ili osobni podaci |
| izvedeni podaci | derived data | agregati koji se smiju objaviti iako sirovi ne smiju |
| manifest izvora | data manifest | zapis o tome što je točno preuzeto i kada |
| kodna knjiga | codebook | definicije varijabli, jedinice, raspon, izvor |
| izjava o dostupnosti podataka | data availability statement | traži je većina časopisa |
| trajni identifikator | persistent identifier, DOI | npr. preko Zenoda |
| strojno čitljivi metapodaci | machine-readable metadata | `CITATION.cff`, `codemeta.json` |

## Reproducibilnost

| Hrvatski | Engleski | Napomena |
|---|---|---|
| reproducibilnost | reproducibility | isti podaci i kod → isti rezultat |
| replikabilnost | replicability | novi podaci → isti zaključak |
| replikacijski paket | replication package | kod, podaci i upute za ponovnu gradnju |
| cjevovod | pipeline | lanac koraka od podataka do rezultata |
| jedna ulazna točka | single entry point | jedna naredba gradi sve |
| provenijencija broja | numeric provenance | svaki broj u tekstu vezan uz kod koji ga proizvodi |
| zaključano okruženje | pinned / locked environment | `renv.lock`, Docker |
| sjeme slučajnog generatora | random seed | jedno mjesto u projektu |
| kontinuirana integracija | continuous integration, CI | gradnja se pokreće pri svakoj izmjeni |
| gradnja iz čistog stanja | clean-room build | ponovna gradnja iz svježeg klona |
| krivulja specifikacija | specification curve | mehanizirana robusnost |
| stupnjevi slobode istraživača | researcher degrees of freedom | prostor dopuštenih izbora |

## AI i agenti

| Hrvatski | Engleski | Napomena |
|---|---|---|
| agent | agent | model s alatima, memorijom i mogućnošću iteracije |
| agentski cjevovod | agentic pipeline | cjevovod u kojem agent obavlja dio koraka |
| ustav projekta | project constitution | `CLAUDE.md` — kontekst koji agent čita svaku sesiju |
| plan prije rada | plan-first, plan gate | agent planira, čovjek odobrava, tek onda mijenja |
| ograde | permissions, guardrails | popis dopuštenog, upitnog i zabranjenog |
| trošak provjere | verification cost | koliko ljudskog vremena treba da se output provjeri |
| strojno označena varijabla | machine-labelled variable | varijabla koju je proizveo klasifikator ili model |
| validacijski poduzorak | validation subsample | ljudski označen uzorak za mjerenje pogreške |
| izjava o korištenju AI-a | AI use disclosure | traže je časopisi i sve češće financijeri |
| halucinacija | hallucination | uvjerljiv, ali netočan izlaz |
| mjerni sloj | measurement layer | korak u kojem nastaje varijabla, prije modela |

## Napomena o upotrebi

U tekstu radova držimo se hrvatskih izraza, a engleski navodimo u zagradi pri prvom spominjanju.
U kodu, nazivima datoteka i konfiguraciji držimo se engleskog jer se tako podudaraju s
dokumentacijom alata — jedina iznimka su komentari i poruke provjera, koji su na hrvatskom.
