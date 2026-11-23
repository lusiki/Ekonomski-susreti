# Konferencijska prezentacija

`index.html` je izvor prezentacije za preglednik. Sadrži svih 17 slajdova i
izvorne bilješke za izlagače. Identifikatori slajdova ostaju stabilni za poveznice.

`presentation-layout.css` određuje zajednički izgled slajdova i PDF-a.
`presentation-ekonomski-susreti.css` prilagođava taj raspored Reveal.js pregledniku.
Statična pisma Roboto učitavaju se lokalno preko `presentation-fonts.css`.

## Obnova PDF-a

Iz korijena repozitorija, uz Python 3 i Node.js s paketom Playwright:

```sh
python scripts/build-presentation-print.py
node scripts/export-presentation.cjs
```

Playwright koristi svoj Chromium. Za postojeću instalaciju Chromea može se
postaviti varijabla `CHROME_PATH` na putanju izvršne datoteke.

Prva naredba izrađuje `print.html` iz istog izvora, bez bilježaka za izlagače.
Druga čeka učitavanje pisama i slika, provjerava dodire sadržaja s podnožjem te
sprema `docs/downloads/Ekonomski-susreti.pdf`. Nakon izvoza treba vizualno
provjeriti sve stranice. `?print-pdf` otvara ovu zajedničku verziju za ispis.

Strelice mijenjaju slajd, `o` otvara pregled svih slajdova, `s` bilješke za
izlagača, a izbornik u donjem lijevom kutu pruža ostale alate. Grafikon očekivanja
zadržava izvorne procjene; njegov stari opis crvenih točaka zamijenjen je opisom
značajnosti koji odgovara tekstu slajda i crno-bijelom prikazu.

PowerPoint preuzimanje zaseban je raniji izvoz i ne služi za obnovu ovog PDF-a.
