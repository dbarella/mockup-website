set -o pipefail -o noclobber  #-x

mk_post() {
  name="$1"
  shift

  # Figure out where this thing is gonna go
  post_dir="src/posts/$(date -j "+%Y/%m/%d")/${name}"

  # Make a directory of the form posts/year/month/date/name
  echo "Creating post directory at '${post_dir}'"
  mkdir -p "${post_dir}" || echo 'Failed!'

  # Make a stub markdown file
  echo "Populating stub markdown file in '${post_dir}'"
  touch "${post_dir}/content.md" || echo 'Failed!'
}

main() {
  for post in "$@"; do
    mk_post "${post}"
  done
}

main "$@"
