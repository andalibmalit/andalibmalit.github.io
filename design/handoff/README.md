# Handoff: Personal site for Andalib Samandari (Hugo theme)

> Updating an existing build? Read `CHANGES.md` first; it lists only what changed since the last handoff.

> **This bundle is a snapshot** of the Claude Design export (last updated 2026-09-20), kept as delivered. The live site departs from it in a few deliberate ways; they are listed under "Departures from the handoff" at the end of this file. Where the two differ, the repo (`themes/verso/`, `content/`, `config.toml`) is the source of truth, and `themes/verso/README.md` documents the theme as built.

## Overview
A three-page, static, text-centric personal site: Home, Research, Writing (plus a post layout). The feel is a well-set book: quiet, warm, unhurried. No decoration; all hierarchy comes from type, space, and a few hairlines.

## About the design files
The HTML/CSS files in this bundle are **design references**. They show the exact intended markup, typography, spacing, and copy. The task is to recreate them as a **Hugo theme**: layouts/partials for nav, footer, entry lists, and the post page, with content in Markdown/front matter. `site.css` can be used nearly verbatim as the theme's single stylesheet; the tokens at the top of it are the design system.

## Fidelity
**High-fidelity.** Reproduce typography, colour, spacing, and markup structure exactly. All copy in the reference files is final and must be used verbatim (do not rewrite, expand, or add taglines/CTAs/microcopy).

## Files
- `site.css` — the one stylesheet. Tokens in `:root` at the top; one `@media (min-width: 720px)` breakpoint.
- `index.html` — Home
- `research.html` — Research
- `writing.html` — Writing (list; shown here with the one sample entry — see "Writing" below)
- `writing-sample-post.html` — post layout (placeholder body text)

## Design tokens (site.css `:root`)
Colour (oklch; keep as oklch, do not convert to hex — the accent hue is meant to be tweakable):
- `--paper: oklch(21% 0.012 80)` — warm charcoal page (dark is default; see below)
- `--ink: oklch(90% 0.016 92)` — paper-coloured text
- `--muted: oklch(68% 0.014 90)` — metadata, labels, nav, footer
- `--rule: oklch(34% 0.012 80)` — 1px hairlines
- `--accent-h: 78; --accent: oklch(76% 0.09 var(--accent-h))` — ochre, picked up from the wildflowers in the Rainier photo; links in prose only. The hue is shared by both themes; each theme sets its own lightness.
- `--ph-a / --ph-b` — placeholder stripe tones (only the post figure slot uses them)

**Dark is the default.** The `:root` tokens are the dark set: paper `oklch(21% 0.012 80)` (warm charcoal), ink `oklch(90% 0.016 92)`, muted `oklch(68% 0.014 90)`, rule `oklch(34% 0.012 80)`, accent `oklch(76% 0.09 var(--accent-h))`, frontispiece dimmed to `brightness(0.88)`. The light set (paper `oklch(96.5% 0.018 92)`, ink `oklch(18% 0.014 260)`, muted `oklch(46% 0.015 250)`, rule `oklch(82% 0.018 90)`, accent `oklch(40% 0.08 var(--accent-h))`) is applied by `data-theme="light"` on `<html>` (or `.site`), or by `data-theme="auto"` when the OS prefers light. Print always uses the light set on white. `color-scheme: dark light` on `html`. A plain-text **switch** sits at the right end of the nav line (`button.switch` inside `.nav`, pushed right with `margin-left: auto`, styled like the nav links: mono, muted, no underline; label reads the *other* mode, "light" when dark is showing). It sets `data-theme` on `<html>` and remembers the choice in `localStorage('theme')`; the reference HTML has the 6-line inline script. Put that script in `<head>` (before CSS paints) in the Hugo theme to avoid a flash.

