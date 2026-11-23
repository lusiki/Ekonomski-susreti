"""Render the standalone workshop deck without running its demonstration analysis."""
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
subprocess.run(
    ["quarto", "render", "workshop/slides/slides.qmd"], cwd=ROOT, check=True
)
destination = ROOT / "docs/workshop/slides/index.html"
destination.parent.mkdir(parents=True, exist_ok=True)
html = (ROOT / "workshop/slides/slides.html").read_text(encoding="utf-8")
# Quarto's injected helpers contain trailing spaces; keep the published diff clean.
destination.write_text("\n".join(line.rstrip(" \t\r") for line in html.split("\n")), encoding="utf-8")
print(f"Updated {destination.relative_to(ROOT)}")
