<!-- source-url: https://github.com/az9713/claude-managed-agents -->
<!-- title: GitHub - az9713/claude-managed-agents: Comprehensive onboarding guide for Claude Managed Agents -->
<!-- fetched: 2026-04-20 -->
<!-- note: 因 fetch-url.sh 超時，改用 WebFetch 萃取 raw README -->

# Claude Managed Agents: Complete Overview

## Quick Start Summary

This repository provides a **30-line working agent** plus comprehensive tutorials. To get running:

1. Clone the repo and install Node CLI: `npm install -g @anthropic-ai/claude-code`
2. Set up Python venv and install dependencies via `install.sh`
3. Add your API key to `.env`
4. Run `python run.py` — the agent autonomously searches and summarizes papers within 30–90 seconds

**Typical cost:** $0.01–$0.05 per run on Claude Haiku 4.5.

## Five-Part Tutorial Structure

The `docs/` folder follows this progression:

| Part | Focus | Duration |
|------|-------|----------|
| 1 | Architecture and core concepts | ~15 min |
| 2 | Setup walkthrough of `run.py` | ~30 min |
| 3 | Agent loop mechanics and streaming | ~25 min |
| 4 | Tools, permissions, cost controls | ~25 min |
| 5 | Capstone research agent project | ~45 min |

**Total:** ~2.5 hours for complete fluency. Part 1 is the critical foundation explaining the mental model.

## Capstone Project: AI Research Digest Agent

The final tutorial describes a production-ready agent that:

- Scrapes arXiv daily for new papers
- Summarizes findings with sources
- Emails results automatically
- Costs approximately $3/year running on Haiku

This combines all prior concepts into "something actually useful" by managing state across multiple prompts and leveraging custom tools.

## Key Design Philosophy

The SDK delegates heavy lifting (agent loop, tool execution, context compaction) to the Claude Code CLI subprocess, keeping Python code minimal while exposing full economics through transparent cost reporting.
