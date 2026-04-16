---
source-url: https://github.com/asgard-ai-platform/skills
title: Asgard Skills Repository
fetched: 2026-04-16
---

# Asgard Skills Repository

## Overview

The **Asgard Skills** repository is an open-source knowledge base containing **263 coding agent skills** organized into 21 thematic categories. Each skill is an independent Markdown file (`SKILL.md`) adhering to Claude Agent Skills specifications, with some including pure Python scripts for deterministic calculations.

## Repository Structure

Skills are organized by prefix-based categories:

- **`grad-`** (87 skills): Graduate-level theoretical models (RBV, CAPM, SEM, DID)
- **`algo-`** (62 skills): Algorithms (PageRank, BM25, ARIMA, EOQ)
- **`biz-`** (22 skills): Business frameworks (SWOT, Porter's Five Forces, DCF)
- **`hum-`** (9 skills): Humanities and critical reasoning
- **`tw-`** (9 skills): Taiwan-specific knowledge
- Plus 13 additional categories covering economics, design, finance, and more

## Key Features

**Methodology**: Each skill follows a consistent structure: Overview/Framework → When to Use → Methodology → Iron Law (non-obvious constraint) → Output Format → Gotchas → Scripts (where applicable) → References.

**Deterministic Scripts**: Twenty skills include Python scripts handling calculations LLMs typically miscompute, covering finance, statistics, supply chain, ranking, and e-commerce domains.

**Design Principles**: Skills emphasize the gotchas and constraints agents overlook; reference materials live separately to keep core files concise; all verifiable examples are precisely calculable.

## Integration Purpose

This repository serves as the "ingredient library" for the Asgard AI Platform, combining with MCPs (Model Context Protocol servers) to create specialized coding agent plugins for specific scenarios (stock analysis, e-commerce operations, policy research).

## Licensing

MIT License—open for use and modification.
