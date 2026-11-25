"""Draw the two figures that carry the room image, from the saved monthly aggregates.

conversation-volume  monthly counts of all inflation posts and of relevant
                     institutional posts, each as an index, 2021 average = 100.
rooms, rooms-pair    one square per year. The area is the average monthly
                     potential reach of the inflation discourse, the denominator
                     of the weighted share. The black block is the weighted
                     institutional reach, the numerator. Black over total area
                     therefore equals the published annual weighted share.

No estimation, interpolation or smoothing. Every value is read from
docs/slides/data/monthly-20260928.json and checked against Table 1.
"""
from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib import font_manager
from matplotlib.patches import Rectangle

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'docs/slides/figures-20260928'
data = json.loads((ROOT / 'docs/slides/data/monthly-20260928.json').read_text(encoding='utf-8'))
annual = json.loads((ROOT / 'docs/slides/data/descriptive-20260928.json').read_text(encoding='utf-8'))['annual']
rows = data['monthly']
assert len(rows) == 68
for f in (ROOT / 'docs/fonts').glob('Roboto-*.ttf'):
    font_manager.fontManager.addfont(str(f))
plt.rcParams.update({'font.family': 'Roboto', 'font.size': 14, 'axes.spines.top': False, 'axes.spines.right': False,
                     'axes.spines.left': False, 'axes.edgecolor': '#bdbdbd', 'svg.fonttype': 'path',
                     'figure.facecolor': 'white', 'savefig.facecolor': 'white'})
INK, INK2, GRID = '#000000', '#555555', '#e3e3e3'


def num(v, d=0):
    return f'{v:,.{d}f}'.replace(',', '_').replace('.', ',').replace('_', '.')


def save(fig, name):
    for ext in ('svg', 'png'):
        fig.savefig(OUT / f'{name}.{ext}', dpi=180)
    plt.close(fig)


# ---------------------------------------------------------------- volume
year_2021 = [r for r in rows if r['month'].startswith('2021')]
base = {k: sum(r[k] for r in year_2021) / 12 for k in ('inflation_posts', 'relevant_posts')}
series = {k: [100 * r[k] / base[k] for r in rows] for k in base}
# The spoken comparison is 2022 against 2021. Keep the script honest about it.
ratio = {k: sum(r[k] for r in rows if r['month'].startswith('2022')) / sum(r[k] for r in year_2021) for k in base}
assert round(ratio['inflation_posts'], 1) == 3.2 and round(ratio['relevant_posts'], 1) == 2.1, ratio

fig, ax = plt.subplots(figsize=(11.36, 3.65))
fig.subplots_adjust(left=.065, right=.80, top=.91, bottom=.15)
x = range(68)
ax.axhline(100, color='#9a9a9a', linewidth=.8, zorder=1)
ax.plot(x, series['relevant_posts'], color=INK2, linewidth=1.5, dashes=(4, 2.2), zorder=3)
ax.plot(x, series['inflation_posts'], color=INK, linewidth=2.6, solid_joinstyle='round', zorder=4)
ax.set_xlim(-1, 68)
ax.set_ylim(0, 450)
ax.set_yticks([0, 100, 200, 300, 400])
ax.set_xticks([5.5, 17.5, 29.5, 41.5, 53.5, 63.5], ['2021.', '2022.', '2023.', '2024.', '2025.', '2026.*'])
ax.tick_params(axis='both', length=0, pad=10)
ax.set_axisbelow(True)
ax.yaxis.grid(True, color=GRID, linewidth=.7)
for b in (11.5, 23.5, 35.5, 47.5, 59.5):
    ax.axvline(b, color='#d4d4d4', linewidth=.6, zorder=0)
ax.text(0, 1.035, 'Indeks, prosjek 2021. = 100', transform=ax.transAxes, fontsize=13, color=INK2)
end = {k: v[-1] for k, v in series.items()}
ax.annotate('Sve objave o inflaciji', (67, end['inflation_posts']), xytext=(12, 0), textcoords='offset points',
            va='center', fontsize=14, fontweight='medium', color=INK, annotation_clip=False)
ax.annotate('Relevantne\ninstitucionalne objave', (67, end['relevant_posts']), xytext=(12, 0), textcoords='offset points',
            va='center', fontsize=14, color=INK2, linespacing=1.25, annotation_clip=False)
save(fig, 'conversation-volume')

# ----------------------------------------------------------------- rooms
years = {}
for a in annual:
    rr = [r for r in rows if r['month'].startswith(str(a['year']))]
    assert len(rr) == a['months']
    den = sum(r['inflation_reach'] for r in rr)
    numer = sum(r['weighted_institutional_reach'] for r in rr)
    share = 100 * numer / (den + 1)
    assert round(share, 2) == a['weighted_share_pct'], (a['year'], share)
    years[a['year']] = {'reach': den / len(rr), 'share': share / 100, 'label': a['weighted_share_pct'],
                        'partial': a['months'] < 12}


def rooms(name, pick, figsize, gap, fs):
    """Squares on a common floor. Area tracks reach, the black block tracks the weighted share."""
    width, height = figsize
    top = max(years[y]['reach'] for y in pick)
    side = {y: (years[y]['reach'] / top) ** .5 for y in pick}
    pad_x, floor, head = .08, .5, .48
    unit = min((width - 2 * pad_x - gap * (len(pick) - 1)) / sum(side.values()), height - floor - head)
    used = unit * sum(side.values()) + gap * (len(pick) - 1)
    fig = plt.figure(figsize=figsize)
    ax = fig.add_axes([0, 0, 1, 1])
    ax.set_xlim(0, width)
    ax.set_ylim(0, height)
    ax.axis('off')
    x = (width - used) / 2
    ax.plot([x - .12, x + used + .12], [floor, floor], color=INK, linewidth=.8, zorder=5)
    for y in pick:
        s = side[y] * unit
        block = s * years[y]['share'] ** .5
        ax.add_patch(Rectangle((x, floor), s, s, facecolor='#f1f1f1', edgecolor='#8a8a8a', linewidth=.8, zorder=2))
        ax.add_patch(Rectangle((x, floor), block, block, facecolor=INK, edgecolor='none', zorder=3))
        ax.text(x + s / 2, floor + s + .11, f"{num(years[y]['label'], 2)} %", ha='center', va='bottom',
                fontsize=fs, fontweight='medium', color=INK)
        ax.text(x + s / 2, floor - .12, f"{y}.{'*' if years[y]['partial'] else ''}", ha='center', va='top',
                fontsize=fs - 1, color=INK2)
        x += s + gap
    save(fig, name)


rooms('rooms', [2021, 2022, 2023, 2024, 2025, 2026], (11.36, 3.05), .42, 18)
rooms('rooms-pair', [2021, 2025], (5.6, 2.75), .7, 20)
print('Built conversation-volume, rooms and rooms-pair from 68 saved observations.')
print('2022 against 2021:', {k: round(v, 2) for k, v in ratio.items()})
