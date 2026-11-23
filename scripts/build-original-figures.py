"""Visualise the initial paper's saved results; do not re-estimate models."""
from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib import font_manager
from matplotlib.ticker import FuncFormatter
ROOT=Path(__file__).resolve().parents[1];OUT=ROOT/'docs/slides/figures-original';OUT.mkdir(exist_ok=True)
data=json.loads((ROOT/'docs/slides/data/original-results.json').read_text(encoding='utf-8'))
rows=[r for r in data['expectations_table_7a'] if r['spec']=='IAG_ext (lin.)']
assert len(rows)==9
for f in (ROOT/'docs/fonts').glob('Roboto-*.ttf'):font_manager.fontManager.addfont(str(f))
plt.rcParams.update({'font.family':'Roboto','font.size':14,'svg.fonttype':'path'})
fig,ax=plt.subplots(figsize=(7,4.3));fig.subplots_adjust(left=.12,right=.98,top=.79,bottom=.18)
for r in rows:
    ax.errorbar(r['horizon'],.01*r['beta'],yerr=1.96*.01*r['se'],fmt='o',color='black',
        markerfacecolor='black' if r['p_bonf']<.05 else 'white',markersize=6,capsize=3,elinewidth=1)
ax.axhline(0,color='#777777',linewidth=.8)
ax.set_ylim(-.95,.1);ax.set_xlim(-.5,12.5)
ax.set_xticks([r['horizon'] for r in rows]);ax.set_xlabel('Horizont (tjedni)',labelpad=12)
ax.set_yticks([-.8,-.6,-.4,-.2,0]);ax.yaxis.set_major_formatter(FuncFormatter(lambda v,p:f'{v:.1f}'.replace('.',',')))
ax.set_axisbelow(True);ax.yaxis.grid(color='#e3e3e3',linewidth=.7)
for side in ['top','right','left']:ax.spines[side].set_visible(False)
ax.spines['bottom'].set_color('#bbbbbb');ax.tick_params(axis='both',length=0,pad=8)
fig.text(.12,.94,'Bilanca očekivanja uz 1 p. b. veći udio objava',fontsize=15)
fig.text(.12,.865,'Crna točka: p < 0,05 nakon Bonferronijeve korekcije',fontsize=11,color='#555555')
for ext in ['svg','png']:fig.savefig(OUT/f'expectations.{ext}',dpi=180,facecolor='white')
plt.close(fig)
print('Rebuilt original LP graph from Table 7a; estimates rescaled to a 1 percentage-point change.')
