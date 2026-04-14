# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Oddity Store (不现实商店) official website — a bilingual (EN/CN) static e-commerce site for mechanical keyboard keycaps, keyboards, desk mats, cups, and cases. The site targets overseas design-conscious keyboard enthusiasts and collectors.

## Tech Stack

- **Pure static HTML** — no framework, no build step, no package.json
- All CSS is inline within each HTML file using `<style>` tags
- Vanilla JavaScript only (carousels, mobile menu, scroll interactions)
- Google Fonts via CDN: Courier Prime, Special Elite, Playfair Display, Caveat, Libre Baskerville
- No deployment config — deploy as static files to any host

## Development

No build commands. To develop locally, serve the root directory with any static server:
```
python3 -m http.server 8000
```

## Architecture

### Routing (file-based)
- `/index.html` — English homepage
- `/cn/index.html` — Chinese homepage
- `/keycaps/`, `/keyboards/`, `/deskmats/`, `/cups/` — category pages (each has `index.html` + `cn.html`)
- `/products/{name}.html` and `/products/{name}-cn.html` — product detail pages (~98 files)
- `/support/` — keyboard manuals (GW-75, GW-100) and wood care guides
- `/policies/` — shipping, terms, privacy, quality, returns (EN + CN variants)
- `/about/` — brand story page
- `/admin/` — internal tracker tools (not public-facing)

### Language Strategy
EN and CN are **separate HTML files** — never mixed in one page. Chinese variants use `-cn.html` suffix or `cn.html` filename. Language switcher in header links between versions.

### Page Template Pattern
Every page is self-contained and follows this structure:
1. CSS variables in `:root` (`--paper`, `--ink`, `--accent`, `--shadow`, `--mark`)
2. Full CSS inline in `<style>`
3. `.shell` wrapper containing: notice bar → `<header>` with nav → `<main>` → `<footer>`
4. Inline `<script>` at bottom for interactivity

### Navigation
- Desktop: hover on category reveals dropdown panel with subcategories/series
- Mobile (breakpoint ~1040px): hamburger menu with expandable category levels
- Categories: Keycaps, Keyboards, Desk Mats, Cups, Cases
- Each category has sub-groups (e.g., Keycaps → Magic Series, Great Writer Series, World Entry)

### Assets
- `/assets/keycaps/`, `/assets/deskmats/`, `/assets/cups/`, `/assets/keyboards/` — product images organized by product name
- `/assets/community/` — user reviews and creator content
- `/assets/logo/` — brand logos
- SVG keyboard layout diagrams: `gw75-layout.svg`, `gw100-layout.svg`

## Key Rules

### Image Aspect Ratios (hard rules)
- Hero banners: 21:9 desktop, adaptive mobile
- Collection/series cards: **1:1 square only**
- Keycap square slots: use the cover image (封面图正方/01) from each series
- Community/media content: 3:4 vertical

### Visual Identity
- Archival/paper/typewriter aesthetic — not "mysterious classified" vibes
- Straight-edge design, minimal rounded corners
- Accent yellow: `#f5e642` (or `#fff100` per brand guide)
- Accent red: `#c0392b`
- Paper background: `#e8e4df` with SVG noise texture
- No "box inside box" nesting patterns

### Content Rules
- Product-first: homepage leads with products, brand story secondary
- Homepage section order: Hero → Featured → Collections → Categories → Community → What We Do → Footer
- "Browse by Category" section uses **text-only cards** (no images)
- "Collections" section uses **square image cards**

## Documentation

Project docs live in `/docs/`:
- `site-brief.md` — brand positioning and V1 strategy
- `site-architecture.md` — navigation and page hierarchy
- `homepage-blueprint.md` — homepage section specifications
- `other-pages-plan.md` — category/collection/product page plans
- `project-memory.md` — accumulated design decisions and rules (Chinese)