Type:
- `--serif: 'Rasa', Georgia, serif` — everything except labels. Rasa (Rosetta Type, SIL OFL) has a true italic, old-style figures, and weights 300–700; the theme uses 400, 500, and italic 400.
- `--mono: 'IBM Plex Mono', ui-monospace, Menlo, monospace` — nav, footer, section labels, metadata
- `--body: 1.1875rem` (19px), `--lh: 1.5`, `--small: 0.78rem` (12.5px), `--title: 2.125rem` (34px; `2.5rem` ≥720px). Rem units so browser text-size settings work.
- `font-variant-numeric: oldstyle-nums` on body; metadata uses `tabular-nums`; `hanging-punctuation: first last` (Safari-only today, harmless elsewhere); `text-wrap: pretty`.
- Fonts: **self-host** Rasa (400, 500, italic 400) and IBM Plex Mono (400, 500, italic 400) as woff2 with `font-display: swap`; preload the two roman files. The reference files load them from Google Fonts only for convenience.

Spacing: `--sp` multiplier (default 1) × 8/16/24/36/48/72px → `--s1…--s6`. Page gutter `--pad: 24px` (48px ≥720px). Measure `--measure: 62ch` (≈72 characters in Rasa at 19px; drop to 58ch if paragraphs feel long).

**Where variables live matters.** `--accent`, `--s1…--s6`, `font-size`, `line-height`, and `font-family` are declared on `.site` (not `:root`) so that setting `--body`, `--sp`, `--accent-h`, or `--measure` on the wrapper overrides them. Keep that structure when porting.

Tweakable knobs (expose as Hugo params if useful): `--measure`, `--body`, `--sp`, `--accent-h`.

## Layout
- Single column, mobile first. `.page` is `max-width: var(--measure)`; on ≥720px it sits left with `margin-left: clamp(48px, 10vw, 180px)` (like a verso page), not centred.
- `.site` is a flex column with `min-height: 100vh`; footer is pushed to the bottom with `margin-top: auto`.
- Text is left-aligned, ragged right, `text-wrap: pretty`. Paragraph spacing (1em), no indents.
- Hairlines (`<hr class="rule">`) only between major sections and above the footer. No borders, boxes, shadows, icons, badges, gradients, rounded containers, or animation.

## Shared parts
**Nav** (`.nav`, every page): one line in mono, lowercase: `andalib samandari · research · writing`, with the theme switch ("light"/"dark") flush right on the same line. Links are muted, no underline; current page gets `aria-current="page"` and renders in ink. Separators are `<span class="sep" aria-hidden="true">·</span>`.

**Footer** (`footer.page`, every page): hairline, then one mono line: `CV · andalibmalit@gmail.com · GitHub · LinkedIn`. Muted, underlined. No copyright line. URLs for CV/GitHub/LinkedIn are still `#` in the reference.

**Section labels** (`h2.label`): mono, 12.5px, weight 500, uppercase, 0.1em tracking, muted.

**Metadata** (`.meta`): mono, 12.5px, muted, tabular figures. Format `YEAR · STATUS` (e.g. `2026 · Proposal`). Statuses are exactly: `Proposal`, `In progress`, `Published`.

**Entry order everywhere**: metadata line first, then title on its own line.

## Home (`index.html`)
1. Nav.
2. `.masthead`: `h1.title` "Andalib Samandari" (34/40px, weight 400).
   Then the **frontispiece**: `<img class="photo frontispiece" src="/images/me.jpg">` — the existing Rainier photo at `static/images/me.jpg` (do not copy a new one). Full measure width, `aspect-ratio: 5 / 4`, `object-fit: cover; object-position: 50% 62%` (keeps the peak in frame and the full face/chin), `margin-top: var(--s3)`. No radius, no border, no caption. Alt: "Andalib Samandari in a meadow below Mount Rainier".
3. `.prose`: five paragraphs (verbatim in the file). Two links: ARCTIC → https://arctic.gsu.edu/, HumaneBench → https://humanebench.ai.
4. Hairline. `Selected` label + `ul.list`: three items (Delusion mitigation · 2026 · Proposal; HumaneBench · 2025 · Published; Multiple imputation at HPC scale · 2025 · In progress), each `<span class="meta">` then `<a>` to the Research entry anchor. The first ("Delusion mitigation…", 2026 · Proposal) is a Hugo **draft** at launch — hide it; the layout was checked with two entries.
5. Hairline. `News` label + `ul.list`: four items, metadata = outlet, link = article title. Article URLs are `#` in the reference (still needed).

