#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DOC_ROOT="docs"
I18N_ROOT="i18n/en/docusaurus-plugin-content-docs/current"
PLACEHOLDER_RE='(^|[^A-Za-z0-9_])(TODO|TBD|XXX|XXXXXX)([^A-Za-z0-9_]|$)'
TRANSLATION_MARKER_RE='Translation In Progress|Translation in progress|内容同步中|内容翻译同步中'

if ! command -v rg >/dev/null 2>&1; then
  echo "ERROR: rg is required for metrics."
  exit 1
fi

docs_count="$(find "$DOC_ROOT" -type f \( -name '*.md' -o -name '*.mdx' \) | wc -l | awk '{print $1}')"
i18n_count="$(find "$I18N_ROOT" -type f \( -name '*.md' -o -name '*.mdx' \) | wc -l | awk '{print $1}')"

placeholder_hits="$(rg -n -i "$PLACEHOLDER_RE" "$DOC_ROOT" "$I18N_ROOT" || true)"
placeholder_count="$(
  printf '%s\n' "$placeholder_hits" \
    | awk '!/\/template\//' \
    | sed '/^$/d' \
    | wc -l \
    | awk '{print $1}'
)"

translation_hits="$(rg -n "$TRANSLATION_MARKER_RE" "$DOC_ROOT" "$I18N_ROOT" || true)"
translation_docs_count="$(
  printf '%s\n' "$translation_hits" \
    | sed -E 's/:.*$//' \
    | awk '/^docs\//' \
    | sort -u \
    | sed '/^$/d' \
    | wc -l \
    | awk '{print $1}'
)"
translation_i18n_count="$(
  printf '%s\n' "$translation_hits" \
    | sed -E 's/:.*$//' \
    | awk '/^i18n\/en\/docusaurus-plugin-content-docs\/current\//' \
    | sort -u \
    | sed '/^$/d' \
    | wc -l \
    | awk '{print $1}'
)"
translation_total_count=$((translation_docs_count + translation_i18n_count))

docs_tmp="$(mktemp)"
i18n_tmp="$(mktemp)"
docs_only_tmp="$(mktemp)"
i18n_only_tmp="$(mktemp)"
trap 'rm -f "$docs_tmp" "$i18n_tmp" "$docs_only_tmp" "$i18n_only_tmp"' EXIT

(
  cd "$DOC_ROOT"
  find . -type f \( -name '*.md' -o -name '*.mdx' \) | sed 's#^\./##' | sort
) >"$docs_tmp"

(
  cd "$I18N_ROOT"
  find . -type f \( -name '*.md' -o -name '*.mdx' \) | sed 's#^\./##' | sort
) >"$i18n_tmp"

comm -23 "$docs_tmp" "$i18n_tmp" >"$docs_only_tmp"
comm -13 "$docs_tmp" "$i18n_tmp" >"$i18n_only_tmp"

docs_only_count="$(wc -l <"$docs_only_tmp" | awk '{print $1}')"
i18n_only_count="$(wc -l <"$i18n_only_tmp" | awk '{print $1}')"

unlabeled_count=0
while IFS= read -r file; do
  file_count="$(
    awk '
      BEGIN {in_fence=0; count=0}
      /^```/ {
        line=$0
        gsub(/[[:space:]]+$/, "", line)
        if (in_fence == 0) {
          if (line == "```") {
            count++
          }
          in_fence=1
        } else {
          in_fence=0
        }
      }
      END {print count}
    ' "$file"
  )"
  unlabeled_count=$((unlabeled_count + file_count))
done < <(find "$DOC_ROOT" "$I18N_ROOT" -type f \( -name '*.md' -o -name '*.mdx' \))

snapshot_date="$(date '+%Y-%m-%d')"

cat <<EOF
# Agent Doc Metrics Snapshot

Snapshot date: ${snapshot_date}

## Summary

- docs_file_count: ${docs_count}
- i18n_file_count: ${i18n_count}
- docs_only_count: ${docs_only_count}
- i18n_only_count: ${i18n_only_count}
- placeholder_count_non_template: ${placeholder_count}
- translation_placeholder_docs_count: ${translation_docs_count}
- translation_placeholder_i18n_count: ${translation_i18n_count}
- translation_placeholder_total_count: ${translation_total_count}
- unlabeled_fence_count: ${unlabeled_count}

## Top Drift Samples

### docs_only (first 10)
$(head -n 10 "$docs_only_tmp" | sed 's/^/- /')

### i18n_only (first 10)
$(head -n 10 "$i18n_only_tmp" | sed 's/^/- /')
EOF
