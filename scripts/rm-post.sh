set -o pipefail -o noclobber -x

remove_post() {
  name="$1"
  shift

  # Figure out where this thing is
  # Assumes a directory of the form posts/year/month/date/name
  post_dir="src/posts/$(date -j "+%Y/%m/%d")/${name}"

  echo "Removing post directory at '${post_dir}'"
  rm -rv "${post_dir}" || echo 'Failed!'
}

main() {
  for post in "$@"; do
    remove_post "${post}"
  done
}

main "$@"
