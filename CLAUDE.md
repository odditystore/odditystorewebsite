# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## This repo hosts two disjoint workstreams

1. **Storefront** — the public website for 不现实商店 / Oddity Store (keycaps, keyboards, cups, deskmats, cases). Pure static HTML.
2. **Content strategy docs** — scripts, plans, project memory for AZ's Xiaohongshu/RED personal account `AZ的不现实商店` and brand account `不现实商店`. Lives entirely in `docs/` and `.claude/skills/`.

These overlap in brand/product context but don't share build artifacts. A task about one rarely needs files from the other.

## No build, no tests, no framework

Every page is hand-authored static HTML with inline `<style>` and no JS bundling. There is no `package.json`, no CI config, no test harness. Do not introduce one without being asked. To preview a page, open the `.html` file directly in a browser or serve the repo root (`python -m http.server` etc.).

Python files are gitignored — they're local one-shot generation tools, not part of the site.

## Bilingual pairing rule (hardest to notice, easiest to break)

Content pages are shipped as **EN/CN pairs**. The convention:

- `foo.html` — English
- `foo-cn.html` — Chinese
- Root homepage: `/index.html` (EN) and `/cn/index.html` (CN)

This applies to `products/*.html` (96 files, half English / half Chinese), `policies/*.html`, and the category index pages in `cups/`, `keyboards/`, `keycaps/`, `deskmats/`, `logo/`.

**Never mix Chinese and English in the same page.** When adding/editing a product, touch both files. When renaming, rename both. The `site-brief.md` explicitly calls this out.

## Risk-sensitive product naming

Many products reference literary/film IP (Shakespeare, Sherlock, Middle Earth, etc.). The site is overseas-facing. The brief (`docs/site-brief.md` §7, `site-architecture.md` §12) prescribes:

- Keep product spirit on detail pages
- Soften public collection names, hero banners, and navigation when IP exposure is obvious
- Don't introduce risky franchise wording in top-level navigation

Apply this awareness when writing new product copy or editing hero sections.

## Documents that are authoritative (read before big decisions)

- `docs/site-brief.md` — project goal, positioning, audience, naming strategy
- `docs/site-architecture.md` — navigation, homepage sections, catalog hierarchy
- `docs/project-memory.md` — accumulated site decisions (first-level nav, image ratios, brand voice rules, fixed yellow `#fff100`, etc.)
- `docs/homepage-blueprint.md` and `other-pages-plan.md` — detailed page plans
- `docs/az-content-strategy.md` — **AZ Xiaohongshu content operations**. Read the "一张纸 · AZ号核心定位" section at the top first; it supersedes older notes below it.

Existing decisions in these files take precedence over first-principles reasoning — if the brief says "不能中英混排", don't add a language toggle that mixes them.

## AZ content work has its own skill

Any work on AZ's Xiaohongshu scripts, video content, or posts (files under `docs/drafts/`, or questions about `AZ的不现实商店` / `不现实商店` accounts) auto-triggers the `az-content-review` skill at `.claude/skills/az-content-review/SKILL.md`.

The skill enforces an 8-pass critique (strategy → identity → three必问 → structure → tone → trust → facts → retention curve) and a strict fact-check against `docs/az-content-strategy.md`. Do not soften the critique to be polite — the skill is explicit: **锋利 > 礼貌, 诚实 > 讨好**.

Key rules baked into the skill that matter outside it too:
- `脚本 ≠ 笔记正文 ≠ 标题` — never copy a video script into the Xiaohongshu note body
- Any AZ personal detail (title, team size, company, numbers) must trace to `az-content-strategy.md` or be confirmed by AZ before use
- Information layered as 可公开 / 谨慎 / 暂不公开 / 未来再讲 — respect those tiers (e.g. brand account traffic ceiling is internal)

## Conventions when editing product pages

Each product page is self-contained HTML with its own `<style>` block — CSS variables repeat across files. When changing brand colors, fonts, or shared visual tokens, plan for touching many files; there is no shared stylesheet.

Default brand tokens seen across pages (examples, not authoritative — check the file you're editing):
- `--paper: #e8e4df`, `--ink: #1a1a1a`
- Highlight yellow is standardized to `#fff100` per project-memory.md
- Primary display font is `Special Elite` / `Courier Prime` typewriter stack

## Gitignore gotcha

`.claude/*` is ignored except `.claude/skills/**`. The AZ content review skill is version-controlled on purpose — other local Claude config is not. When adding new skills for this project, they go under `.claude/skills/` so they persist.
