#!/usr/bin/bash

tar xf firefox.tar.bz2
rm firefox.tar.bz2

ln -s /app/firefox/plugins firefox/browser

mkdir -p firefox/{distribution/extensions,browser/defaults/preferences}
ln -s /app/firefox/data/{distribution.ini,policies.json} firefox/distribution
ln -s /app/firefox/data/endless-default-prefs.js firefox/browser/defaults/preferences

for xpi in *.xpi; do
  mv $xpi firefox/distribution/extensions/langpack-${xpi%.*}@firefox.mozilla.org.xpi
done
