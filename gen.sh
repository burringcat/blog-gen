#! /bin/bash
bold_title() {
    sed -r "1!p;1!d;s|^(.*)$|<h1><b>\1</b></h1>|" "$1"
}
contentize() {
    sed -r "1p;1d;s|^(.*)$|<p>\1</p>|" "$1"
}
contentize_all() {
    sed -r "s|^(.*)$|<p>\1</p>|" "$1"
}
post_title() {
    head -n1 "$1"
}
rm -rf output/*
mkdir -p output
d="$(pwd)"
BASE_HTML="$d/templates/base.html"

# index.html
TITLE="王钊's Weblog"
BLOG_HTML="$d/templates/index.html"
POST_DIR="$d/posts"
POSTS_HTML=$(cat $BLOG_HTML)
for post in $POST_DIR/*;
do
    file_name="$(basename $post .html)"
    post_title="$(post_title $post)"
    anchor="<a href='$(basename $post)'>$file_name | $post_title</a>"
    POSTS_HTML="$POSTS_HTML<br>$anchor<br>"
done
perl -pe "s~__BODY__~$POSTS_HTML~;s|__TITLE__|$TITLE|" "$BASE_HTML" > $d/output/index.html


# posts
POST_TEMP_PATH=/tmp/0u0.post.html
POSTS_DIR="$d/posts"
OUTPUT_DIR="$d/output"
for p in $POSTS_DIR/*;
do
    post_file_name="$(basename $p .html)"
    bold_title $p > $POST_TEMP_PATH
    POST_RENDERED="$(contentize $POST_TEMP_PATH)"
    HTML=$(perl -pe "s|__BODY__|$POST_RENDERED|;s|__TITLE__|$(post_title $p)|" "$BASE_HTML")
    INFO="<a href='index.html' style='font-size:1.3em'>Back</a><br><span>(Date: ${post_file_name})</span>"
    HTML="$INFO<br><hr>$HTML<br><hr>$INFO"
    echo $HTML > $OUTPUT_DIR/$(basename $p)
    rm $POST_TEMP_PATH
done

cp -r static/* output/
