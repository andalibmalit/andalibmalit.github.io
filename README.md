# Andalib Samandari's Personal Website

Personal website built with Hugo and deployed to GitHub Pages.

## Prerequisites

- [Hugo](https://gohugo.io/installation/) (v0.137.1 or later)
- Git

## Local Development

### Preview Changes Locally

```bash
hugo server -D
```

Visit http://localhost:1313 to see your site.

## Editing Content

### Homepage
Edit `content/_index.md`

### Research Page
Edit `content/research.md`
- Add images to `static/images/research/`

### Resume Page
Edit `content/resume.md`

### Site Configuration
Edit `config.toml` for:
- Site title and base URL
- Navigation menu
- Footer and contact info

### Adding Images
Place images in `static/images/` - they'll be available at `/images/` on your site.

## Deploying

The site auto-deploys via GitHub Actions when you push to `main`:

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

GitHub Actions will:
1. Build your Hugo site
2. Deploy to GitHub Pages automatically

Monitor deployment: https://github.com/andalibmalit/andalibmalit.github.io/actions

## Directory Structure

```
.
├── content/          # Page content (Markdown)
├── static/           # Static files (images, etc.)
│   └── images/       # Image files
├── themes/           # Hugo theme (hugo-classic)
├── config.toml       # Site configuration
└── .github/          # GitHub Actions workflow
    └── workflows/
        └── hugo.yml  # Auto-deployment config
```

## Important Notes

- **Don't edit `public/`** - it's generated automatically
- **Hugo version**: Workflow uses Hugo 0.137.1 (see `.github/workflows/hugo.yml`)
- **Theme**: Uses hugo-classic theme (git submodule)

## Troubleshooting

### Site not updating after push?
Check the GitHub Actions workflow: https://github.com/andalibmalit/andalibmalit.github.io/actions

### Local preview not working?
Make sure Hugo is installed and theme submodule is initialized:
```bash
git submodule update --init --recursive
```
