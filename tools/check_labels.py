"""Report English still visible inside figure labels.

Run after editing figures to confirm nothing was left untranslated. LaTeX
commands, package names and comment lines are ignored, so only words a reader
would actually see in the rendered figure are reported.
"""
import glob
import os
import re

FIGDIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "src", "figures")

# Calls whose string argument gets drawn on the page.
DISPLAY_CALLS = ("label", "dot", "minipage", "legend", "draw")
# Values that are package names, pattern names, engine names, or directions.
SKIP_VALUES = {
    "amsmath", "amssymb", "color", "derivative", "xeCJK", "ctex", "xcolor",
    "hatch", "crosshatch", "SimSun", "latex", "xelatex", "pdf", "svg", "png",
    "eps", "clockwise", "counterclockwise",
}

total = 0
for path in sorted(glob.glob(os.path.join(FIGDIR, "*.asy"))):
    with open(path, encoding="utf-8", errors="replace") as fh:
        text = fh.read()
    for line_no, line in enumerate(text.splitlines(), 1):
        s = line.strip()
        if s.startswith("//") or s.startswith("usepackage") or "pattern(" in s:
            continue
        if not any(s.startswith(c + "(") or (" " + c + "(") in s for c in DISPLAY_CALLS):
            continue
        for literal in re.findall(r'"([^"]*)"', s):
            if literal in SKIP_VALUES:
                continue
            if re.match(r"^(https?://|\S+\.(svg|png|pdf|jpg|asy)$)", literal):
                continue
            prose = re.sub(r"\$[^$]*\$", " ", literal)       # drop maths
            prose = re.sub(r"\\[A-Za-z]+\{[^{}]*\}", " ", prose)  # \color{red}
            prose = re.sub(r"\\[A-Za-z]+\s*", " ", prose)    # remaining commands
            prose = re.sub(r"[{}]", " ", prose)
            if re.findall(r"[A-Za-z]{3,}", prose):
                # The copyright credit is intentionally left in English.
                if "Evan Chen" in literal or "evanchen.cc" in literal:
                    continue
                total += 1
                print(f"{os.path.basename(path)}:{line_no}  {literal[:70]}")

print()
print(f"剩余英文标签: {total}" + ("  (看起来干净)" if total == 0 else ""))
