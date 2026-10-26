#!/bin/bash
# Converts the camera originals into the web slots the site reads.
# Originals are never modified — this only writes the slot filenames alongside them.
# Re-run after dropping in new photos and changing the MAP below.
set -u
cd "$(dirname "$0")"

# slot|source|longest-edge|rotate (rotate is optional, clockwise degrees)
# Most phone shots carry an EXIF orientation tag and sips bakes it in on its own. A few
# don't — those come out sideways and need the rotation stated here.
MAP="
hero/hero-home.jpg|wedding/IMG_5603.HEIC|2600
hero/hero-weddings.jpg|wedding/IMG_5991.HEIC|2600
hero/hero-corporate.jpg|corporate/IMG_6266.HEIC|2600
hero/hero-celebrations.jpg|celebrations/IMG_6759.HEIC|3000|90

weddings/door.jpg|wedding/IMG_6005.HEIC|1600
weddings/wedding-01.jpg|wedding/IMG_5643.HEIC|2200
weddings/wedding-02.jpg|wedding/IMG_2541.HEIC|1600
weddings/wedding-03.jpg|wedding/IMG_4971.HEIC|1600
weddings/wedding-04.jpg|wedding/IMG_4935.HEIC|1600
weddings/wedding-05.jpg|wedding/IMG_5639.HEIC|2000
weddings/wedding-06.jpg|wedding/IMG_5632.HEIC|2200
weddings/wedding-07.jpg|wedding/IMG_5691.HEIC|2000
weddings/wedding-08.jpg|wedding/IMG_5604.HEIC|2000

corporate/door.jpg|corporate/IMG_8563.HEIC|1600
corporate/corporate-01.jpg|corporate/IMG_6252.HEIC|2200
corporate/corporate-02.jpg|corporate/IMG_4917.HEIC|1600
corporate/corporate-03.jpg|corporate/IMG_8568.HEIC|1600
corporate/corporate-04.jpg|corporate/IMG_2791.HEIC|1600
corporate/corporate-05.jpg|corporate/IMG_6323.PNG|2000
corporate/corporate-06.jpg|corporate/IMG_8904.HEIC|2200
corporate/corporate-07.jpg|corporate/IMG_3298.HEIC|2000
corporate/corporate-08.jpg|corporate/IMG_3380.HEIC|2000

celebrations/door.jpg|celebrations/IMG_8833.HEIC|1600
celebrations/celebration-01.jpg|celebrations/IMG_9164.HEIC|2200
celebrations/celebration-02.jpg|celebrations/IMG_0546.HEIC|1600
celebrations/celebration-03.jpg|celebrations/IMG_3354.HEIC|1600
celebrations/celebration-04.jpg|celebrations/IMG_5973.HEIC|1600
celebrations/celebration-05.jpg|celebrations/IMG_6783.HEIC|2000
celebrations/celebration-06.jpg|celebrations/IMG_8826.HEIC|2200
celebrations/celebration-07.jpg|celebrations/IMG_9003.HEIC|2000
celebrations/celebration-08.jpg|celebrations/IMG_9739.HEIC|2000

team/team-01.jpg|corporate/IMG_2986.HEIC|1800
team/team-02.jpg|corporate/IMG_2987.HEIC|1800
team/team-03.jpg|corporate/IMG_8581.HEIC|1800
team/team-04.jpg|corporate/IMG_8920.HEIC|1800
"

ok=0; miss=0
# Every slot's final dimensions get recorded here. The width/height in the markup has to
# match these or the browser reserves the wrong shape and the page shifts as photos land.
DIMS="slot-dimensions.txt"
: > "$DIMS"
while IFS='|' read -r slot src max rot; do
  [ -z "${slot// }" ] && continue
  if [ ! -f "$src" ]; then
    echo "  MISSING SOURCE  $src  (for $slot)"; miss=$((miss+1)); continue
  fi
  mkdir -p "$(dirname "$slot")"
  # Rotating turns a landscape frame portrait, so the long edge is then the height —
  # a rotated slot needs a larger number here to end up as wide as an unrotated one.
  # ${rot:+...} is left unquoted on purpose: it has to expand to two words, or none.
  if sips -s format jpeg -s formatOptions 82 ${rot:+--rotate "$rot"} -Z "$max" "$src" --out "$slot" >/dev/null 2>&1; then
    # sips leaves the source's EXIF orientation tag on its output, so a browser rotates
    # the picture again on top of whatever sips already did. That makes the file's stored
    # size disagree with its displayed size, and the width/height in the markup — which
    # is what reserves the layout box — then describes a shape the page never renders.
    # Settle it here: apply the tag to the pixels once, then drop it, so stored size and
    # displayed size are the same number and the markup can be trusted.
    python3 - "$slot" "${rot:-0}" >> "$DIMS" <<'PY'
