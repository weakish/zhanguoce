#!/bin/sh

# Bug:

echo '卷12.md is special, this script cannot add it to table of contents.'
echo 'You need to add it manually.'

extract_titles () {
  text_file=$1
  vol_title=$(basename $text_file .md)
  sed -n -r '/^## 目录/,/^##  /p' $text_file |
  sed '$d' |
  sed -r "s/^## 目录/$vol_title/" >> table-of-contents.md
}


for i in 卷*.md; do
  extract_titles $i
done


