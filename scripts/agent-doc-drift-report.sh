#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

docs_tmp="$(mktemp)"
i18n_tmp="$(mktemp)"
docs_only_tmp="$(mktemp)"
i18n_only_tmp="$(mktemp)"
trap 'rm -f "$docs_tmp" "$i18n_tmp" "$docs_only_tmp" "$i18n_only_tmp"' EXIT

(
  cd docs
  find . -type f \( -name '*.md' -o -name '*.mdx' \) | sed 's#^\./##' | sort
) > "$docs_tmp"

(
  cd i18n/en/docusaurus-plugin-content-docs/current
  find . -type f \( -name '*.md' -o -name '*.mdx' \) | sed 's#^\./##' | sort
) > "$i18n_tmp"

comm -23 "$docs_tmp" "$i18n_tmp" > "$docs_only_tmp"
comm -13 "$docs_tmp" "$i18n_tmp" > "$i18n_only_tmp"

echo "docs_only_count $(wc -l < "$docs_only_tmp" | awk '{print $1}')"
echo "i18n_only_count $(wc -l < "$i18n_only_tmp" | awk '{print $1}')"
echo
echo "[docs_only]"
cat "$docs_only_tmp"
echo
echo "[i18n_only]"
cat "$i18n_only_tmp"
