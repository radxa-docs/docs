---
title: Agent Doc Drift Baseline
sidebar_position: 1000
---

# Agent Doc Drift Baseline

## Summary

- `docs_only_count`: 3
- `i18n_only_count`: 1

## docs_only

Files that exist in `docs/` but are missing in `i18n/en/docusaurus-plugin-content-docs/current/`:

- `aicore/ax-m1/frigate-axera.md`
- `common/ai/_rknn_yolov8_multi_stream.mdx`
- `rock5/rock5b/app-development/ai/yolov8-multi-stream.md`

## i18n_only

Files that exist in `i18n/en/docusaurus-plugin-content-docs/current/` but are missing in `docs/`:

- `accessories/network/dual-2.5-router-hat/hardware-revision.md`

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

## Summary

- `docs_only_count`: 3
- `i18n_only_count`: 1

## docs_only

Files that exist in `docs/` but are missing in `i18n/en/docusaurus-plugin-content-docs/current/`:

- `aicore/ax-m1/frigate-axera.md`
- `common/ai/_rknn_yolov8_multi_stream.mdx`
- `rock5/rock5b/app-development/ai/yolov8-multi-stream.md`

## i18n_only

Files that exist in `i18n/en/docusaurus-plugin-content-docs/current/` but are missing in `docs/`:

- `accessories/network/dual-2.5-router-hat/hardware-revision.md`

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
