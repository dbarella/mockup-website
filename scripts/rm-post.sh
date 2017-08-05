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

  # Figure out where this thing is
  # Assumes a directory of the form posts/year/month/date/name
  post_dir="src/posts/$(date -j "+%Y/%m/%d")/${name}"

  echo "Removing post directory at '${post_dir}'"
  rm -rv "${post_dir}"; or_exit

  echo 'Success.'
  exit 0
}

main "$@"