import sys
from PIL import Image, ImageOps

path, rotated = sys.argv[1], sys.argv[2] != "0"
with Image.open(path) as im:
    tag = im.getexif().get(274, 1)
    if tag in (None, 1):
        # Nothing to reconcile — leave the file alone rather than re-encoding it.
        out = None
        w, h = im.size
    elif rotated:
        # sips turned the pixels AND stamped a tag describing the same turn, so honouring
        # it would rotate a second time. The pixels are right; the tag is the leftover.
        out = im.copy()
        w, h = out.size
    else:
        # sips copied the source's tag onto its output without baking it in. The tag is
        # the only thing recording which way is up, so apply it before discarding it.
        out = ImageOps.exif_transpose(im)
        w, h = out.size

if out is not None:
    # Re-encoding at the same quality sips used; exif=b"" drops the now-stale tag so the
    # stored size and the displayed size can never disagree again.
    out.save(path, "JPEG", quality=82, exif=b"")

print(f"{path} {w} {h}")
PY
    ok=$((ok+1))
  else
    echo "  FAILED  $src -> $slot"; miss=$((miss+1))
  fi
done <<< "$MAP"

echo "built $ok slots, $miss problems"
echo "  dimensions recorded in images/$DIMS"

# ---- brand mark ----
# The supplied logo is pure black on transparent, which is invisible on the dark field,
# so the web copies are recoloured. The lockup's "EVENT CREATIONS" line is only 7% of its
# height and turns to mush at nav size, so the site uses the script mark here and sets the
# descriptor as live text instead. The balloon alone becomes the favicon — it's the one
# part that still reads at 32px.
SRC="brand/PRETTYFLY LOGO.png"
if [ -f "$SRC" ]; then
  python3 - "$SRC" <<'PY'
import sys
from PIL import Image

src = Image.open(sys.argv[1]).convert("RGBA")
alpha = src.getchannel("A")

def tint(mask, hex_colour, pad=0):
    r, g, b = (int(hex_colour[i:i+2], 16) for i in (1, 3, 5))
    out = Image.new("RGBA", mask.size, (r, g, b, 0))
    out.putalpha(mask)
    if pad:
        big = Image.new("RGBA", (mask.width + pad*2, mask.height + pad*2), (r, g, b, 0))
        big.paste(out, (pad, pad)); out = big
    return out

def fit(img, h):
    return img.resize((round(img.width * h / img.height), h), Image.LANCZOS)

CREAM = "#F4EDE3"

# script + balloon, trimmed to its own ink
script = alpha.crop((171, 123, 1948, 856))
fit(tint(script, CREAM), 360).save("brand/mark-cream.png")

# balloon only, centred on the field colour so it reads in any browser chrome
balloon = alpha.crop((1655, 110, 1950, 460))
for size in (32, 180):
    icon = Image.new("RGBA", (size, size), (20, 17, 16, 255))
    b = fit(tint(balloon, CREAM), round(size * 0.70))
    if b.width > size * 0.82:
        b = b.resize((round(size*0.82), round(b.height * size*0.82 / b.width)), Image.LANCZOS)
    icon.alpha_composite(b, ((size - b.width)//2, (size - b.height)//2))
    icon.save(f"brand/favicon-{size}.png")

print("  brand: mark-cream.png, favicon-32.png, favicon-180.png")
PY
else
  echo "  MISSING  $SRC — brand mark not rebuilt"
fi
