#!/usr/bin/env python3
"""Marka fontlarını tüm şablonlara uygular.
  set-fonts.py --display "Sora" --mono "JetBrains Mono" [--weights 500,700,900]
  set-fonts.py --display "Brand Sans" --local          # docs/brand-kit/fonts/ içindeki dosyaları kullan (woff2/ttf/otf)
Kaynak font adları şablonlarda: Figtree , IBM Plex Mono (mono). Ayrıca docs/brand-kit/fonts.md'yi günceller.
Google Fonts adı birebir yazılmalı (fonts.google.com). Lisans: web fontu olarak gömmeye uygun olmalı."""
import argparse, glob, os, re, sys, urllib.parse
ap = argparse.ArgumentParser()
ap.add_argument("--display", required=True); ap.add_argument("--mono", default="IBM Plex Mono")
ap.add_argument("--weights", default="500,700,800,900"); ap.add_argument("--local", action="store_true")
ap.add_argument("--root", default=".")
a = ap.parse_args();
root = os.path.abspath(a.root)
files = [f for f in glob.glob(f"{root}/docs/templates/**/*.html", recursive=True) + glob.glob(f"{root}/docs/templates/**/*.css", recursive=True)]
fams = []
for n in (a.display, a.mono):
    if n not in fams: fams.append(n)
def q(n, w): return "family=" + urllib.parse.quote_plus(n).replace("%2B", "+") + ((":wght@" + w.replace(",", ";")) if w else "")
url = "https://fonts.googleapis.com/css2?" + "&".join(q(n, "500" if n == a.mono else a.weights) for n in fams) + "&display=swap"
face = ""
if a.local:
    fdir = f"{root}/docs/brand-kit/fonts"; exts = ("woff2", "ttf", "otf", "woff")
    for f in sorted(glob.glob(f"{fdir}/*")):
        if f.lower().endswith(exts):
            base = os.path.splitext(os.path.basename(f))[0]
            w = 900 if re.search("black|heavy", base, re.I) else 800 if re.search("extrabold", base, re.I) else 700 if re.search("bold", base, re.I) else 500 if re.search("medium", base, re.I) else 400
            face += f'@font-face{{font-family:"{a.display}";src:url("../brand-kit/fonts/{os.path.basename(f)}");font-weight:{w}}}\n'
    if not face: sys.exit("docs/brand-kit/fonts/ içinde font dosyası yok")
q_ = lambda n: f'"{n}"' if " " in n else n
n = 0
for f in files:
    s = open(f, encoding="utf-8").read(); o = s
    s = re.sub(r"https://fonts\.googleapis\.com/css2\?[^\"')\s]*", "" if a.local else url, s)
    s = s.replace('"IBM Plex Mono"', q_(a.mono)).replace("IBM Plex Mono", a.mono).replace("IBM+Plex+Mono", a.mono.replace(" ", "+"))
    s = re.sub(r"\bFigtree\b", lambda m: a.display, s)
    if a.local and f.endswith("brand.css") and "@font-face" not in s: s = face + s
    if s != o: open(f, "w", encoding="utf-8").write(s); n += 1
fm = f"{root}/docs/brand-kit/fonts.md"
if os.path.isdir(os.path.dirname(fm)):
    open(fm, "w", encoding="utf-8").write(f"# Font seçimi (set-fonts.py ile uygulandı)\n\n| Rol | Font | Kaynak |\n|---|---|---|\n| Ana font (başlık+gövde) | {a.display} | {'brand-kit/fonts/' if a.local else 'Google Fonts'} |\n| Etiket (mono) | {a.mono} | Google Fonts |\n\nAğırlıklar: {a.weights}. Yeniden uygulamak: `python3 docs/templates/set-fonts.py ...`\n")
print(f"{n} dosya güncellendi; font={a.display} mono={a.mono}")
