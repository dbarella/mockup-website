set -C -x -o pipefail

# Exit if the last command run failed
or_exit() {
  if [[ "$?" != 0 ]]; then
    echo 'Failed!'
    exit 1
  fi
}

main() {
  name="$1"
  shift

  # Figure out where this thing is gonna go
  post_dir="src/posts/$(date -j "+%Y/%m/%d")/${name}"

  # Make a directory of the form posts/year/month/date/name
  echo "Creating post directory at '${post_dir}'"
  mkdir -p "${post_dir}"; or_exit

  # Make a stub markdown file
  echo "Populating stub markdown file in '${post_dir}'"
  touch "${post_dir}/content.md"; or_exit

  echo 'Success.'
  exit 0
}

main "$@"
