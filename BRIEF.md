# PrettyFly Event Creations — Website Brief

Status: **structure locked, palette resolved against real photography.** Decisions below
agreed with Jason on 2026-10-25.

## Purpose

A brochure site that shows what PrettyFly does. Not e-commerce, not a booking system. The
job is to make a stranger believe PrettyFly will execute their event accurately and
professionally — which, per the [brand brief](../context/brand-brief.md), is the client's
real fear.

## Reference

**https://meetella.ca/2/** (Ella Events & Marketing, built on Readymag). Jason's note: the
reference is about *how they display the business*, not a palette to copy.

What's worth taking from it:
- Photography carries the design. Very little copy, no cards, no icons, no stat blocks.
- Oversized thin serif display type set over full-bleed imagery.
- Scroll-revealed photo collages with mixed sizes and orientations.
- A thin sticky nav in small letterspaced caps; an oversized wordmark in the footer.

Ella runs two parallel sub-brands (dark for corporate events, cream/sage for weddings)
across 14 pages. We are **not** copying that — see structure below.

## Name

**PrettyFly Event Creations.** This is the wordmark.

The Instagram profile title currently reads "Pretty Fly Creative Studio" — that's stale and
should not be used. Worth fixing on IG for consistency.

## Structure — five tabs

| Tab | Job |
|---|---|
| **Home** | Hero, what PrettyFly does, the three doors, trust band, contact CTA |
| **Weddings** | Ceremony and reception styling |
| **Corporate** | Business-client work — scale, reliability, logistics |
| **Celebrations** | Anniversaries, birthdays, showers, engagements |
| **Contact** | Email + Instagram. No phone number, no form. |

### The three doors

The central structural idea. Ella's Gallery is a dead end — you scroll photos and you're
done. Instead, Weddings, Corporate, and Celebrations appear on Home as three tall panels
that preview each world and link out. The photo depth lives on the three sub-pages.

This keeps the audiences separated all the way through the site rather than just as a
section label. A corporate client never scrolls past a birthday setup to find their own work.

### Deliberately not built

- **No Gallery tab.** The two sub-pages are the gallery, sorted by client intent.
- **No About tab.** The owner will not appear on camera, so an About page would be filler.
  The trust story runs instead as a band on Home carried by setup and team-at-work photos —
  professionalism shown, not claimed. Promotes to its own page later if she opts in.
- **No inquiry form.** Contact is email and Instagram only — no phone number. May be added
  later if they decide to push it; leave room for it without building it.

## Contact

- **Email:** prettyflycreativestudio@gmail.com
- **Instagram:** https://www.instagram.com/prettyflyeventcreations/
- No phone number by choice.

Note: the email reads "creativestudio" while the business is "Event Creations" — a third
spelling of the name alongside the IG profile title. Worth consolidating eventually, ideally
onto a domain address (hello@prettyflyeventcreations.com), since a site promising
professionalism shows a Gmail under a different name.

## Home layout

```
┌──────────────────────────────────────────────────────┐
│ PRETTYFLY         corporate   celebrations   contact │  thin sticky nav
├──────────────────────────────────────────────────────┤
│                                                      │
│          full-bleed reveal footage/photo             │  hero
│          oversized serif headline over it            │
│                                                      │
├──────────────────────────────────────────────────────┤
│   short statement of what PrettyFly does             │  3–4 lines, no more
├───────────────────────────┬──────────────────────────┤
│                           │                          │
│    CORPORATE EVENTS       │   PRIVATE CELEBRATIONS   │  the two doors
│    [photo]                │               [photo]    │
│    one line + link        │       one line + link    │
├───────────────────────────┴──────────────────────────┤
│   setup / team-at-work strip                         │  trust band
├──────────────────────────────────────────────────────┤
│   wordmark        socials            [ GET IN TOUCH ]│  footer
└──────────────────────────────────────────────────────┘
```

Both sub-pages share one skeleton: hero photo → what this covers → the work, large and
scroll-revealed → contact. Same bones, different photography and different tone of copy.

## Design direction

Jason's call on 2026-10-25, after the real photography landed: **go darker.** The site runs
on a dark field. The original white/gold/cream direction is superseded — see "Why it
flipped" below.

### The idea that keeps it from looking like every other decorator

White-gold-cream is the default palette for this entire industry, so it could never
differentiate on its own. The dark field does, and it is not an arbitrary mood choice — it
is what the work actually looks like: **the room with the lights down.**

The page field is a deep warm black; content blocks sit on it as raised panels. The page is
the dark room, the panels are the lit tables, and brass is the uplight. That's drawn from
PrettyFly's real material vocabulary — candlelit black-draped galas, uplit arches, evening
receptions. Gold still appears only as hairline rules and small-type ink, never as a fill,
gradient, or metallic effect; gold at small sizes reads expensive, gold at large sizes reads
cheap.

One **cream relief band** per page keeps the dark from going flat and carries the contact
CTA. It is the one place the lights come up.

### Why it flipped

