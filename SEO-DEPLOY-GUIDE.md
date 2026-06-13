# Atolla SEO — Deploy Guide & Your To-Do List

This covers (1) what I already changed in the repo, (2) how to push it live safely, and
(3) the steps only you can do (logins, accounts, decisions).

---

## 1. What I already implemented (in this repo)

- **`robots.txt`** + **`sitemap.xml`** added at the repo root.
- **SEO `<head>` tags** added to every page (`index`, `get-involved`, `data`, `contact`, `privacy`):
  keyword-optimised titles, meta descriptions, canonical URLs, Open Graph + Twitter cards,
  favicon link, and `index,follow` robots tags.
- **Structured data (JSON-LD):** Organization + Person + WebSite on the homepage;
  a **Dataset** schema on `data.html` (makes it eligible for Google Dataset Search).
- **Social share image** `images/og-image.jpg` (1200×630) — built from your Lombok gorgonian photo.
- **Favicon** `images/favicon.png` + `images/apple-touch-icon.png`.
- **Name fix:** every "Dr Sarah Rowley" changed to **"Dr Sonia J. Rowley"** across all pages.
  *Please confirm this is correct* (your photo credits, image alt text, and "SJR LLC" all indicate
  Sonia J. Rowley is the lead researcher; "Sarah" appeared to be a placeholder). If wrong, tell me
  and I'll revert in seconds.

---

## 2. Push it live (Vercel auto-deploys from GitHub `main`)

> ⚠️ **IMPORTANT — OneDrive caveat.** Your repo is inside OneDrive, and one image
> (`images/Edges of Earth_Adam Moore_..._Dive-6401_USE.jpg`, the homepage hero background)
> is stored "online-only". Git therefore *thinks it was deleted*. **Do NOT run `git add -A` /
> `git commit -a`** — that would delete the hero image from your site. Use the targeted command below,
> OR first right-click the `atolla` folder in File Explorer → **"Always keep on this device"**, wait
> for it to finish downloading, then commit normally.

**Safe commit (stages only the intended changes):**

```bash
cd "C:\Users\lucam\OneDrive\Documents\GitHub\atolla"

git add index.html get-involved.html data.html contact.html privacy.html ^
        robots.txt sitemap.xml ^
        images/og-image.jpg images/favicon.png images/apple-touch-icon.png ^
        legals/

git commit -m "SEO: meta tags, sitemap, robots, structured data, OG image, name fix"
git push origin main
```

(If you're in PowerShell, replace the `^` line-continuations with a single long line, or use backticks `` ` ``.)

Vercel will redeploy within ~1 minute. Then verify these load in a browser:
- https://atolla.bio/robots.txt
- https://atolla.bio/sitemap.xml
- https://atolla.bio/images/og-image.jpg

---

## 3. Only you can do these (they need your logins / decisions)

### A. Google Search Console — the single most important step ⭐
Without this you stay invisible no matter what the code says.
1. Go to **https://search.google.com/search-console** → **Add property** → **URL prefix** →
   `https://atolla.bio/`.
2. Verify. Easiest options:
   - **HTML tag:** Google gives you a `<meta name="google-site-verification" ...>` tag —
     paste it into the `<head>` of `index.html` (right under the title), push, then click Verify.
     *(I can paste it in for you — just give me the tag.)*
   - or **DNS:** add the TXT record they give you at your domain registrar.
3. Left menu → **Sitemaps** → enter `sitemap.xml` → **Submit**.
4. Left menu → **URL Inspection** → paste each URL below → **Request Indexing**:
   `https://atolla.bio/`, `/get-involved.html`, `/data.html`, `/contact.html`, `/privacy.html`.

You should start appearing for "atolla research initiative" and "atolla.bio" within a few days.

### B. Bing Webmaster Tools (covers Bing + ChatGPT/Copilot search)
- **https://www.bing.com/webmasters** → add `atolla.bio` (you can import directly from Search Console)
  → submit `sitemap.xml`.

### C. Confirm the researcher's name
- If "Dr Sonia J. Rowley" is correct, you're done. If not, tell me the right name and I'll fix all pages + structured data.

### D. Create real social profiles (big trust signal for the brand)
- The structured data lists placeholder social URLs. Create the real accounts (Instagram, YouTube, X,
  LinkedIn, ResearchGate) and send me the real links — I'll drop them into the homepage `sameAs` array
  and wire up the footer/contact `#` links (currently all dead).

### E. (Optional, 2 min) Rename the spaced image filename
- `images/dr sonia rowley.jpg` has spaces (works, but not ideal). If you rename it to
  `dr-sonia-rowley.jpg`, also update the `src` in `get-involved.html`. Tell me and I'll do both.

---

## 4. The longer game — ranking for "mesophotic" terms

You can own brand long-tail ("Atolla Research Initiative", "Dr Sonia Rowley gorgonian") almost
immediately. The competitive niche terms ("mesophotic reef", "gorgonian coral") need depth + links:

1. **Add a "Field Notes" / Dispatches section** — each expedition update or new-species note is a new
   page targeting a specific search. This is the #1 lever for mesophotic visibility. *I can build the
   template + first few posts whenever you're ready.*
2. **Get backlinks** from your named partners (Scripps, NHM London, Smithsonian, MBARI) and from
   Dr Rowley's ResearchGate / Google Scholar / ORCID — all pointing to atolla.bio. A few authoritative
   links beat hundreds of weak ones for a new `.bio` domain.
3. **When you release the dataset,** mint a DOI (Zenodo) and submit eDNA to GBIF — both create
   citations and authoritative inbound links, and the Dataset schema gets you into Google Dataset Search.
4. **Consider a Wikidata entry** for the Initiative / Dr Rowley to disambiguate from "Atolla" the
   jellyfish and the skincare brand, and to feed Google's knowledge graph.

---

## Quick checklist

- [ ] Push the commit (use the safe command above — mind the OneDrive hero image).
- [ ] Confirm robots.txt, sitemap.xml, og-image.jpg load on the live site.
- [ ] Set up Google Search Console, submit sitemap, Request Indexing on all 5 URLs.
- [ ] Set up Bing Webmaster Tools, submit sitemap.
- [ ] Confirm the "Dr Sonia J. Rowley" name change.
- [ ] Create real social profiles → send me the links.
- [ ] (Later) Plan the Field Notes content section.
