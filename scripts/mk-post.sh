set -o pipefail -o noclobber #-x

# Make a stub markdown file in the $1 directory
mk_stub_markdown() {
  post_dir=$1
  shift

  printf '  %s ' 'Populating stub markdown file...'
  touch "${post_dir}/content.md" || echo 'Failed!'
  printf '%s\n' 'done.'
}

# Make a post directory at the path specified by the contents of $1
mk_post() {
  name="$1"
  shift

  # Figure out where this thing is gonna go
  post_dir="src/posts/$(date -j "+%Y/%m/%d")/${name}"

  # Make a directory of the form posts/year/month/date/name
  echo "Creating post directory at '${post_dir}':"
  mkdir -p "${post_dir}"

  if [[ "$?" = 0 ]]; then
    mk_stub_markdown "${post_dir}"
  else
    printf '%s\n\n' 'Failed!'
  fi
}

main() {
  for post in "$@"; do
    mk_post "${post}"
  done
}

main "$@"
