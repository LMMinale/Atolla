# Atolla Site — Project Handoff

## Overview
A four-page website for the **Atolla Research Initiative**, a mesophotic reef research programme led by Dr Sarah Rowley. Built using the design framework of the Dr Rowley site (soniajrowley.com) — Archivo Narrow + Barlow fonts, black/white/teal `#0e7c7b` palette, 1px black bordered grids, sticky transparent-to-white nav.

**Repository:** https://github.com/LMMinale/Atolla  
**Local path:** `C:\Users\lucam\OneDrive\Documents\GitHub\atolla\`  
**GitHub Pages (if enabled):** https://lmminale.github.io/Atolla/

---

## File Structure

```
atolla/
├── index.html          — Home page
├── get-involved.html   — Dr Rowley expedition + ways to help
├── data.html           — Research dataset page
├── contact.html        — Contact form + social links
└── images/
    ├── pohnpei.jpg
    ├── Timor leste.jpg
    ├── 4_Sonia_Pakin_2015.jpg
    ├── Edges of Earth_Adam Moore_Hawaii_Oahu_Sonia J. Rowley_Dive-6401_USE.jpg
    ├── Edges of Earth_Marla Tomorug_Hawaii_Oahu_Sonia J. Rowley_Dive-4731_USE.jpg
    ├── gorgonian-mesophotic-primnoidae-soniajrowley-sjrllc-deep-75m-indonesia-lombok-rebreather-ccr.jpg
    └── gorgonian-mesophotic-biodiversity-turbo-soniajrowley-sjrllc-60m-tangga-indonesia-lombok-rebreather-ccr.jpg
```

Source images are also at:
`C:\Users\lucam\OneDrive\Desktop\Dr Rowley Project CC\Dr Rowley Site\images\`

---

## Pages

### index.html — Home
- Transparent nav → white on scroll, hamburger on mobile
- Full-height hero (`pohnpei.jpg`)
- Dark expedition section: two accordion tabs (Pacific Deep Survey / Monterey Bay Series) with image panels
- Tabbed Research & Engagement section (Areas of Research / Engagement)
- About section with stats grid and credentials list
- Newsletter split section (left: social links | right: email subscribe over gorgonian image)
- Black footer

### get-involved.html — Get Involved
- Hero (`Edges of Earth_Adam Moore` dive shot)
- Dr Rowley bio with portrait (`4_Sonia_Pakin_2015.jpg`) and award boxes
- Expedition timeline: 5 entries (2024 inaugural → 2026 open data)
- Three-column "Get Involved" section (Citizen Science / Fund a Dive / Research Partnership)
- Black footer

### data.html — The Data
- Hero (gorgonian biodiversity shot)
- Four headline stats (200m depth, specimens, CCR dives, new species)
- Dark depth-band bar chart (30m–200m mesophotic range)
- Five dataset category rows (Imagery / eDNA / Specimens / Transects / Oceanographic)
- Three-tab methods section (Collection / Processing / Access & Licence)
- Open data split section with four dataset cards
- Black footer

### contact.html — Contact
- Shorter hero (`Edges of Earth_Marla Tomorug` dive shot)
- Two-column layout: bordered contact form (left) | email, lead researcher info (right)
- Form fields: Name, Email, Type of Enquiry (dropdown), Message
- Enquiry type options: Research & Collaboration / Media & Press / Citizen Science / Get Involved / General
- "Follow the Research" social links band above footer
- Black footer

---

## Design System

| Token | Value |
|---|---|
| Font — headings | Archivo Narrow 700 |
| Font — body | Barlow 300/400/500 |
| Colour — black | `#000000` |
| Colour — white | `#ffffff` |
| Colour — teal (accent) | `#0e7c7b` |
| Colour — light grey section | `#f5f5f5` |
| Container max-width | 1100px, padding 0 40px |
| Nav height | 64px |
| Section padding | 7rem 0 |
| Border style | 1px solid #000000 |

Responsive breakpoints: 900px (tablet — hamburger nav, stacked grids) and 480px (mobile).

---

## Key Facts (Verified)

- **Focus:** Mesophotic reef ecology, 30–200m depth range
- **Method:** CCR (closed-circuit rebreather) diving — no ROVs
- **Subject:** Gorgonian octocoral taxonomy, new species discovery
- **Lead:** Dr Sarah Rowley — Scripps Institution of Oceanography, SOEST University of Hawaii, NHM London, Smithsonian
- **Sites:** Pohnpei (12-year time-series), Timor-Leste, Indonesia (Lombok, Wakatobi)
- **No deep-sea bioluminescence** — this was removed in a fact-check pass

---

## Things Still To Do / Placeholders

- [ ] **Social media URLs** — all four social links on every page currently point to `#`. Replace with real URLs when available.
- [ ] **Contact email** — currently `contact@atolla.org`. Update to the real address.
- [ ] **Form backend** — the contact form shows a confirmation message client-side but does not actually send. Wire up to Formspree, Netlify Forms, or similar.
- [ ] **Newsletter form** — same as above, currently client-side only.
- [ ] **More expedition images** — portrait (`4_Sonia_Pakin_2015.jpg`) and hero images are placeholders from the Dr Rowley image library. Replace with Atolla-specific images when available.
- [ ] **Stats** — figures (312 specimens, 18 dives, etc.) are illustrative. Update with real data.
- [ ] **Dataset cards** — "atolla-expedition-*" dataset names are placeholders until data is released.
- [ ] **GitHub Pages** — to publish: repo Settings → Pages → Source: main → Save.

---

## Related Projects

| Project | Path | GitHub |
|---|---|---|
| Luca-Site (personal) | `C:\Users\lucam\OneDrive\Documents\GitHub\Luca-Site` | — |
| Dr Rowley (reference site) | `C:\Users\lucam\OneDrive\Documents\GitHub\Dr_Rowley` | — |
| Atolla (this project) | `C:\Users\lucam\OneDrive\Documents\GitHub\atolla` | https://github.com/LMMinale/Atolla |

---

## To Push Future Changes

```bash
cd "C:\Users\lucam\OneDrive\Documents\GitHub\atolla"
git add -A
git commit -m "Your message here"
git push
```
