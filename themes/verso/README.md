# verso

A quiet, text-centric Hugo theme for a small personal site: Home, Research,
and (when enabled) Writing plus a post layout. One serif (Rasa), one mono
(IBM Plex Mono), a handful of hairlines, dark by default with a light toggle.
All hierarchy comes from type and space; no boxes, shadows, icons, or animation.

Requires Hugo **extended** ≥ 0.146.0 (Hugo Pipes: minify, fingerprint, image
resize). Fonts are self-hosted in `static/fonts/`; the frontispiece is resized
from `static/images/me.jpg` via a module mount (see below).

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
```toml
title = "Research"
description = "…"
[outputs]
  home = ["html"]          # section: HTML only, no per-entry pages, no RSS
[cascade]
  [cascade.build]
    render = "never"        # entries are listed, never rendered as their own page
    list = "local"
```

### `content/research/<slug>.md`
```toml
title = "Full title (shown as the entry heading)"
linkTitle = "Short title"   # selected tier only; used in the Home Selected list
year = 2025                  # integer; sorts descending
status = "published"         # proposal | in-progress | published
tier = "selected"            # selected | list
weight = 1                   # ties within a year sort by weight ascending
summary = "One line."        # list tier only
draft = true                 # optional; hidden in production, shown under `hugo server -D`
[[links]]
label = "Benchmark website"  # say what the thing is, not the domain
url = "https://…"
```
- **selected** entries: the body is one paragraph, rendered inline on Research.
- **list** entries: leave the body empty; the one-line `summary` is shown.
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
