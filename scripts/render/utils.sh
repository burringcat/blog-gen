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
