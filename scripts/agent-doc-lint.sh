#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DOC_PATH_RE='^(docs|i18n/en/docusaurus-plugin-content-docs/current)/.*\.(md|mdx)$'
PLACEHOLDER_RE='(^|[^A-Za-z0-9_])(TODO|TBD|XXX|XXXXXX)([^A-Za-z0-9_]|$)'

if [[ $# -eq 0 ]]; then
  echo "agent-doc-lint: no files provided, skipping."
  exit 0
fi

fail_count=0

err() {
  local msg="$1"
  echo "ERROR: ${msg}"
  fail_count=$((fail_count + 1))
}

is_partial_file() {
  local file="$1"
  local base
  base="$(basename "$file")"
  [[ "$base" =~ ^_ ]]
}

has_frontmatter() {
  local file="$1"
  local first_line
  first_line="$(head -n 1 "$file" || true)"
  [[ "$first_line" == "---" ]]
}

frontmatter_value() {
  local file="$1"
  local key="$2"
  awk -v key="$key" '
    NR == 1 && $0 == "---" {in_fm=1; next}
    in_fm && $0 == "---" {exit}
    in_fm && $0 ~ ("^" key "[[:space:]]*:") {
      sub("^[^:]+:[[:space:]]*", "", $0)
      gsub(/^"|"$/, "", $0)
      gsub(/^'\''|'\''$/, "", $0)
      print $0
      exit
    }
  ' "$file"
}

is_wrapper_file() {
  local file="$1"
  local first_non_empty
  local total_lines
  local doc_kind
  doc_kind="$(frontmatter_value "$file" "doc_kind" || true)"
  if [[ "$doc_kind" == "wrapper" ]]; then
    return 0
  fi

  first_non_empty="$(awk 'NF {print; exit}' "$file" || true)"
  total_lines="$(wc -l < "$file" | awk '{print $1}')"

  if [[ "$first_non_empty" =~ ^import[[:space:]] ]] && [[ "$total_lines" -le 30 ]]; then
    return 0
  fi

  return 1
}

check_unlabeled_fence() {
  local file="$1"
  awk '
    BEGIN {in_fence=0}
    /^```/ {
      line=$0
      gsub(/[[:space:]]+$/, "", line)
      if (in_fence == 0) {
        if (line == "```") {
          printf("%d\n", NR)
        }
        in_fence=1
      } else {
        in_fence=0
      }
    }
  ' "$file"
}

for file in "$@"; do
  if [[ ! -f "$file" ]]; then
    continue
  fi

  if [[ ! "$file" =~ $DOC_PATH_RE ]]; then
    continue
  fi

  if [[ "$(wc -c < "$file" | awk '{print $1}')" -eq 0 ]]; then
    err "$file is empty"
    continue
  fi

  if [[ "$file" != *"/template/"* ]]; then
    if grep -Enim 1 "$PLACEHOLDER_RE" "$file" >/dev/null; then
      hit="$(grep -Enim 1 "$PLACEHOLDER_RE" "$file" || true)"
      err "$file contains placeholder token: $hit"
    fi
  fi

  while IFS= read -r line_no; do
    [[ -z "$line_no" ]] && continue
    err "$file has unlabeled code fence at line $line_no"
  done < <(check_unlabeled_fence "$file")

  if is_partial_file "$file" || is_wrapper_file "$file"; then
    continue
  fi

  if ! has_frontmatter "$file"; then
    err "$file missing front matter (must start with ---)"
    continue
  fi

  if ! grep -Eq '^sidebar_position[[:space:]]*:' "$file"; then
    err "$file front matter missing sidebar_position"
  fi

  first_heading="$(grep -En '^#{1,6} ' "$file" | head -n 1 || true)"
  if [[ -z "$first_heading" ]]; then
    err "$file missing heading"
    continue
  fi

  if [[ ! "$first_heading" =~ ^[0-9]+:\#\  ]]; then
    err "$file first heading is not H1: $first_heading"
  fi
done

if [[ "$fail_count" -gt 0 ]]; then
  echo "agent-doc-lint failed with ${fail_count} issue(s)."
  exit 1
fi

echo "agent-doc-lint passed."
