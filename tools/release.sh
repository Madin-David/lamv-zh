#!/usr/bin/env bash
# Build the book and publish the PDF as a GitHub release.
#
# The PDF lives in Releases rather than in git, so this is how a new build
# reaches readers. Requires the GitHub CLI (gh) to be installed and logged in.
#
#   ./tools/release.sh v1.0 "首次发布：全书中文翻译"
set -euo pipefail

TAG="${1:?用法: release.sh <tag> [说明]  例如 release.sh v1.0}"
NOTES="${2:-中文翻译版 $TAG}"

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

PDF_LOCAL="线性代数与多元微积分-中文版.pdf"
# Release assets get an ASCII name: a non-ASCII name in the upload URL is
# mangled (the Chinese characters are dropped), and percent-encoded download
# links are awkward to share.
#
# The name carries no version on purpose, so the README can point at
#   .../releases/latest/download/lamv-zh.pdf
# and keep working across releases.
PDF_ASSET="lamv-zh.pdf"

command -v typst >/dev/null || { echo "找不到 typst，请先安装：https://typst.app"; exit 1; }
command -v gh    >/dev/null || { echo "找不到 gh，请先安装 GitHub CLI：https://cli.github.com"; exit 1; }

echo "==> 编译 $PDF_LOCAL"
typst compile lamv-zh.typ "$PDF_LOCAL"
ls -la "$PDF_LOCAL"

cp "$PDF_LOCAL" "$PDF_ASSET"
trap 'rm -f "$PDF_ASSET"' EXIT

echo "==> 创建 release $TAG"
gh release create "$TAG" "$PDF_ASSET" --title "$TAG" --notes "$NOTES"

echo "==> 完成。Releases 页面："
gh release view "$TAG" --json url -q .url
