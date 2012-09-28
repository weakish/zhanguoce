#!/bin/sh

wikisource_to_markdown() {
  html=$1

  # convert from html to markdown
  pandoc -f html $html -t markdown --strict |
  # get the main part
  sed -n -r '/^## 目录$/,/^\[!\[PD-icon\.svg\]/p' |
  sed -r '$d' |
  # remove links
  sed -r 's/\[([^]]+)\]\(#\.[0-9A-F.]+\)/\1/g' |
  sed -r 's/\[\[编辑\]\(\/w\/index\.php\?title=[^)]+\)\]//g'
}

for i in 卷*; do
  wikisource_to_markdown $i > $(basename $i .html).md
done

pandoc -f html $html -t markdown --strict 劉向書錄 |
sed -n -r '/護左都水使者光祿大夫臣向言/,/護左都水使者光祿大夫臣向所校《戰國策書錄》。/p' > 劉向書錄.md
