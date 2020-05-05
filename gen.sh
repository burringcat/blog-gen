#! /bin/bash
rm -rf output/
mkdir -p output
d="$(pwd)"
BASE_HTML="$d/templates/base.html"
cd scripts/render/ || exit
mkdir -p $d/output/blog
bash blog.sh "$BASE_HTML" "王钊's Weblog" "$d/templates/blog/index.html" "$d/posts" > $d/output/index.html
bash posts.sh "$BASE_HTML" "$d/posts" "$d/output"
cd "$d"
cp -r static/* output/
