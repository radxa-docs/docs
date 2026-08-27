# Radxa Documentation Agent Guide

This repository is the content source for [docs.radxa.com](https://docs.radxa.com).
These instructions apply to the whole repository unless a more specific
`AGENTS.md` overrides them.

## Repository boundary

- This is a content-only repository. The Docusaurus application and UI live in
  the separate `radxa-docs/docs-template` repository and are combined with this
  repository in CI.
- Chinese content lives in `docs/`.
- English content lives in
  `i18n/en/docusaurus-plugin-content-docs/current/`.
- `docs/linkr` and its English counterpart are independent Git submodules.
  Initialize submodules recursively before treating the local checkout as a
  complete documentation corpus.
- `static/agent/products.json` is a generated, non-exhaustive navigation index
  for linked cards in the Home catalog. It is not a source for specifications
  or claims, and absence from the index does not mean documentation is absent.

## Reading product information

1. Try to locate the exact model in `static/agent/products.json`.
2. If it is absent, search `https://docs.radxa.com/sitemap.xml` for the exact
   model or route, then search `docs/` and the English content tree. Do not
   infer that a product has no documentation merely because it is absent from
   the Home catalog.
3. Open the matching language entry in `source_entries`, or the source file
   found by the fallback search.
4. Read the product directory for the requested topic; do not stop at a short
   `README.md` that only renders document cards.
5. Read front matter before extracting facts. For `doc_kind: wrapper`, follow
   `imports_resolve_to` and extract the actual content from the referenced
   source files.
6. Prefer product-specific content over `common/` procedures when making a
   claim about supported hardware, interfaces, operating systems, or images.
7. Treat `docs/template/`, partials, and navigation metadata as templates or
   assembly inputs, not product evidence.
8. Keep Chinese and English sources separate when they disagree, cite the
   repository path used, and flag conflicts or stale-looking information.

The detailed wrapper and partial rules are in
`.github/agent-reading-guide.md`.

## Editing documentation

Before editing, read:

1. `AGENT-DOC-SPEC.md`
2. `.github/agent-reading-guide.md`
3. `.github/terminology.md`
4. `.github/copilot-instructions.md`

Then:

- Check `git status` and preserve unrelated work.
- Update Chinese and English counterparts together when the information is
  shared.
- Keep public claims source-backed; never turn a shared platform capability or
  an inference into a product guarantee.
- Do not edit `static/agent/products.json` by hand. Update `docs/Home.md` and
  its English counterpart, then run the generator.
- Do not change navigation, slugs, React components, styles, or the external
  template when the task only concerns Agent discoverability.

## Validation

Use the narrowest checks that cover the change:

```bash
python3 scripts/generate-agent-product-index.py --check
./scripts/agent-doc-drift-guard.sh
./scripts/agent-doc-translation-guard.sh
git diff --check
```

For changed page documents, also run:

```bash
./scripts/agent-doc-lint.sh <changed-doc-files...>
```

Run pre-commit on the changed files when available. A full site build requires
the separate Docusaurus template and remains the final check for changes that
can affect rendered pages.
