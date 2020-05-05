source ./utils.sh
BASE_HTML="$1"
TITLE="$2"
BLOG_HTML="$3"
POST_DIR="$4"
POSTS_HTML=$(cat $BLOG_HTML)
for post in $POST_DIR/*;
do
    file_name="$(basename $post .html)"
    post_title="$(post_title $post)"
    anchor="<a href='$(basename $post)'>$file_name | $post_title</a>"
    POSTS_HTML="$POSTS_HTML<br>$anchor<br>"
done
perl -pe "s~__BODY__~$POSTS_HTML~;s|__TITLE__|$TITLE|" "$BASE_HTML"
