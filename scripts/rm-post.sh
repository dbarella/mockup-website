set -o pipefail -o noclobber #-x

# Remove the post directory at the path specified by the contents of $1
remove_post() {
  name="$1"
  shift

  # Figure out where this thing is
  # Assumes a directory of the form posts/year/month/date/name
  post_dir="src/posts/$(date -j "+%Y/%m/%d")/${name}"

  printf '%s ' "Removing post directory at '${post_dir}'..."
  rm -r "${post_dir}"
  if [[ "$?" = 0 ]]; then
    printf '%s\n' 'done.'
  else
    printf '%s\n\n' 'Failed!'
  fi
}

main() {
  for post in "$@"; do
    remove_post "${post}"
  done
}

main "$@"
