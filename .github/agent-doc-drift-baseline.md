# Agent Doc Drift Baseline

Snapshot date: 2026-08-27

## Summary

- `docs_only_count`: 0
- `i18n_only_count`: 10

## docs_only

Files that exist in `docs/` but are missing in `i18n/en/docusaurus-plugin-content-docs/current/`:

## i18n_only

Files that exist in `i18n/en/docusaurus-plugin-content-docs/current/` but are missing in `docs/`:

- `linkr/linkr/access-token.mdx`
- `linkr/linkr/advanced-usage/remote-access.mdx`
- `linkr/linkr/advanced-usage/wake-on-lan.mdx`
- `linkr/linkr/develop-guide.mdx`
- `linkr/linkr/firmware-update.mdx`
- `linkr/linkr/getting-started.mdx`
- `linkr/linkr/linkr-skills.mdx`
- `linkr/linkr/product-introduction.mdx`
- `linkr/linkr/two-factor-authentication.mdx`
- `linkr/linkr/usage.mdx`

## Update Method

Run:

```bash
./scripts/agent-doc-drift-report.sh
```

Then refresh this file from the script output.

This baseline is enforced by:

```bash
./scripts/agent-doc-drift-guard.sh
```