## Research (`research.html`)
1. Nav; `h1.title` "Research".
2. `Selected` label → `.entries` (gap `--s4`). Each `article.entry` (flex column, gap `--s1`): `.meta` (year · status), `h3.title-line` (body size, weight 500 — the only weight change on the site; no bold), `p.body`, then `p.link.meta` with one link, labelled by what it is ("Benchmark website", "Blog post"), in the same mono metadata style as the compact tier. Anchors: `#delusion` (draft, no link), `#humanebench` → https://humanebench.ai ("Benchmark website"), `#nibrs` (2025 · In progress) → https://arctic.gsu.edu/2026/02/18/filling-the-gaps-in-criminal-justice-data/ ("Blog post").
3. Hairline. `Earlier work` label → `.entries.compact` (gap `--s3`): five entries, newest first (Econometric pipelines 2026 · Published, `#econometrics`; TikTok causal inference 2024; firearm ABM 2023; RL/Microsoft 2022; predator–prey 2022), each `.meta`, `h3.title-line`, one-line `p.body`, then an optional **link line** `p.link.meta`: one or more links in the mono metadata style, separated by `<span class="sep" aria-hidden="true"> · </span>`, e.g. "Blog post · Slides · Video". Links, never embeds. Link labels say what the thing is, never the domain. Current link lines: Econometric pipelines → Paper (https://doi.org/10.2139/ssrn.6537038); RL/Microsoft → Blog post, Slides, Video; TikTok causal inference → Poster; firearm ABM → Poster; predator–prey → Slides (URLs in the file).
4. Space between entries is always greater than paragraph space.

## Writing (`writing.html`)
At launch there are **zero posts**. The page is: nav, `h1.title` "Writing", `.prose` with a two-line note (placeholder text in the file — replace with the author's copy) and a line linking Substack (https://andalib.substack.com). The `Posts` section (hairline, label, `.entries.compact`) renders only when there is at least one non-draft post; the reference shows it with the one sample entry. List entry = `.meta` year, `h3.title-line` with linked title, `p.body` one-liner.

## Post layout (`writing-sample-post.html`)
`.site.post`. Header: nav, then `.post-head`: `.meta` date, `h1.title` (max-width 18em), `p.standfirst` (muted, body size). Body `article.prose`: paragraphs at 1em gaps; `h2` at body size, weight 500, extra space above; `blockquote` indented `--s3`, roman, no border; figures full measure via `.ph.wide` (replace with `<figure>`); footnotes `.fn` at 0.85× body, muted, `ol` with decimal counter; a hairline before the notes. Nothing after the text but the footer. The body copy in the file is placeholder, not the author's.

## Interactions & behaviour
- Links: accent colour, 1px underline offset 3px at 55% opacity; hover → full-opacity underline. Nav/footer links inherit muted/ink instead.
- `a:focus-visible`: 2px ink outline, 3px offset. Keep it; the accent alone hides focus.
- Nav and footer links carry invisible padding (`padding: 8px 0; margin: -8px 0`) so tap targets are ≥44px tall without changing the look.
- No JS required. No animations. Responsive via the one breakpoint. Nothing to do for `prefers-reduced-motion`; keep it that way.

## Accessibility, metadata, print
- First focusable element on every page: a visually hidden **skip link** to `#main` (see the reference HTML `<body>`; style it however the theme prefers, it only needs to appear on focus).
- `<html lang="en">`; per-page `<title>` ("Research · Andalib Samandari" pattern) and a one-sentence meta description; Open Graph title/description (no image needed). Favicon: a plain "A" set in Rasa on the paper colour.
- Landmarks are already semantic: `header > nav`, `main#main`, `section[aria-labelledby]`, `article.entry`, `footer`. Heading order is h1 → h2 (labels) → h3 (entry titles); keep it.
- Contrast against the paper: ink ≈15:1, muted ≈6.5:1, accent ≈7:1. Don't lighten `--muted`.
- Typography hygiene from Markdown: curly quotes and apostrophes (Hugo's `smartypants` / Goldmark typographer on), no `<br>` or `&nbsp;` in prose, en-dashes for ranges (`1–2 hour`), spaced em-dashes as written.
- **Print** (`@media print` in site.css): white paper, nav/footer/placeholders hidden, external URLs printed after prose links, entries and quotes kept unbroken.
- RSS feed for Writing; link it from the footer only once a post exists. A 404 page in the same template: nav, one line of text, footer.

## Hugo mapping (suggested)
- `layouts/_default/baseof.html`: nav + footer partials, `site.css`.
- `layouts/index.html`: Home. Bio as page content; Selected and News as front-matter lists or data files.
- `layouts/research/list.html`: two tiers from front matter (`selected: true`, `year`, `status`, `link`, `image`).
- `layouts/writing/list.html`: note + Substack from page content; posts list only if `len (where .Pages "Draft" false) > 0`.
- `layouts/writing/single.html`: post layout.
- Statuses and the draft flag drive visibility; `draft: true` on the delusion-mitigation entry.

## Favicon
☉ mark: ink ring (stroke 5/64), ochre dot (r 6/64), on the paper colour. `favicon-dark.svg` and `favicon-light.svg` follow the OS scheme via the `media` attribute on the second `<link rel="icon">`; `apple-touch-icon.png` (180px, dark) for iOS. Tags in `<head>`, see any page in this bundle.

## Assets
Home frontispiece: `static/images/me.jpg` (already in the repo). No images on Research (decided: the frontispiece is the only image on the site). The post layout keeps a 16:9 figure slot (`.ph.wide`) for when a post needs one. Fonts: self-host Rasa and IBM Plex Mono (both SIL OFL; download from Google Fonts or the foundries).

## Screenshots
`screenshots/` holds desktop captures of each page at 2×: `home.png`, `research.png`, `writing.png` (with the sample entry visible), `writing-post.png`. These are the visual target; the HTML files are the structural one.

## Departures from the handoff
Added after the build (site live 2026-09-20). Everything above this section describes the design as exported; this section lists where the built site differs and why. The HTML, CSS, and screenshots in this folder were left as delivered, so they show the design before these changes. The screenshots are gitignored and local only.

Before any of these changes, the built Home, Research, and Writing pages matched the reference renders at 390px and 1440px in both themes: identical page heights and per-element geometry.

### Layout
- **Centred column.** The handoff sets `.page` to the left with `margin-left: clamp(48px, 10vw, 180px)`. The site centres it from 720px up. Reason: on a wide desktop screen the left-set column read as off to one side.
- **Fluid body size, wider measure.** `--body` is `clamp(1.1875rem, 0.95rem + 0.45vw, 1.375rem)` (19px on phones to 22px on wide screens) and `--measure` is `66ch`, both set from `config.toml`. Reason: use more of a desktop screen without longer lines. The column is measured in `ch`, so it widens with the type and line length holds near 78 characters.
- **Hanging section labels.** From 1100px up, `h2.label` (SELECTED, NEWS, EARLIER WORK, POSTS) sits in the left margin, right-aligned, level with the first `.meta` line of its section, at weight 400 rather than 500. Below 1100px the labels stack above their lists as designed. Reason: marginalia use the wide margin without touching the text column; in the margin the position does the heading's work, so the label can be quieter.
- **Header band on Research.** At every width, a page whose `main` opens with a labelled section gets a hairline under the title, with the same spacing as `.rule`. Reason: a hung label 36px under the `h1` competed with it; now every label sits beneath a rule, as on Home, and phone and desktop agree.
- **Narrow nav.** The switch label is long (see Copy), so at 600px and below it takes its own right-aligned line under the nav (`flex-basis: 100%`, a `--s1` gap above) rather than wrapping where it happens to fall. At 350px and below, `.nav` tightens to `gap: 0 6px; font-size: 0.72rem` so `andalib samandari · research · writing` never breaks across rows. The handoff nav needs about 342px on one line and was only checked at 390px.

### Type
- **Entry titles and post headings are Rasa 600**, not 500. Reason: 500 read too close to the 400 body text, especially light-on-dark. The 500 font files were swapped for 600, so the payload is unchanged. The mono 500 labels are unchanged.

### Copy
- **Theme switch labels** read `here comes the sun` (while dark is showing) and `bravo six, going dark` (while light is showing), not `light` / `dark`. Each carries a visually hidden clarification, "(switch to light theme)" / "(switch to dark theme)", so the accessible name contains the visible text and still says what the button does.
- **HumaneBench.** The entry title is "HumaneBench: measuring robustness of humane behavior in LLMs" (the same string is the Home link title), and the paragraph was rewritten using only what humanebench.ai states publicly. The Home bio sentence now ends "an adversarial persona-based evaluation of whether 15 frontier models keep behaving humanely under pressure." The reference files still carry the earlier wording.
- **RL/Microsoft "Slides" link** points to a GitHub-hosted PDF; the Drive link in `research.html` returned 404.
- **Writing at launch.** There is no Writing page; the nav's `writing` item links to Substack. The list and post layouts exist and switch on when `content/writing/` is added.

### CSS structure
- **`--accent` lives on `.site`.** "Where variables live matters" above says so, but `site.css` as exported declares it on `:root`, where `var(--accent-h)` resolves before a wrapper override, so the `--accent-h` knob had no effect. The theme declares `--accent` on `.site`, with the light, auto, and print variants scoped the same way.
- **`color-scheme` follows `data-theme`**, not the OS: `dark` by default, `light` under `[data-theme="light"]`, and the static `<meta name="color-scheme">` was dropped. Reason: a light-OS visitor on the dark site otherwise gets light scrollbars and form controls.
- **Theme script in `<head>`** sets `data-theme` before the stylesheet loads, as this README asks. `<html>` ships without a static `data-theme`, the switch label is toggled by CSS rather than `textContent`, and the button is hidden when JavaScript never ran.
- **Skip link** is a `.skip` class that appears on `:focus`; the reference's inline `onfocus`/`onblur` handlers were dropped so the theme script is the only JavaScript.
- **Rendered Markdown.** Lists inside `.prose` get their markers back (the global reset removes them); multi-paragraph list items and blockquotes get 1em gaps; Goldmark's `.footnotes` block is styled like `.fn`, with the 1em gap its nested `<hr>` would otherwise lose; block images render as `<figure>`.
- **Selected entry bodies** render as `div.body` wrapping the Markdown's own `<p>`, not `p.body`, so a body with more than one paragraph stays valid HTML. One paragraph looks the same.
- **Print.** The frontispiece dimming is removed and the skip link hidden.

### Assets
- **Frontispiece** is served as resized derivatives (600w, 1200w, 1600w via `srcset`) rather than the 1714×2167 original. The CSS crop and `object-position` are as designed. In the dark theme it is dimmed to `brightness(0.92)` rather than `0.88`.
- **Fonts** are self-hosted from the `@fontsource` packages, latin and latin-ext subsets with `unicode-range`; the two 400 romans are preloaded.
- **Favicon** has this bundle's geometry, but the two SVGs use hex equivalents of the oklch tokens (dark `#1b1812` / `#e2ded2` / `#d1aa6e`, light `#f8f3e6` / `#0e1218` / `#5f4106`) because older Safari can't parse `oklch()` in SVG, and they drop the content-credentials block, which no longer matches an edited file. `apple-touch-icon.png` is copied as delivered. There is no `.ico` or PNG fallback.

### Not in the handoff, added for the site
- `/resume/` redirects to Home (the old site had a Resume page).
- A bad `status`, `tier`, or `year` in a research entry fails the build.
- Per-entry research pages are not rendered; entries exist only on the list page, each with an anchor from its filename.