The previous version of this brief flagged the risk directly: *"A light palette assumes the
work photographs bright. If PrettyFly's events are mostly evening, uplit, or dark-venue,
cream chrome will fight the images."* That is what the photo library turned out to be. The
flip is a brightness decision driven by evidence, not a change of brand hue — gold and cream
both survive as the accent and the type.

### Tokens

| Token | Hex | Role |
|---|---|---|
| Field | `#141110` | Deep warm black page background — the room |
| Plate | `#262019` | Raised panel sitting on the field — the lit table |
| Ink | `#F4EDE3` | Warm cream. Primary text. |
| Brass | `#C9A227` | Uplight gold — bright enough to hold on black. Hairlines, small caps. |
| Stone | `#A2958A` | Warm grey-taupe for secondary text and captions |

Deliberately avoiding `#D4AF37` — the default "gold" hex, which reads Vegas rather than
wedding.

### The relief band — same five roles, lights up

| Token | Hex | Role |
|---|---|---|
| Relief | `#EFE7D9` | Cream band background |
| Relief ink | `#2E2823` | Text on the band |
| Relief stone | `#6B6057` | Secondary text on the band |
| Relief brass | `#7E6019` | Gold has to darken on cream to stay legible |

Brass does **not** survive the inversion: `#C9A227` on cream is 1.97:1 and fails AA, which
is why the band gets its own darker gold. Every pair above was checked numerically rather
than by eye — that check also caught a pre-existing failure in the old light palette, where
Stone `#7A6E60` on cream was only 4.05:1.

### Type over photographs

The hero scrim is weighted to the bottom third where the headline sits, strongly enough that
cream type clears 4.5:1 **even against a pure-white pixel**. That makes hero legibility
independent of which photo goes in the slot, so swapping imagery can't silently break it.

### Type

**Bodoni Moda** (display) + **Jost** (body). A didone paired with a geometric sans — a
pairing with real history, and the didone hairlines rhyme with the gold rules. Bodoni's
thick/thin contrast at 100px+ reads as engraved stationery, which is the right register for
invitations and place settings.

| Role | Size | Notes |
|---|---|---|
| Hero display | 112px → 44px mobile | Bodoni Moda, line-height 0.95 |
| Section head | 64px | Bodoni Moda |
| Sub-head | 32px | Bodoni Moda |
| Body | 18px / 1.6 | Jost. Measure ~62 characters, never past 75. |
| Nav + small caps | 12px / +0.12em tracking | Jost |

Alternative if we want to sit closer to the reference: Italiana instead of Bodoni Moda.
Italiana only ships one weight, which limits the range.

### Motion

One orchestrated moment: the hero headline sets on load — a reveal, matching a room reveal.
No per-section fade-ups, no hover transitions on every photo. Motion elsewhere only when it
answers a click.

## Build

Plain static HTML and CSS — no framework, no build step. Opens by double-clicking
`index.html`, deploys by uploading the folder anywhere.

```
index.html          home
weddings.html       \
corporate.html       >  same skeleton, different work
celebrations.html   /
contact.html        email + Instagram
assets/css/site.css  the whole design system
assets/js/nav.js     mobile menu toggle, nothing else
images/              originals + built web slots
```

Every image on the site points at a slot in `images/`. The camera originals live in
`images/wedding/`, `images/corporate/`, and `images/celebrations/` and are never modified;
`images/build-web-images.sh` converts them into the web slots. To change a photo, edit the
MAP at the top of that script and re-run it — no markup changes.

The script also writes `images/slot-dimensions.txt` with every slot's final pixel size.
That file is the reference for the `width`/`height` in the markup: those two numbers are
what reserves the layout box before a photo arrives, so if they disagree with the file the
page jumps as it loads. Check the markup against that list after any rebuild.

## Deployment

Hosted free on Netlify, connected to a GitHub repo — a push to `main` publishes. The
originals and video (~487MB) are gitignored, so the published tree is about 20MB.

`netlify.toml` holds the config: images and CSS are cached for a year since their names
are stable, HTML revalidates every request so edits appear immediately, and a CSP limits
the page to its own assets plus Google Fonts. There is no build step.

Domain: **prettyflyevents.com** (and `.ca`, both confirmed available 2026-10-26). Note
that `prettyflyeventcreations.com` — the name matching the wordmark and the Instagram
handle — is already registered to someone else and does not resolve.

## Open

- **Name consolidation.** Three spellings in play — "PrettyFly Event Creations" (wordmark),
  "Pretty Fly Creative Studio" (IG profile title), and `prettyflycreativestudio@gmail.com`.
- **Services the photos don't cover.** Celebrations copy now matches the actual portfolio.
  If PrettyFly also does showers, engagements, or anniversaries, the page can claim them —
  but each claim needs a photo to stand on first.
- **Hero weight.** The four hero JPEGs run 0.9–1.9 MB and are the LCP element on every page.
  Worth revisiting once the site is live and there's a real measurement to improve on.
- **Resolved:** photography is in (35 slots built). Palette confirmed dark against it.
  Celebrations copy and alt text rewritten to match what the photos actually show.
