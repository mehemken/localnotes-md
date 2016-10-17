# This generates a new article with a default
# title and a timestamp.

TITLE=$1
SORT_DATE=$(date +"%Y%m%d")
DISPLAY_DATE=$(date +"%A %d, %Y")

echo "title: $TITLE
sort_date: $SORT_DATE
display_date: $DISPLAY_DATE
full_date: $FULL_DATE
tags: none
" >> app/content/posts/$TITLE.md
