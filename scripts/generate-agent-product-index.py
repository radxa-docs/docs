#!/usr/bin/env python3
"""Generate the public Agent product navigation index from Home.md."""

from __future__ import annotations

import argparse
import difflib
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ZH_HOME = ROOT / "docs/Home.md"
EN_HOME = ROOT / "i18n/en/docusaurus-plugin-content-docs/current/Home.md"
OUTPUT = ROOT / "static/agent/products.json"
EN_ROOT = Path("i18n/en/docusaurus-plugin-content-docs/current")
SITE_URL = "https://docs.radxa.com"

SERIES_KEY_RE = re.compile(r"^\s*series_en\s*:")
PRODUCT_KEY_RE = re.compile(r"^\s*products_name\s*:")
LINK_KEY_RE = re.compile(r"^\s*products_link\s*:")
SERIES_RE = re.compile(r'^\s*series_en:\s*"([^"]+)",?\s*$')
PRODUCT_RE = re.compile(r'^\s*products_name:\s*"([^"]+)",?\s*$')
LINK_RE = re.compile(r'^\s*products_link:\s*"([^"]*)",?\s*$')

# Public routes that intentionally differ from their content directories.
CONTENT_ROOT_OVERRIDES = {
    "/compute-module/cm3": "docs/som/cm/cm3",
    "/compute-module/cm3i": "docs/som/cm/cm3i",
    "/compute-module/cm3j": "docs/som/cm/cm3j",
    "/compute-module/cm4": "docs/som/cm/cm4",
    "/compute-module/cm5": "docs/som/cm/cm5",
    "/compute-module/nx5": "docs/som/nx/nx5",
    "/nio/12l": "docs/nio/nio12l",
}


def parse_home(path: Path) -> list[tuple[str, str, str]]:
    family = None
    product = None
    entries: list[tuple[str, str, str]] = []

    for line_number, line in enumerate(
        path.read_text(encoding="utf-8").splitlines(), start=1
    ):
        if SERIES_KEY_RE.match(line):
            match = SERIES_RE.match(line)
            if not match:
                raise ValueError(
                    f"{path}:{line_number}: invalid series_en field"
                )
            if product:
                raise ValueError(
                    f"{path}:{line_number}: product {product!r} has no "
                    "products_link before the next series"
                )
            family = match.group(1)
        elif PRODUCT_KEY_RE.match(line):
            match = PRODUCT_RE.match(line)
            if not match:
                raise ValueError(
                    f"{path}:{line_number}: invalid products_name field"
                )
            if product:
                raise ValueError(
                    f"{path}:{line_number}: product {product!r} has no "
                    "products_link before the next product"
                )
            product = match.group(1)
        elif LINK_KEY_RE.match(line):
            match = LINK_RE.match(line)
            if not match:
                raise ValueError(
                    f"{path}:{line_number}: invalid products_link field"
                )
            if not product:
                raise ValueError(
                    f"{path}:{line_number}: products_link has no product"
                )
            if not family:
                raise ValueError(f"{path}: product {product!r} has no family")
            entries.append((family, product, match.group(1)))
            product = None

    if product:
        raise ValueError(f"{path}: product {product!r} has no products_link")
    if not entries:
        raise ValueError(f"{path}: no products found")
    return entries


def product_id(name: str) -> str:
    normalized = name.lower().replace("+", " plus ")
    return re.sub(r"[^a-z0-9]+", "-", normalized).strip("-")


def content_entries(route: str) -> dict[str, str]:
    public_path = route.split("?", 1)[0].rstrip("/")
    zh_root = Path(
        CONTENT_ROOT_OVERRIDES.get(public_path, f"docs{public_path}")
    )
    zh_entry = zh_root / "README.md"
    en_entry = EN_ROOT / zh_root.relative_to("docs") / "README.md"

    for entry in (zh_entry, en_entry):
        if not (ROOT / entry).is_file():
            raise ValueError(f"missing product entry: {entry}")

    return {"en": en_entry.as_posix(), "zh": zh_entry.as_posix()}


def build_index() -> dict[str, object]:
    zh_products = parse_home(ZH_HOME)
    en_products = parse_home(EN_HOME)
    if zh_products != en_products:
        raise ValueError("Chinese and English Home.md product routes differ")

    seen_ids: set[str] = set()
    products = []
    unlinked_products = []
    for family, name, route in zh_products:
        item_id = product_id(name)
        if item_id in seen_ids:
            raise ValueError(f"duplicate product id: {item_id}")
        seen_ids.add(item_id)
        if not route:
            unlinked_products.append(
                {"id": item_id, "name": name, "family": family}
            )
            continue
        products.append(
            {
                "id": item_id,
                "name": name,
                "family": family,
                "public_urls": {
                    "en": f"{SITE_URL}/en{route}",
                    "zh": f"{SITE_URL}{route}",
                },
                "source_entries": content_entries(route),
            }
        )

    return {
        "schema_version": 1,
        "description": (
            "Non-exhaustive navigation pointers for linked product cards in "
            "the Radxa documentation home catalog. Product specifications "
            "remain in the linked content."
        ),
        "fallback_discovery": {
            "published_routes": f"{SITE_URL}/sitemap.xml",
            "en_source_tree": (
                "https://github.com/radxa-docs/docs/tree/main/i18n/en/"
                "docusaurus-plugin-content-docs/current"
            ),
            "zh_source_tree": (
                "https://github.com/radxa-docs/docs/tree/main/docs"
            ),
        },
        "generated_from": [
            ZH_HOME.relative_to(ROOT).as_posix(),
            EN_HOME.relative_to(ROOT).as_posix(),
        ],
        "unlinked_catalog_products": unlinked_products,
        "products": products,
    }


def render() -> str:
    return json.dumps(build_index(), ensure_ascii=False, indent=2) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail if the committed index differs from generated output",
    )
    args = parser.parse_args()

    try:
        expected = render()
    except ValueError as error:
        print(f"ERROR: {error}", file=sys.stderr)
        return 1

    if args.check:
        actual = OUTPUT.read_text(encoding="utf-8") if OUTPUT.exists() else ""
        if actual == expected:
            print("Agent product index is current.")
            return 0
        print("ERROR: static/agent/products.json is stale.", file=sys.stderr)
        sys.stderr.writelines(
            difflib.unified_diff(
                actual.splitlines(keepends=True),
                expected.splitlines(keepends=True),
                fromfile=str(OUTPUT.relative_to(ROOT)),
                tofile="generated",
            )
        )
        return 1

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text(expected, encoding="utf-8")
    print(f"Wrote {OUTPUT.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
