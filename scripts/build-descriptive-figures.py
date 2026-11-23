"""Reproduce descriptive slides from Table 1 and Figures 1/3 of the dated paper.

No models, older interactive data, digitised points, or inferred monthly values.
Requires beautifulsoup4 and matplotlib. An optional --source uses a local copy.
"""
import argparse
import base64
import hashlib
import json
from pathlib import Path
import urllib.request

from bs4 import BeautifulSoup
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import font_manager
from matplotlib.ticker import FuncFormatter

ROOT = Path(__file__).resolve().parents[1]
FIGURES = ROOT / "docs/slides/figures-20260928"
DATA = ROOT / "docs/slides/data"
REVISION = "b2187d34159b5d40caeecb2694640331e4aeae71"
URL = f"https://raw.githubusercontent.com/lusiki/HNB_Media_Attention/{REVISION}/media-hub/public/downloads/PAPER_EXT.html"
EXPECTED_SHA256 = "abe93a6b34b90c5e75a8aa7439c52e4e69abec396c5506afa1a264f8c50f403b"

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--source", type=Path)
args = parser.parse_args()
raw = args.source.read_bytes() if args.source else urllib.request.urlopen(URL).read()
assert hashlib.sha256(raw).hexdigest() == EXPECTED_SHA256, "Unexpected paper edition"
soup = BeautifulSoup(raw.decode("utf-8"), "html.parser")
table = soup.select("table")[0]
annual = []
for row in table.select("tbody tr"):
    cells = [c.get_text(strip=True) for c in row.select("td")]
    if not cells:
        continue
    numbers = [float(c.replace(".", "").replace(",", ".")) for c in cells]
    annual.append(dict(zip(("year", "months", "institutional_posts", "relevant_posts", "weighted_share_pct", "mean_hicp_pct"), numbers)))
    for key in ("year", "months", "institutional_posts", "relevant_posts"):
        annual[-1][key] = int(annual[-1][key])
assert len(annual) == 6 and sum(r["months"] for r in annual) == 68
assert sum(r["institutional_posts"] for r in annual) == 124163
assert sum(r["relevant_posts"] for r in annual) == 65530
assert [r["weighted_share_pct"] for r in annual] == [6.12, 3.59, 4.67, 3.26, 3.17, 1.86]
FIGURES.mkdir(parents=True, exist_ok=True)
DATA.mkdir(parents=True, exist_ok=True)
images = soup.select("figure img")
figure_hashes = {}
for index, filename in ((0, "paper-figure-1.png"), (2, "paper-figure-3.png")):
    image = base64.b64decode(images[index]["src"].split(",", 1)[1])
    (FIGURES / filename).write_bytes(image)
    figure_hashes[filename] = hashlib.sha256(image).hexdigest()

metadata = {
    "paper_edition": "2026-09-28", "repository_revision": REVISION,
    "source_url": URL, "source_sha256": EXPECTED_SHA256,
    "public_paper_url": "https://lusiki.github.io/HNB_Media_Attention/media/downloads/PAPER_EXT.html",
    "period": "2021-01/2026-08", "annual": annual,
    "annual_share_definition": "Ratio of annual sums of weighted institutional numerator and inflation denominator, not an unweighted mean of monthly shares. Values published to two decimals.",
    "corpus": "Broad institutional corpus: HNB names/acronym OR generic central-bank terms. Retained digital sources can include social posts and comments. Relevant means matching the paper's inflation definition.",
    "partial_year": "2026 covers January-August. Counts are not annualised; the same-month prior-year comparison is unavailable in Table 1.",
    "monthly_data": "Monthly bar charts use the verified saved analysis panel from 28 September 2026; see monthly-20260928.json. Original Figures 1 and 3 remain reference assets. No digitisation, interpolation, or splice with older public CSV.",
    "figure_sha256": figure_hashes,
}
(DATA / "descriptive-20260928.json").write_text(json.dumps(metadata, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

for font in (ROOT / "docs/fonts").glob("Roboto-*.ttf"):
    font_manager.fontManager.addfont(str(font))
plt.rcParams.update({"font.family": "Roboto", "font.size": 15, "axes.titlesize": 18,
    "axes.titleweight": "regular", "axes.labelsize": 14, "axes.spines.top": False,
    "axes.spines.right": False, "axes.spines.left": False, "axes.edgecolor": "#bdbdbd",
    "xtick.color": "#555555", "ytick.color": "#555555", "svg.fonttype": "path",
    "savefig.facecolor": "white", "figure.facecolor": "white"})

def number(value, digits=2):
    return f"{value:,.{digits}f}".replace(",", "_").replace(".", ",").replace("_", ".")

def style(axis, ticks):
    axis.set_yticks(ticks)
    axis.set_axisbelow(True)
    axis.yaxis.grid(True, color="#e5e5e5", linewidth=.7)
    axis.tick_params(axis="both", length=0, pad=10)
    axis.yaxis.set_major_formatter(FuncFormatter(lambda x, _: number(x, 0)))

def save(fig, name):
    for suffix in ("svg", "png"):
        fig.savefig(FIGURES / f"{name}.{suffix}", dpi=180)
    plt.close(fig)

fig, ax = plt.subplots(figsize=(11.36, 3.65))
fig.subplots_adjust(left=.055, right=.985, top=.86, bottom=.18)
x = list(range(6)); values = [r["weighted_share_pct"] for r in annual]
bars = ax.bar(x, values, width=.55, color=["#000000", "#8a8a8a", "#8a8a8a", "#8a8a8a", "#8a8a8a", "white"], edgecolor=["#000000"]*6, linewidth=.8)
bars[-1].set_hatch("///")
ax.set_ylim(0, 7.15); ax.set_xlim(-.6,5.6)
ax.set_xticks(x, [str(r["year"]) if r["year"]!=2026 else "2026*" for r in annual])
style(ax, [0,2,4,6])
for i,v in enumerate(values): ax.text(i,v+.18,number(v)+" %",ha="center",va="bottom",fontsize=19,color="black")
ax.set_title("Ponderirani udio u inflacijskom diskursu",loc="left",pad=20)
save(fig, "annual-share")

fig, axes = plt.subplots(1,2,figsize=(11.36,3.75))
fig.subplots_adjust(left=.07,right=.985,top=.79,bottom=.14,wspace=.35)
counts=[r["relevant_posts"] for r in annual[:2]]; shares=values[:2]
for ax, vals, title, ceiling, ticks in ((axes[0],counts,"Broj relevantnih institucionalnih objava",21000,[0,5000,10000,15000,20000]),(axes[1],shares,"Ponderirani udio u inflacijskom diskursu (%)",7.5,[0,2,4,6])):
    ax.bar([0,1],vals,width=.5,color=["#bdbdbd","#000000"])
    ax.set_xlim(-.6,1.6); ax.set_ylim(0,ceiling); ax.set_xticks([0,1],["2021.","2022."])
    style(ax,ticks); ax.set_title(title,loc="left",pad=24,fontsize=15)
    for i,v in enumerate(vals):
        ax.text(i,v+.035*ceiling,number(v,0 if ax is axes[0] else 2),ha="center",fontsize=21,color="black")
save(fig,"more-posts-less-share")
print(f"Built two descriptive charts and copied two original figures. {len(annual)} annual rows; 68 months; no model estimation.")
