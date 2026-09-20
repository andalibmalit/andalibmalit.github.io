# Changes since the last handoff

Scope for this pass: apply ONLY the items below to the existing Hugo theme. Everything else in the theme stands as built. `README.md` has been updated to match and remains the source of truth for the whole design; this file is the diff.

## 1. Research page: entry swap
- **Selected** is now: Delusion mitigation (2026 · Proposal, draft/hidden at launch) · HumaneBench (2025 · Published) · **Multiple imputation at HPC scale: missing offender demographics in a decade of NIBRS** (2025 · In progress). NIBRS paragraph and link are in `research.html` (`#nibrs`); copy them verbatim.
- **Earlier work** now starts with **Econometric pipelines at HPC scale** (2026 · Published) as a compact entry, one-liner + link. Order is newest first: 2026 econometrics, 2024 TikTok causal inference, 2023 firearm ABM, 2022 RL/Microsoft, 2022 predator–prey.
- Home → Selected list: third item is now "Multiple imputation at HPC scale" (2025 · In progress) linking to `/research/#nibrs`.

## 2. Research page: no images
- All 16:9 image placeholders removed from Research. The frontispiece on Home is the only image on the site. Keep the `.ph.wide` figure slot in the post layout only.

## 3. Research page: link lines
- Link text names the thing, never the domain: "Benchmark website" (HumaneBench), "Blog post" (NIBRS), "Paper" (econometrics), "Blog post · Slides · Video" (RL/Microsoft), "Poster" (TikTok, firearm ABM), "Slides" (predator–prey). URLs are in `research.html`.
- Selected-tier link lines use the same mono metadata style as the compact tier (`p.link.meta`).

## 4. Talks section
- Not shipping. If a Talks section exists in the theme, remove it.

## 5. Theme switch placement
- The light/dark switch is the last item in the **nav** line, flush right (`button.switch` inside `.nav`, `margin-left: auto`), styled as a nav link: mono, muted, no underline. Label shows the other mode ("light" when dark is showing). Not in the footer. Footer is exactly: CV · andalibmalit@gmail.com · GitHub · LinkedIn.

## 6. Favicon (new)
- Files: `favicon-dark.svg`, `favicon-light.svg`, `apple-touch-icon.png` (in this bundle; copy to `static/`).
- Head tags, in this order:
```html
<link rel="icon" href="/favicon-dark.svg" type="image/svg+xml">
<link rel="icon" href="/favicon-light.svg" type="image/svg+xml" media="(prefers-color-scheme: light)">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
```
- The mark is ☉: ink ring, ochre dot, on the paper colour. The SVG follows the OS scheme (not the site's `data-theme`; browsers don't expose that to favicons).

## Unchanged, for the avoidance of doubt
Type (Rasa + IBM Plex Mono, rem sizes), tokens, dark-default with `data-theme`, nav/footer copy, Home bio, Writing page and sample post, print styles, accessibility items.
