# Atolla — Security & Legal Audit

_Prepared 13 June 2026. Scope: the static site in this repo (`index, get-involved, data, contact, faq, privacy`), hosted on Vercel, no backend._

---

## TL;DR

Atolla is a **static HTML site with no backend, no logins, no database, and no API keys**. That means most of a typical "security audit" (the kind the checklist prompt you found is written for) simply doesn't apply — there's no server code, auth flow, or stored data to attack. The real exposure for a site like this is narrow: **host-level headers, third-party calls (Google Fonts), accessibility/ADA risk, and the privacy policy matching reality.** I've fixed what can be fixed in-repo; the rest is flagged below with the few things only you can do.

**What I changed in this repo:**

- Added `vercel.json` with a full set of security headers (HSTS, CSP, X-Frame-Options, etc.).
- Added accessibility fixes across all 6 pages: a "Skip to content" link, visible keyboard-focus outlines, dialog semantics on the newsletter popup, and a label on the one unlabeled input.
- Added `fonts/` (CSS, a download script, and instructions) to move fonts off Google's CDN — you just run one command locally to pull the files (Google's CDN is blocked in my environment).

**What needs a decision from you:** the forms (they currently collect nothing) and the privacy-policy wording that describes them. See Priority 1.

---

## Reality check: that checklist vs. your site

The gist you linked is a prompt for auditing an application **with a backend** — it targets authentication, API endpoints, environment variables, insecure direct object references, rate limiting, and input validation. None of those exist in a static site:

| Checklist focus area | Applies to Atolla? |
|---|---|
| Exposed credentials / env vars | No — repo has zero secrets/keys (verified) |
| Authentication / authorization bypass | No — there is no auth |
| Insecure direct object references | No — no records/IDs to reference |
| Rate limiting | No — nothing to rate-limit (host handles abuse) |
| Input validation / injection | Minimal — forms don't reach a server |
| Data exposure | Minor — covered below |

So don't spend effort chasing vulnerabilities you structurally can't have. The list below is the version that actually fits your site.

---

## Priority 1 — Forms collect nothing, but the privacy policy says they do ⚠️

The contact form and both newsletter forms call `preventDefault()`, validate the input, and show a fake "You're in — welcome aboard" message. **Nothing is sent or stored anywhere.** Every signup and contact message is silently discarded.

Meanwhile `privacy.html` states in detail that you collect email addresses, names, and messages and "store them with our email service provider." Today that describes data handling that isn't happening.

This matters two ways: (1) you're losing every lead and message, and (2) a privacy policy should match what the site actually does. You chose "advise only" on the forms, so here are your two clean options — pick one and I'll implement it:

- **Make the forms work** — wire them to a free no-backend handler (Formspree, Web3Forms, or Vercel/Netlify forms). Adds real delivery + spam protection. If you do this, also add the handler's domain to `connect-src`/`form-action` in `vercel.json`.
- **Honest placeholder** — switch the forms to a `mailto:` link or a visible "coming soon," and soften the privacy policy's "What We Collect" section so it doesn't promise collection that isn't happening yet.

Either is quick. The current in-between state is the only thing here I'd call a genuine issue.

---

## Priority 2 — Security (mostly done)

- [x] **Security headers** — added in `vercel.json`: `Strict-Transport-Security` (HSTS), `Content-Security-Policy`, `X-Frame-Options: DENY`, `X-Content-Type-Options: nosniff`, `Referrer-Policy`, `Permissions-Policy`. These deploy automatically on your next Vercel push. The CSP currently allows `'unsafe-inline'` for scripts/styles because the site uses inline `<style>`/`<script>` everywhere — fine for a static site with no user-generated content; can be tightened later if you externalize them.
- [x] **HTTPS** — already enforced by Vercel.
- [ ] **Self-host fonts** — scaffolding added in `fonts/`. Run `bash fonts/fetch-fonts.sh` (or download manually per `fonts/README.md`), then swap the one `@import` line on each page. Removes the visitor-IP leak to Google. After that, trim the Google domains out of the CSP.
- [ ] **Stray reference** — `privacy.html` markup contains a link to `https://atollamarine.lovable.app/`. Confirm that's intentional; if it's a leftover from an earlier build, remove it.
- [ ] **Dependency note** — your security posture is effectively Vercel's. Keep the domain registrar and GitHub/Vercel accounts on strong unique passwords + 2FA; that's the most realistic attack surface for a site like this.

