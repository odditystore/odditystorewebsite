# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Official website for **不现实商店 / Oddity Store** — a narrative design brand that turns literature, fantasy, and archival aesthetics into collectible desktop objects (keycaps, keyboards, desk mats, cups, cases). The site is product-led with strong brand framing, targeting overseas buyers.

## Architecture

**Static HTML site** — no build system, no frameworks, no JS bundles. All pages are standalone `.html` files with inline `<style>` blocks. No CSS or JS files exist.

### Directory Layout

```
/                    → English homepage (index.html)
/cn/                 → Chinese homepage
/keycaps/            → Keycaps collection (EN + CN)
/keyboards/          → Keyboards collection (EN + CN)
/deskmats/           → Desk mats collection (EN + CN)
/cups/               → Cups collection (EN + CN)
/about/              → About page (EN + CN)
/products/           → Individual product pages (120+ HTML files)
/policies/           → Shipping, returns, privacy, terms (EN + CN)
/admin/              → Internal tools (tracker, cost-tracker)
/assets/             → Product images organized by category/product-name
/logo/               → Brand logos
/docs/               → Project planning docs and content drafts
/docs/drafts/        → Video script drafts for social media content
```

### Bilingual Structure

Every user-facing page has an English version and a Chinese version (`cn.html` or `-cn.html` suffix). Product pages follow: `products/shakespeare.html` (EN) / `products/shakespeare-cn.html` (CN).

### Design System (inline CSS variables)

All pages use the same CSS custom properties defined in each file's `<style>` block:
- `--paper`, `--paper-soft`, `--paper-deep` — background tones
- `--ink`, `--muted` — text colors
- `--accent: #c0392b` — brand red
- `--mono` / `--serif` / `--sans` — all map to Special Elite / Courier Prime (typewriter aesthetic)

### Product Pages

Each product page is self-contained HTML with inline styles. Product images live in `/assets/{category}/{product-name}/`. Products span multiple series: Magic (魔法系列), Literary Realms (大文豪系列), World Mapping, Way of the Blade, etc.

## Content Strategy (docs/ and docs/drafts/)

The `docs/` directory also contains AZ's personal brand content strategy for the "AZ的不现实商店" social media accounts (Xiaohongshu, Douyin, Bilibili, WeChat Video). `docs/az-content-strategy.md` is the master context document. `docs/drafts/` contains finalized video scripts.

## Brand Voice

- English: archival, literary, slightly mysterious
- Chinese brand copy: `认真不现实` (Seriously Impractical)
- Do not use generic spy/classified language (`绝密`, `classified`, `秘密档案`)
- Product descriptions should evoke the narrative world, not list specs
