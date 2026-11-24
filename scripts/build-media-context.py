"""Copy selected public aggregates on HNB's wider media presence into the deck.

Source: a checkout of lusiki/HNB_Media_Attention, folder media-hub/public/data.
Only published aggregate tables are read. No article text is involved. Every
input file is recorded with its SHA-256 so the slide numbers can be traced.

    python scripts/build-media-context.py --source ../HNB_Media_Attention
"""
from pathlib import Path
import argparse
import csv
import hashlib
import json

ROOT = Path(__file__).resolve().parents[1]
REVISION = 'b2187d34159b5d40caeecb2694640331e4aeae71'
THEMES = [
    ('lending', 'Kreditiranje i potrošači'), ('currency', 'Euro i valute'),
    ('payments', 'Plaćanja i gotovina'), ('prices', 'Cijene i inflacija'),
    ('rates', 'Monetarna politika i kamate'), ('governance', 'Upravljanje i odgovornost'),
    ('forecasts', 'Prognoze i statistika'), ('stability', 'Stabilnost i nadzor banaka'),
]

parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
parser.add_argument('--source', type=Path, default=ROOT.parent / 'HNB_Media_Attention')
args = parser.parse_args()
DATA = args.source / 'media-hub/public/data'
used = {}


def table(name):
    path = DATA / name
    used[name] = hashlib.sha256(path.read_bytes()).hexdigest()
    with path.open(encoding='utf-8', newline='') as handle:
        return list(csv.DictReader(handle))


summary_path = DATA / 'media/summary.json'
used['media/summary.json'] = hashlib.sha256(summary_path.read_bytes()).hexdigest()
summary = json.loads(summary_path.read_text(encoding='utf-8'))

# Monthly publications with an explicit HNB mention, complete months only.
monthly = [r for r in table('media/media-monthly.csv') if r['period'] <= summary['last_full_period']]
posts = {r['period']: int(r['hnb_count']) for r in monthly}
assert len(posts) == 68 and sum(posts.values()) == summary['hnb_publications'] == 33235

# Overlapping lexical theme screens, by month.
theme_counts = {}
for r in table('media/media-subjects.csv'):
    if r['period'] in posts:
        assert int(r['denominator']) == posts[r['period']]
        theme_counts.setdefault(r['period'], {})[r['subject_id']] = int(r['lexical_count'])
totals = {tid: sum(theme_counts[m][tid] for m in posts) for tid, _ in THEMES}
assert totals == summary['subject_counts']
years = sorted({m[:4] for m in posts})
by_year = {tid: {y: round(100 * sum(theme_counts[m][tid] for m in posts if m[:4] == y) /
                          sum(posts[m] for m in posts if m[:4] == y), 1) for y in years} for tid, _ in THEMES}
assert by_year['prices']['2021'] == 23.7 and by_year['currency']['2022'] == 49.8

pooled = next(r for r in table('media/media-source-concentration.csv') if r['period_id'] == 'pooled' and r['scope'] == 'all')
assert int(pooled['hnb_domains']) == summary['outlets'] == 281

# Government price-measure discourse and HNB's own captured items, frozen study panel.
legacy = table('legacy-context.csv')
government = [{'month': r['period'],
               'government_share': float(r['gov_comm_share']) if r['gov_comm_share'] else None,
               'hnb_own_items': int(float(r['hnb_comm'])) if r['hnb_comm'] else None} for r in legacy]
observed = [g for g in government if g['government_share'] is not None]
assert len(government) == 65 and len(observed) == 62


def annual(key, digits):
    out = {}
    for y in sorted({g['month'][:4] for g in observed}):
        values = [g[key] for g in observed if g['month'][:4] == y and g[key] is not None]
        out[y] = {'months': len(values), 'mean': round(sum(values) / len(values), digits)}
    return out


# Share of texts with the word inflacija next to an HNB mention, complete quarters only.
word = {}
for r in table('media/media-lexical-quarterly.csv'):
    if r['kind'] == 'term' and r['term'] == 'inflacija' and r['coverage_state'] == 'complete' and r['status'] == 'reported':
        entry = word.setdefault(r['quarter'][:4], {'texts': 0, 'with_word': 0, 'quarters': 0})
        entry['texts'] += int(r['denominator']); entry['with_word'] += int(r['count']); entry['quarters'] += 1
for entry in word.values():
    entry['share_pct'] = round(100 * entry['with_word'] / entry['texts'], 1)

platforms = {}
for r in table('media/platform-audit.csv'):
    entry = platforms.setdefault(r['platform'], {'captures': 0, 'explicit_hnb': 0})
    entry['captures'] += int(r['archive_captures']); entry['explicit_hnb'] += int(r['explicit_captures'])
for entry in platforms.values():
    entry['per_10000'] = round(1e4 * entry['explicit_hnb'] / entry['captures'], 1)

out = {
    'source_repository': 'lusiki/HNB_Media_Attention',
    'source_revision': REVISION,
    'source_folder': 'media-hub/public/data',
    'source_sha256': dict(sorted(used.items())),
    'data_version': '2026-09-21.1',
    'review_status': 'Public research draft, author review pending. Theme screens are overlapping exploratory lexical '
                     'screens without independent validation. Capture is not readership.',
    'corpus': {
        'definition': 'Captured web publications with an explicit HNB mention. Narrower than the institutional corpus '
                      'of the inflation study, which also includes generic central-bank terms.',
        'period': '2021-01/2026-08', 'months': 68,
        'hnb_publications': summary['hnb_publications'],
        'outlets_with_hnb': int(pooled['hnb_domains']), 'outlets_observed': int(pooled['background_domains']),
        'title_mentions': summary['title_mentions'],
    },
    'themes': [{'id': tid, 'label': label, 'publications': totals[tid],
                'share_pct': round(100 * totals[tid] / summary['hnb_publications'], 1), 'share_pct_by_year': by_year[tid]}
               for tid, label in THEMES],
    'monthly': [{'month': m, 'hnb_publications': posts[m],
                 'theme_share_pct': {tid: round(100 * theme_counts[m][tid] / posts[m], 1) for tid, _ in THEMES}}
                for m in sorted(posts)],
    'government': {
        'edition': 'Frozen inflation-study panel, extended manuscript of 17 September 2026. Earlier than the '
                   '28 September edition used for the weighted share on the slides.',
        'definition': 'government_share is the share of monitored inflation records that carry discourse on government '
                      'price measures. hnb_own_items are vendor-captured candidates from HNB channels, not a complete '
                      'inventory of official documents.',
        'gap': 'No media observations for January to March 2024. Series ends in May 2026.',
        'monthly': government,
        'annual_government_share': annual('government_share', 4),
        'annual_hnb_own_items': annual('hnb_own_items', 1),
    },
    'word_inflacija_next_to_hnb': dict(sorted(word.items())),
    'platform_audit': {
        'status': 'Development audit of archive captures. Independent validation pending. Batches differ in coverage.',
        'platforms': dict(sorted(platforms.items(), key=lambda kv: -kv[1]['per_10000'])),
    },
}
target = ROOT / 'docs/slides/data/media-context-20260921.json'
target.write_text(json.dumps(out, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
print(f'Wrote {target.name}: {len(out["monthly"])} months, {len(out["themes"])} themes, {len(observed)} government observations.')
