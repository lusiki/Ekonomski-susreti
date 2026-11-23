"""Build the print edition from the browser presentation, without speaker notes."""
from pathlib import Path
import re

root = Path(__file__).resolve().parents[1]
slides = root / 'docs/slides'
source = (slides / 'index.html').read_text(encoding='utf-8')
sections = re.findall(r'<section\b[^>]*>.*?</section>', source, re.S)
if not sections:
    raise ValueError('No presentation slides found')
pages = []
for section in sections:
    section = re.sub(r'<aside class="notes">.*?</aside>', '', section, flags=re.S)
    section = section.replace(' slide level2', '')
    pages.append(section)
html = '''<!doctype html>
<html lang="hr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Petra Palić; Luka Sikić">
  <title>Kada inflacija istisne glas središnje banke</title>
  <link rel="stylesheet" href="presentation-layout.css">
</head>
<body>
'''+ '\n'.join(pages) + '\n</body>\n</html>\n'
html = '\n'.join(line.rstrip() for line in html.splitlines()) + '\n'
(slides / 'print.html').write_text(html, encoding='utf-8')
print(f'Built print.html with {len(pages)} slides.')
