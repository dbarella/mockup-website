set -o pipefail -o noclobber  #-x

remove_post() {
  name="$1"
  shift

  # Figure out where this thing is
  # Assumes a directory of the form posts/year/month/date/name
  post_dir="src/posts/$(date -j "+%Y/%m/%d")/${name}"

  printf '%s' "Removing post directory at '${post_dir}'... "
  rm -r "${post_dir}" || echo 'Failed!'
  printf "%s\n" 'Done.'
}

main() {
  for post in "$@"; do
    remove_post "${post}"
  done
}

main "$@"
