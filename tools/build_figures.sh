#!/usr/bin/env bash
# Regenerate the SVG figures from their Asymptote sources.
#
# The compiled SVGs are committed, so this is only needed if you change a
# figure. Labels may contain Chinese, so the LaTeX engine is XeLaTeX with xeCJK
# rather than plain latex; the cjk preamble is injected into each .asy below.
#
# Requirements: asymptote, a TeX distribution with xelatex + xeCJK, ghostscript,
# and dvisvgm. Set the environment variables below to match your install.
set -u

# --- adjust these to your machine -------------------------------------------
ASY="${ASY:-asy}"
TEXBIN="${TEXBIN:-}"                       # dir holding xelatex/dvisvgm
GS="${GS:-gs}"                             # ghostscript executable
# ----------------------------------------------------------------------------

if [ -n "$TEXBIN" ]; then
  export PATH="$TEXBIN:$PATH"
  export ASYMPTOTE_TEXPATH="$TEXBIN"
  export ASYMPTOTE_DVISVGM="$TEXBIN/dvisvgm"
  export ASYMPTOTE_XELATEX="$TEXBIN/xelatex"
fi
export ASYMPTOTE_GS="$GS"

FIGDIR="$(cd "$(dirname "$0")/../src/figures" && pwd)"
JOBS="${JOBS:-5}"
MARK="// --- CJK preamble (zh build) ---"

cd "$FIGDIR" || exit 1

# Inject the CJK preamble once per file, right after the first import line.
python3 - <<'PYEOF'
import glob, io
MARK = "// --- CJK preamble (zh build) ---"
BLOCK = (
    MARK + "\n"
    'usepackage("xeCJK");\n'
    'texpreamble("\\setCJKmainfont{SimSun}");\n'
)
for path in sorted(glob.glob("*.asy")):
    s = io.open(path, encoding="utf-8").read()
    if MARK in s:
        continue
    io.open(path, "w", encoding="utf-8").write(BLOCK + s)
print("preamble injected")
PYEOF

build_one() {
  local f="$1"
  local base="${f%.asy}"
  if timeout 300 "$ASY" -tex xelatex -f svg "$f" -o "$base" > "$base.buildlog" 2>&1 \
     && [ -f "$base.svg" ]; then
    echo "ok    $base"
    rm -f "$base.buildlog"
    return 0
  fi
  echo "FAIL  $base  (see $base.buildlog)"
  return 1
}
export -f build_one
export ASY

ls *.asy | xargs -P "$JOBS" -I{} bash -c 'build_one "$@"' _ {}

echo
echo "=== summary ==="
echo "asy sources : $(ls *.asy | wc -l)"
echo "svg present : $(ls *.svg 2>/dev/null | wc -l)"
echo "failed      : $(ls *.buildlog 2>/dev/null | wc -l)"
ls *.buildlog 2>/dev/null | sed 's/\.buildlog//' | head -30

# planes-normalvector uses the 3D engine, which hangs in Asymptote 3.15.
# Its SVG is taken from the published PDF instead; restore it if it got lost.
if [ ! -f planes-normalvector.svg ] && [ -f planes-normalvector.svg.prebuilt ]; then
  cp planes-normalvector.svg.prebuilt planes-normalvector.svg
  echo "restored planes-normalvector.svg from the prebuilt copy"
fi
