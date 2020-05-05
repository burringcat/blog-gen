source ./utils.sh
TEMP_PATH=/tmp/0u0.post.html
BASE_HTML=$1
POSTS_DIR=$2
OUTPUT_DIR=$3
mkdir -p $OUTPUT_DIR/blog
for p in $POSTS_DIR/*;
do
    post_file_name="$(basename $p .html)"
    bold_title $p > $TEMP_PATH
    POST_RENDERED="$(contentize $TEMP_PATH)"
    HTML=$(perl -pe "s|__BODY__|$POST_RENDERED|;s|__TITLE__|$(post_title $p)|" "$BASE_HTML")
    INFO="<a href='index.html' style='font-size:1.3em'>Back</a><br><span>(Date: ${post_file_name})</span>"
    HTML="$INFO<br><hr>$HTML<br><hr>$INFO"
    echo $HTML > $OUTPUT_DIR/$(basename $p)
    rm $TEMP_PATH
done

