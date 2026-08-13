# data/restricted/

Ovdje bi u stvarnom projektu stajali licencirani izvorni podaci.

Pravilo: sadrzaj ove mape ne ulazi ni u prompt, ni u kod, ni u tekst,
ni u commit. Ograde u `.claude/settings.json` zabranjuju agentu citanje.
Provjera `ograda` u `tests/checks.R` trazi marker iz ove mape u svim
izlazima i rusi gradnju ako ga nade.
