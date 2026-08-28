# Radxa Documentation

Content-only source repository for [docs.radxa.com](https://docs.radxa.com).
The Docusaurus application and UI are maintained separately in
`radxa-docs/docs-template`; CI checks out this repository as `contents/` when
building the site.

## Documentation layout

- `docs/` — Chinese documentation.
- `i18n/en/docusaurus-plugin-content-docs/current/` — English documentation.
- `static/` — files copied to the root of the published site.
- `docs/linkr` and its English counterpart — independent Git submodules.

Initialize the complete content tree with:

```bash
git submodule update --init --recursive
```

## Agent entry points

- `AGENTS.md` — repository-wide reading, editing, and validation workflow.
- `static/agent/products.json` — generated, non-exhaustive Home-catalog
  navigation index; it intentionally contains no product specifications and
  points to the sitemap and source trees as fallbacks.
- `static/llms.txt` — public discovery entry published as
  [docs.radxa.com/llms.txt](/llms.txt).
- `.github/agent-reading-guide.md` — wrapper, partial, and source-resolution
  rules.
- `AGENT-DOC-SPEC.md` — authoring requirements for Agent-friendly pages.

Regenerate and verify the product index with:

```bash
python3 scripts/generate-agent-product-index.py
python3 scripts/generate-agent-product-index.py --check
```

Product facts remain in the product documentation. The generated index is only
a locator and must not be cited as a specification source. A product missing
from the Home catalog may still have published documentation; use the sitemap
and source-tree fallbacks recorded in the index.
