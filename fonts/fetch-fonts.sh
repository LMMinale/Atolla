#!/usr/bin/env bash
# Downloads the exact font weights Atolla uses and names them to match fonts.css.
# Run from the repo root:  bash fonts/fetch-fonts.sh
# Requires: curl + unzip (preinstalled on macOS/Linux; on Windows use Git Bash).
set -euo pipefail
cd "$(dirname "$0")"

API="https://gwfh.mranftl.com/api/fonts"
TMP="$(mktemp -d)"

dl () {  # $1=font-id  $2=variants  $3..=rename pairs "srcfragment:DestName"
  local id="$1"; local variants="$2"; shift 2
  echo "Downloading $id ($variants)…"
  curl -sSL "${API}/${id}?download=zip&subsets=latin&formats=woff2&variants=${variants}" -o "$TMP/$id.zip"
  unzip -oq "$TMP/$id.zip" -d "$TMP/$id"
  for pair in "$@"; do
    local frag="${pair%%:*}"; local dest="${pair##*:}"
    cp "$TMP/$id/"*"${frag}"*.woff2 "./${dest}.woff2"
    echo "  -> ${dest}.woff2"
  done
}

dl "archivo-narrow" "regular,500,600,700" \
   "regular:ArchivoNarrow-Regular" "500:ArchivoNarrow-Medium" \
   "600:ArchivoNarrow-SemiBold"   "700:ArchivoNarrow-Bold"

dl "barlow" "300,regular,500" \
   "300:Barlow-Light" "regular:Barlow-Regular" "500:Barlow-Medium"

rm -rf "$TMP"
echo "Done. 7 .woff2 files are now in fonts/."
