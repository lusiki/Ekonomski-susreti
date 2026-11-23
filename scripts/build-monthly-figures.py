"""Draw monthly bars from the verified 28 September 2026 saved aggregates."""
from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib import font_manager
from matplotlib.ticker import FuncFormatter

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'docs/slides/figures-20260928'
data=json.loads((ROOT/'docs/slides/data/monthly-20260928.json').read_text(encoding='utf-8'))
rows=data['monthly'];assert len(rows)==68
for f in (ROOT/'docs/fonts').glob('Roboto-*.ttf'):font_manager.fontManager.addfont(str(f))
plt.rcParams.update({'font.family':'Roboto','font.size':14,'axes.spines.top':False,'axes.spines.right':False,
 'axes.spines.left':False,'axes.edgecolor':'#bdbdbd','svg.fonttype':'path','figure.facecolor':'white','savefig.facecolor':'white'})
def num(v,d=0):return f'{v:,.{d}f}'.replace(',','_').replace('.',',').replace('_','.')
def bars(ax,key,mult,ylim,ticks,unit):
    values=[r[key]*mult for r in rows]
    ax.bar(range(68),values,width=.78,color='#333333',linewidth=0,zorder=3)
    ax.set_xlim(-1,68);ax.set_ylim(*ylim);ax.set_yticks(ticks)
    ax.yaxis.set_major_formatter(FuncFormatter(lambda v,p:num(v,1 if unit=='Omjer' else 0)))
    ax.set_xticks([5.5,17.5,29.5,41.5,53.5,63.5],['2021.','2022.','2023.','2024.','2025.','2026.*'])
    ax.tick_params(axis='both',length=0,pad=10)
    ax.set_axisbelow(True);ax.yaxis.grid(True,color='#e3e3e3',linewidth=.7)
    for b in [11.5,23.5,35.5,47.5,59.5]:ax.axvline(b,color='#d4d4d4',linewidth=.6,zorder=0)
    ax.text(0,1.035,unit,transform=ax.transAxes,fontsize=13,color='#555555')
def save(fig,name):
    for ext in ['svg','png']:fig.savefig(OUT/f'{name}.{ext}',dpi=180)
    plt.close(fig)
for key,name,mult,ylim,ticks,unit in [
 ('hicp_pct','monthly-inflation',1,(0,15),[0,5,10,15],'%'),
 ('weighted_share','monthly-share',100,(0,18),[0,5,10,15],'%'),
 ('relative_frequency','monthly-frequency',100,(0,30),[0,10,20,30],'%'),
 ('relative_reach','monthly-reach',1,(0,1.15),[0,.3,.6,.9],'Omjer')]:
    fig,ax=plt.subplots(figsize=(11.36,3.65));fig.subplots_adjust(left=.065,right=.99,top=.91,bottom=.15)
    bars(ax,key,mult,ylim,ticks,unit);save(fig,name)
fig,axs=plt.subplots(2,1,figsize=(11.36,3.8));fig.subplots_adjust(left=.07,right=.99,top=.9,bottom=.14,hspace=.7)
bars(axs[0],'relevant_posts',1,(0,2200),[0,1000,2000],'Broj relevantnih institucionalnih objava')
bars(axs[1],'weighted_share',100,(0,18),[0,5,10,15],'Ponderirani udio (%)')
save(fig,'monthly-counts-share')
print('Built five monthly bar charts from 68 saved observations, no interpolation or models.')
