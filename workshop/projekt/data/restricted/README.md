# Ograničeni podaci

Ova mapa stoji na mjestu na kojem bi u stvarnom projektu bili podaci koji ne
smiju izaći iz repozitorija. Kod, agregati i rezultati smiju biti javni, a
ovo ne smije.

U ovom pokaznom projektu ovdje je izmišljena datoteka koja glumi izvadak iz
mikropodataka o dohotku i uvjetima života kućanstava. Takvi se podaci u
stvarnosti dobivaju od Eurostata na temelju istraživačkog ugovora, koriste se
pod imenom i prezimenom istraživača i ne smiju se dijeliti dalje ni u kojem
obliku. Isto vrijedi za porezne registre, bolničke podatke i sve što sadrži
osobne podatke.

Datoteka u ovoj mapi nije stvarna. Svaki redak nosi oznaku
`OGRANICENO-NE-DIJELITI` upravo zato da provjera može dokazati da nije
procurila u nijedan izlaz.

## Kako je ovo zaštićeno

Zaštita nije obećanje nego tri stvari koje se mogu pokazati.

Prva je ograda u `.claude/settings.json` koja agentu zabranjuje čitanje ove
mape. Agent orkestrira analizu čije osjetljive ulaze nikada ne vidi.

Druga je pravilo u `CLAUDE.md` koje kaže da sadržaj odavde ne ulazi ni u
prompt, ni u kod, ni u tekst, ni u poruku promjene.

Treća je provjera `ograda` u `tests/checks.R` koja pretražuje svaki izlaz
projekta i ruši gradnju ako u njemu nađe oznaku iz ove mape. Prve dvije
sprječavaju, a treća dokazuje.

## Ako radite sa stvarnim ograničenim podacima

Držite ih izvan repozitorija ili u mapi koja je navedena u `.gitignore`.
Objavite umjesto njih izvedene agregate, kodnu knjigu, popis izvora i kod
koji ih proizvodi. To je gotovo uvijek dovoljno da netko drugi provjeri
vaš postupak, čak i kada ne može ponoviti vaš izračun.
