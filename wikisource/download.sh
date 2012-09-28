#!/bin/sh

download_command () {
  # we need '--restrict-file-names=nocontrol' for UTF-8 encoded multibyte characters.
  wget -p -N -x --no-check-certificate --restrict-file-names=nocontrol $1
}
base_url="https://zh.wikisource.org/wiki/%E6%88%B0%E5%9C%8B%E7%AD%96"

# front page
download_command $base_url

# chapters
for i in $(seq -w 33); do
  download_command $base_url"/%E5%8D%B7"$i
done

# appendix
download_command $base_url/%E5%8A%89%E5%90%91%E6%9B%B8%E9%8C%84
