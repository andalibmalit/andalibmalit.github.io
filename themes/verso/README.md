# verso

A quiet, text-centric Hugo theme for a small personal site: Home, Research,
and (when enabled) Writing plus a post layout. One serif (Rasa), one mono
(IBM Plex Mono), a handful of hairlines, dark by default with a light toggle.
All hierarchy comes from type and space; no boxes, shadows, icons, or animation.

Requires Hugo **extended** ≥ 0.146.0 (Hugo Pipes: minify, fingerprint, image
resize). Fonts are self-hosted in `static/fonts/`; the frontispiece is resized
from `static/images/me.jpg` via a module mount (see below).

## Favicon
The ☉ mark from the design handoff: an ink ring and an ochre dot on the paper
colour, in the site's own oklch tokens. `static/favicon-dark.svg` is the default;
`static/favicon-light.svg` takes over when the OS prefers light (a `media`
attribute on the second `<link rel="icon">`). It follows the OS scheme, not the
site's `data-theme`, because browsers don't expose that to favicons.
`static/apple-touch-icon.png` (180px, dark) is for iOS. The files are copied
verbatim from `design/handoff/`, content-credentials metadata included.

## Theme switch
The nav's right-aligned button flips the theme (`data-theme` on `<html>`,
remembered in `localStorage`). Its label shows what a click does next, so it
reads the *opposite* of the current theme: `here comes the sun` while dark is
showing, `bravo six, going dark` while light is showing. Both strings live in
`layouts/partials/nav.html`; each carries a visually hidden clarification
("(switch to light theme)" / "(switch to dark theme)") so the accessible name
still says what the button does (WCAG 2.5.3 Label in Name).

## Content schema

### `content/_index.md` (Home)
```toml
title = "Andalib Samandari"
description = "One-sentence site description."
[[news]]
outlet = "TechCrunch"
title  = "Headline of the piece"
url    = "https://…"
# …more news items
```
Body: the bio paragraphs (Markdown). The Home "Selected" list is **derived**
from `content/research/` entries with `tier = "selected"` — do not hand-write it.

### `content/research/_index.md`
```yaml
title: Research
description: "…"
outputs: [html]              # section: HTML only, no RSS
cascade:
  - build:
      render: never          # entries are listed, never rendered as their own page
      list: local
    target:
      kind: page             # apply the cascade only to the entries, not this page
```
The `target: {kind: page}` matters: without it the cascade also applies to the
Research list page itself (`kind: section`), so `render: never` would hide the
Research page too.

### `content/research/<slug>.md`
```yaml
title: "Full title (shown as the entry heading)"
linkTitle: "Short title"     # optional; used by the Home "Selected" list
year: 2025                    # positive integer; sorts descending
status: published            # proposal | in-progress | published
tier: selected               # selected | list
weight: 1                    # ties within a year sort by weight ascending
summary: "One line."         # list tier; shown in the "Earlier work" list
draft: true                  # optional; hidden in production, shown under `hugo server -D`
links:
  - { label: "Benchmark website", url: "https://…" }   # say what the thing is, not the domain
```
- **selected** entries: the body (one or more paragraphs) is rendered inline on
  Research.
- **list** entries: the one-line `summary` is shown. The body is optional and is
  **not** rendered for the list tier; keep it if you like, so the entry can later
  be promoted to `selected` without rewriting.

Entry anchors (`#slug`) come from the filename.

## The four design knobs
Set under `[params.design]` in `config.toml`; they are emitted as custom
properties on the `.site` wrapper, so the whole page rescales without touching CSS:

| param     | property        | default      | effect                                  |
|-----------|-----------------|--------------|-----------------------------------------|
| `measure` | `--measure`     | `62ch`       | text column width (try `58ch`)          |
| `body`    | `--body`        | `1.1875rem`  | base body font size                     |
| `sp`      | `--sp`          | `1`          | spacing-scale multiplier                |
| `accentH` | `--accent-h`    | `78`         | accent hue (ochre); retints prose links |

The accent is declared on `.site` (not `:root`) precisely so an `--accent-h`
override on the wrapper actually recolours links.

The defaults above are the stylesheet's own. Any CSS value works: this site sets
`body` to a `clamp()` so type grows from 19px on phones to 22px on wide screens.
The column is measured in `ch`, so it widens with the type and line length holds.

## Layout by width
One column everywhere, centred from 720px up. Three things happen only on wide
screens (1100px and up), all in one media query next to `h2.label` in `site.css`:
- Section labels (`SELECTED`, `NEWS`, `EARLIER WORK`, `POSTS`) hang in the left
  margin, level with the first metadata line of their section, at regular weight.
- A page whose main area opens with a labelled section (Research) gets a hairline
  under the title, so a hung label always sits beneath a rule.
- The text column itself does not move or change width.

On phones the theme switch wraps onto its own right-aligned row under the nav; at
350px and below the nav tightens slightly so its first row never breaks.

## Enabling the Writing page later
Writing is off at launch (the `writing` menu item points at Substack). To turn
it on:
1. Create `content/writing/_index.md` with `title = "Writing"` and the two-line
   note as the body (link Substack in it).
2. Add posts under `content/writing/` (see `archetypes/writing.md`). Each post
   supports `summary`, `standfirst`, `description`, footnotes, blockquotes, and
   images (rendered as `<figure>`).
3. In `config.toml`, change the `writing` menu `url` from the Substack link to
   `"/writing/"`.

The Posts list, the RSS `<link>` in the head, and the `· RSS` footer link all
appear automatically once at least one non-draft post exists.
