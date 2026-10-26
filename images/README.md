# Website images — where to drop what

**Drop camera originals into `wedding/`, `corporate/`, or `celebrations/`. Nothing else is
needed.** HEIC straight off a phone is fine — don't convert anything by hand.

`build-web-images.sh` turns the originals into the web slots the site reads. Originals are
never modified; the script only writes the slot files alongside them. To put a new photo on
the site:

1. Drop it in the matching originals folder.
2. Open `build-web-images.sh` and point the slot at it in the `MAP` at the top.
3. Run `./build-web-images.sh` from this folder.

No markup changes, ever. The script bakes in EXIF orientation, so phone shots land upright.

**If a photo comes out sideways**, its original is missing the orientation tag and the script
has nothing to correct. Add a fourth column to that `MAP` line with the clockwise degrees to
turn it: `hero/hero-celebrations.jpg|celebrations/IMG_6759.HEIC|3000|90`. Rotating a landscape
frame makes it portrait, so the long edge becomes the height — bump the size number up or the
photo ends up narrower than the others.

> Note: `wedding/` (originals) and `weddings/` (built slots) are different folders. The
> singular one is where you drop photos.

| Folder | What goes here | Notes |
|---|---|---|
| `brand/` | The master logo. `PRETTYFLY LOGO.png` is the supplied original — don't edit it. | The build script derives the web copies from it. A vector (SVG/AI/EPS) would still be worth having for print. |
| `hero/` | One wide shot per page: home, weddings, corporate, celebrations | The first thing anyone sees. Leave room around the subject — a headline sits over the lower left. |
| `weddings/` | `door.jpg` (portrait, the home-page panel) plus `wedding-01` … `-08` | |
| `corporate/` | `door.jpg` plus `corporate-01` … `-08` | Conferences, galas, launches, company parties |
| `celebrations/` | `door.jpg` plus `celebration-01` … `-08` | Anniversaries, birthdays, showers, engagements |
| `team/` | `team-01` … `-04` | Setup in progress, load-in, crew at work. Carries the trust band on the home page — doesn't need to be pretty, in-progress is the point. |

## About the logo

The supplied logo is black line art on transparent, which would be invisible on the site's
dark field, so `build-web-images.sh` derives recoloured copies:

- `brand/mark-cream.png` — the script + balloon in cream, used in the nav and the footer
- `brand/favicon-32.png` / `favicon-180.png` — the balloon alone on the dark field

The lockup's "EVENT CREATIONS" line is only 7% of its height, so at nav size it would render
about 3px tall. The site therefore uses the script mark as the image and sets the descriptor
underneath as live text — crisp at any size, and readable by screen readers.

Replacing `PRETTYFLY LOGO.png` and re-running the script updates everything. If the new
artwork has different proportions, the crop boxes near the bottom of the script need
adjusting.

## About cropping

The gallery enforces fixed shapes so rows stay flush, and crops to fill. Every shape used is
one a phone camera actually produces — **3:2, 4:3, 3:4** — so nothing gets squeezed into a
frame it was never shot for. There is no 2:1 slot, because there's no 2:1 source material.

Each page's layout follows its own photo set, so the shapes differ per page:

- **Weddings** and **Corporate**: `-01` wide 3:2, then `-02` `-03` `-04` as 3:4 portraits,
  then `-05`–`-08` as 4:3
- **Celebrations**: `-01` wide 3:2, then all 4:3 — that folder is almost entirely landscape,
  so forcing portraits there would have meant cropping the subject out
- every `door.jpg` is **3:4 portrait**

If a photo's important detail sits near an edge, it may get cut. Flag any that matter and
we'll adjust that slot's shape.

## What's most useful

- **Before/after pairs** of the same room are worth more than two unrelated pretty shots.
- **Detail close-ups** (table settings, florals, signage, lighting) — these fill the gaps between big shots and make a layout breathe.
- **Vertical shots** are fine and useful; the layout mixes orientations on purpose.
- **Highest resolution available.** Originals, not Instagram exports — IG re-compresses and crops.

## Flag on arrival

Anything where a client or guest's face is recognizable and we don't have permission to
publish — note it and we'll keep it out of the public site.
