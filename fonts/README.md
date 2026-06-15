# Self-hosted fonts

The site currently loads fonts from Google (`@import` of `fonts.googleapis.com`), which sends
every visitor's IP address to Google. A German court ruled this can breach GDPR, and it's an easy
thing to remove. These files let you serve the fonts from your own domain instead.

## One-time setup

**1. Download the font files** (couldn't be done automatically — Google's CDN is network-blocked
in the build environment). Pick either option:

- **Easy:** go to <https://gwfh.mranftl.com/fonts>, search **Archivo Narrow** (weights 400, 500,
  600, 700) and **Barlow** (weights 300, 400, 500), download woff2, and rename the files to match
  the names in `fonts.css` (e.g. `ArchivoNarrow-Regular.woff2`, `Barlow-Light.woff2`, …).
- **Scripted:** from the repo root run `bash fonts/fetch-fonts.sh` (needs `curl` + `unzip`; on
  Windows use Git Bash). It downloads and renames all 7 files for you.

After this, `fonts/` should contain: `ArchivoNarrow-Regular/Medium/SemiBold/Bold.woff2` and
`Barlow-Light/Regular/Medium.woff2`.

**2. Switch each page from Google Fonts to local.** In every HTML file
(`index, get-involved, data, contact, faq, privacy`), inside the `<style>` block, replace this line:

```css
@import url('https://fonts.googleapis.com/css2?family=Archivo+Narrow:wght@400;500;600;700&family=Barlow:wght@300;400;500&display=swap');
```

with:

```css
@import url('/fonts/fonts.css');
```

(or, slightly faster, add `<link rel="stylesheet" href="/fonts/fonts.css">` in each `<head>` and
delete the `@import` line entirely.)

**3. Tighten the security header.** Once Google Fonts is gone, edit `vercel.json` and remove
`https://fonts.googleapis.com` from `style-src` and `https://fonts.gstatic.com` from `font-src`,
leaving just `'self'`. That gives you a cleaner Content-Security-Policy.

That's it — fonts now load from `atolla.bio` only.