---

## Priority 3 — Accessibility / ADA

**Do you need "an ADA"?** There's no certificate or filing you obtain. ADA = the Americans with Disabilities Act (web accessibility). As a private US entity (SJR LLC) you fall under **Title III**, where there's no formal regulation yet, but courts widely treat websites as public accommodations and thousands of demand-letter lawsuits are filed each year — so it's **real risk, not a legal mandate.** The practical standard everyone targets is **WCAG 2.1 Level AA**. One flag: if Atolla ever takes US **federal funding** (plausible given Scripps/NHM partners), **Section 508** can attach, which also requires WCAG conformance.

**Fixed in this pass (all pages):**

- [x] "Skip to content" link for keyboard/screen-reader users.
- [x] Visible keyboard focus outlines (`:focus-visible`) — several inputs had `outline:none` with no replacement.
- [x] `role="dialog"`, `aria-modal`, and an accessible name on the newsletter popup.
- [x] `aria-label` on the previously unlabeled popup email input.
- [x] (Already present and good: `lang="en"`, the single `<img>` has alt text, contact form fields have `<label>`s, hamburger has `aria-expanded`.)

**Still worth doing (not done — needs visual judgment):**

- [ ] **Colour contrast** — light-grey text (`rgba(0,0,0,0.4–0.45)` on white ≈ 3.5:1) fails AA for normal-size text (needs 4.5:1). Used for nav "back" links, field labels, and meta captions. Darkening these to about `rgba(0,0,0,0.6)` fixes it. I left this alone because it's a visual change — say the word and I'll apply it.
- [ ] **`prefers-reduced-motion`** — add a media query to disable smooth-scroll and transitions for users who request reduced motion.
- [ ] **Tab panels** — the data-page tabs use `role="tab"` but the panels aren't linked with `role="tabpanel"`/`aria-controls`. Minor.
- [ ] Run the live site through Lighthouse (Chrome DevTools) or WAVE once deployed to catch anything visual.

---

## Legal checklist

- [x] **Privacy policy exists** and is well-written (controller named, GDPR legal basis stated, "no analytics/cookies yet" disclosed correctly).
- [ ] **Make the policy match the forms** — see Priority 1.
- [ ] **GDPR** — if EU/UK visitors can subscribe, your stated consent basis is correct; once fonts are self-hosted you remove the main passive data-transfer (Google Fonts). No cookie banner is needed *until* you add analytics — your policy already says this.
- [ ] **CAN-SPAM** — once the newsletter actually sends, every email needs a working unsubscribe + a physical mailing address. Your policy already promises one-click unsubscribe.
- [ ] **CCPA/CPRA (California)** — almost certainly does **not** apply (you're well under the revenue/data thresholds for a small research org). Revisit only if Atolla grows substantially.
- [ ] **Contact email consistency** — `privacy.html` uses `privacy@atolla.bio`; earlier project notes referenced `contact@atolla.org`. Make sure a single real, monitored address is shown site-wide and that the domain matches.
- [ ] **Content licensing** — you reference CC-BY 4.0 for data; confirm photo/image rights (several images are credited to third parties like "Edges of Earth / Adam Moore") are cleared for web use.
- [ ] **Terms of Use** (optional) — low priority for an informational site, but a short one limits liability around the dataset and citizen-science content.

---

## What only you can do

1. **Push to deploy** — the `vercel.json` and accessibility edits go live on your next push. Mind the OneDrive hero-image caveat from your deploy guide (don't `git add -A`; stage files explicitly).
2. **Download the fonts** — run `bash fonts/fetch-fonts.sh` locally (you have network access; my sandbox doesn't), then do the one-line swap per `fonts/README.md`.
3. **Decide the forms direction** (Priority 1) and tell me which — I'll implement it.
