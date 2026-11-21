#!/bin/bash
# fetch.sh -- downloads data and photos for Section 2. Run from anywhere:   bash slides/assets/fetch.sh
# Everything lands in assets/data/ and assets/photos/. Safe to re-run.
set -u
UA="X16580-slides/1.0 (educational slides)"
cd "$(dirname "$0")"
mkdir -p data photos

echo "== 1. World country outlines (Natural Earth, 1:110m, public domain)"
[ -s data/countries.geojson ] || curl -sSL -A "$UA" -o data/countries.geojson \
  "https://raw.githubusercontent.com/nvkelso/natural-earth-vector/master/geojson/ne_110m_admin_0_countries.geojson"

echo "== 2. Warhead counts by country (FAS, Status of World Nuclear Forces)"
[ -s data/fas-status.html ] || curl -sSL -A "$UA" -o data/fas-status.html "https://fas.org/initiative/status-world-nuclear-forces/"

echo "== 3. Base coordinates from Wikipedia (missing pages are fine; I'll impute)"
wiki_coords () {  # $1 = output file, $2 = titles separated by |
  curl -sSL -G -A "$UA" "https://en.wikipedia.org/w/api.php" \
    --data-urlencode "action=query" --data-urlencode "prop=coordinates" \
    --data-urlencode "redirects=1" --data-urlencode "format=json" \
    --data-urlencode "titles=$2" -o "data/$1"
}
# United States
wiki_coords coords-us.json "Malmstrom Air Force Base|Minot Air Force Base|F. E. Warren Air Force Base|Naval Base Kitsap|Naval Submarine Base Kings Bay|Barksdale Air Force Base|Whiteman Air Force Base"
# Russia: ICBM divisions (by garrison town), submarine bases, bomber bases
wiki_coords coords-ru.json "Kozelsk|Tatishchevo|Teykovo|Yoshkar-Ola|Yurya|Nizhny Tagil|Novosibirsk|Barnaul|Irkutsk|Uzhur|Dombarovsky|Yasny, Orenburg Oblast|Gadzhiyevo|Vilyuchinsk|Engels-2|Ukrainka (air base)"
# China, UK, France
wiki_coords coords-other.json "Yumen|Hami|Hanggin Banner|Yulin Naval Base|HMNB Clyde|Île Longue|Saint-Dizier – Robinson Air Base|Istres-Le Tubé Air Base"

echo "== 4. Photos from Wikimedia Commons (top hits saved; full hit lists in photos/_search.txt)"
commons () {  # $1 = output basename, $2 = search terms
  local res titles first enc
  [ -s "photos/$1.jpg" ] && { echo "   $1 (already have)"; return; }
  sleep 3   # Commons rate-limits bursts
  res=$(curl -sSL -G -A "$UA" "https://commons.wikimedia.org/w/api.php" \
    --data-urlencode "action=query" --data-urlencode "list=search" \
    --data-urlencode "srnamespace=6" --data-urlencode "srlimit=6" \
    --data-urlencode "format=json" --data-urlencode "srsearch=$2")
  titles=$(printf '%s' "$res" | grep -o '"title":"File:[^"]*"' | sed 's/"title":"File://; s/"$//')
  printf '## %s  [%s]\n%s\n\n' "$1" "$2" "$titles" >> photos/_search.txt
  first=$(printf '%s\n' "$titles" | grep -iE '\.(jpe?g|png|tiff?)$' | head -1)
  [ -z "$first" ] && { echo "   (no image for $1)"; return; }
  enc=$(printf '%s' "$first" | sed 's/ /_/g; s/&/%26/g; s/?/%3F/g; s/+/%2B/g')
  curl -sSL -A "$UA" -o "photos/$1.jpg" "https://commons.wikimedia.org/wiki/Special:FilePath/$enc?width=1600"
  echo "   $1  <-  $first"
}
commons trinity        "Trinity Detonation"
commons hiroshima      "Hiroshima atomic bomb cloud"
commons littleboy      "Little Boy atomic bomb"
commons fatman         "Fat Man atomic bomb"
commons ivymike        "Ivy Mike explosion"
commons castlebravo    "Castle Bravo blast"
commons cloudchamber-alt "cloud chamber particle tracks"   # backup if the specific file is missing

echo "== 5. Lead images of Wikipedia articles (more reliable than search)"
lead () {  # $1 = output basename, $2 = Wikipedia article title
  local res url
  [ -s "photos/$1.jpg" ] && { echo "   $1 (already have)"; return; }
  sleep 3
  res=$(curl -sSL -G -A "$UA" "https://en.wikipedia.org/w/api.php" \
    --data-urlencode "action=query" --data-urlencode "prop=pageimages" \
    --data-urlencode "piprop=thumbnail" --data-urlencode "pithumbsize=1600" \
    --data-urlencode "redirects=1" --data-urlencode "format=json" --data-urlencode "titles=$2")
  url=$(printf '%s' "$res" | grep -o '"source":"[^"]*"' | head -1 | sed 's/"source":"//; s/"$//')
  [ -z "$url" ] && { echo "   (no lead image for $1: $2)"; return; }
  sleep 2
  curl -sSL -A "$UA" -o "photos/$1.jpg" "$url"
  echo "   $1  <-  $url" | tee -a photos/_search.txt
}
lead minuteman     "LGM-30 Minuteman"
lead trident       "UGM-133 Trident II"
lead b52           "Boeing B-52 Stratofortress"
lead davycrockett  "Davy Crockett (nuclear device)"
lead mirv          "Multiple independently targetable reentry vehicle"
lead radiumdial    "Radium dial"
# Section 3
lead schelling     "Thomas Schelling"
lead cuba          "Cuban Missile Crisis"
lead arkhipov      "Vasily Arkhipov (vice admiral)"
lead petrov        "Stanislav Petrov"
lead berlin        "Berlin Brigade"
lead wipp          "Long-term nuclear waste warning messages"

echo "== 6. Specific Commons files"
file () {  # $1 = output name, $2 = exact Commons file name (spaces as underscores)
  [ -s "photos/$1" ] && { echo "   $1 (already have)"; return; }
  sleep 3
  curl -fsSL -A "$UA" -o "photos/$1" "https://commons.wikimedia.org/wiki/Special:FilePath/$2?width=1600" || { rm -f "photos/$1"; echo "   (not found: $2)"; return; }
  echo "   $1  <-  $2" | tee -a photos/_search.txt
}
# Tsar Bomba stills come from Soviet/Rosatom footage: check each file's license on Commons before publishing.
file tsarbomba.jpg        "Tsar_Bomba_fireball_1961.jpg"
# (Cloud_chamber_bionerd.jpg was too murky; the slide uses cloudchamber-alt.jpg from the search above)
file tsarbomba-casing.jpg "Tsar_Bomba_Revised.jpg"   # the casing at the Sarov museum

echo "== 7. Our World in Data (charts for Section 3)"
owid () {  # $1 = output file, $2 = grapher slug
  [ -s "data/$1" ] && { echo "   $1 (already have)"; return; }
  sleep 2
  curl -sSL -A "$UA" -o "data/$1" "https://ourworldindata.org/grapher/$2.csv?csvType=full&useColumnShortNames=false"
  echo "   $1  <-  $2  ($(head -c 60 "data/$1" | head -1))"
}
owid owid-stockpiles.csv  "nuclear-warhead-stockpiles"
owid owid-tests.csv       "number-of-nuclear-weapons-tests"

echo "== done. Contents:"
ls -la data photos
