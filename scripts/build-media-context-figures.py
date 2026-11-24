"""Draw the three media-context figures from the copied public aggregates.

Reads docs/slides/data/media-context-20260921.json and, for the lower panel of
the government figure, the same weighted share as the monthly slides. Shows
saved values only. No models, smoothing or interpolation.
"""
from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib import font_manager
from matplotlib.ticker import FuncFormatter

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'docs/slides/figures-media-20260921'
OUT.mkdir(exist_ok=True)
media = json.loads((ROOT / 'docs/slides/data/media-context-20260921.json').read_text(encoding='utf-8'))
study = json.loads((ROOT / 'docs/slides/data/monthly-20260928.json').read_text(encoding='utf-8'))['monthly']
months = [r['month'] for r in media['monthly']]
assert len(months) == 68 and months == [r['month'] for r in study]
for f in (ROOT / 'docs/fonts').glob('Roboto-*.ttf'):
    font_manager.fontManager.addfont(str(f))
plt.rcParams.update({'font.family': 'Roboto', 'font.size': 14, 'axes.spines.top': False, 'axes.spines.right': False,
                     'axes.spines.left': False, 'axes.edgecolor': '#bdbdbd', 'svg.fonttype': 'path',
                     'figure.facecolor': 'white', 'savefig.facecolor': 'white'})

# Labels above the three clusters of busiest months. Positions are shared with live-charts.js.
# Each entry is month, horizontal shift in months and text. A shift of -0.5 centres the label on two adjacent bars.
NOTES = [('2022-02', -.5, 'siječanj i veljača 2022.\nupravljanje, plaćanja i gotovina'),
         ('2023-01', -.5, 'prosinac 2022. i siječanj 2023.\neuro i valute'),
         ('2026-01', 0, 'siječanj 2026.\nupravljanje')]


def num(v, d=0):
    return f'{v:,.{d}f}'.replace(',', '_').replace('.', ',').replace('_', '.')


def save(fig, name):
    for ext in ['svg', 'png']:
        fig.savefig(OUT / f'{name}.{ext}', dpi=180)
    plt.close(fig)


def bars(ax, values, ylim, ticks, unit):
    """Same monthly frame as build-monthly-figures.py. Missing months stay empty on a light band."""
    for i, v in enumerate(values):
        if v is None:
            ax.axvspan(i - .5, i + .5, color='#f0f0f0', linewidth=0, zorder=0)
    ax.bar([i for i, v in enumerate(values) if v is not None], [v for v in values if v is not None],
           width=.78, color='#333333', linewidth=0, zorder=3)
    ax.set_xlim(-1, 68); ax.set_ylim(*ylim); ax.set_yticks(ticks)
    ax.yaxis.set_major_formatter(FuncFormatter(lambda v, p: num(v, 0)))
    ax.set_xticks([5.5, 17.5, 29.5, 41.5, 53.5, 63.5], ['2021.', '2022.', '2023.', '2024.', '2025.', '2026.*'])
    ax.tick_params(axis='both', length=0, pad=10)
    ax.set_axisbelow(True); ax.yaxis.grid(True, color='#e3e3e3', linewidth=.7)
    for b in [11.5, 23.5, 35.5, 47.5, 59.5]:
        ax.axvline(b, color='#d4d4d4', linewidth=.6, zorder=0)
    ax.text(0, 1.035, unit, transform=ax.transAxes, fontsize=13, color='#555555')


# 1. Themes next to HNB. Prices are the reference row, so that bar is black.
themes = media['themes']
fig, ax = plt.subplots(figsize=(11.36, 3.65)); fig.subplots_adjust(left=.265, right=.93, top=.91, bottom=.12)
y = list(range(len(themes)))
ax.barh(y, [t['share_pct'] for t in themes], height=.62, linewidth=0, zorder=3,
        color=['#000000' if t['id'] == 'prices' else '#8a8a8a' for t in themes])
ax.set_ylim(len(themes) - .45, -.55); ax.set_xlim(0, 50)
ax.set_yticks(y, [t['label'] for t in themes]); ax.set_xticks([0, 10, 20, 30, 40, 50])
ax.tick_params(axis='both', length=0, pad=10); ax.tick_params(axis='x', colors='#555555')
ax.set_axisbelow(True); ax.xaxis.grid(True, color='#e3e3e3', linewidth=.7)
ax.spines['bottom'].set_visible(False)
for i, t in enumerate(themes):
    ax.text(t['share_pct'] + .8, i, num(t['share_pct'], 1) + ' %', va='center', ha='left', fontsize=14, color='black')
ax.text(0, 1.035, '% objava koje izričito spominju HNB', transform=ax.transAxes, fontsize=13, color='#555555')
save(fig, 'themes')

# 2. Publications with an explicit HNB mention, by month.
posts = [r['hnb_publications'] for r in media['monthly']]
fig, ax = plt.subplots(figsize=(11.36, 3.65)); fig.subplots_adjust(left=.065, right=.99, top=.91, bottom=.15)
bars(ax, posts, (0, 1900), [0, 500, 1000, 1500], 'Broj objava koje izričito spominju HNB')
for month, shift, label in NOTES:
    i = months.index(month)
    ax.annotate(label, (i + shift, posts[i]), xytext=(0, 5), textcoords='offset points', ha='center', va='bottom',
                fontsize=11.5, color='#000000', linespacing=1.25)
save(fig, 'monthly-mentions')

# 3. Government price-measure discourse above the weighted institutional share.
gov = {g['month']: g['government_share'] for g in media['government']['monthly']}
gov_values = [None if gov.get(m) is None else 100 * gov[m] for m in months]
fig, axs = plt.subplots(2, 1, figsize=(11.36, 3.8)); fig.subplots_adjust(left=.07, right=.99, top=.9, bottom=.14, hspace=.7)
bars(axs[0], gov_values, (0, 16.5), [0, 5, 10, 15], 'Rasprava o vladinim mjerama, udio u objavama o inflaciji (%)')
bars(axs[1], [100 * r['weighted_share'] for r in study], (0, 18), [0, 5, 10, 15], 'Ponderirani institucionalni udio (%)')
save(fig, 'government-share')
print('Built three media-context figures from saved aggregates, no interpolation or models.')
