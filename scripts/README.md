# Scripts

Here are some scripts for managing post directories.

In general the scripts assume they are being run from the root of the website
directory, and they make/remove post directories of the form
`posts/year/month/day/<name>/`, where `year/month/day` are determined by the
system `date` commant.

# "Testing"
Right now these scripts are `bash`, so they're essentially un-testable. If I
actually start stucturing my website like this, then I will convert the scripts
to use a real programming language, and write actual unittests.

But, until then, you can use this command to see if they're doing the "right"
thing: 

```bash
./scripts/mk-post.sh post-1 post-2 && ./scripts/rm-post.sh post-1 post-2
```

The scripts also have the `-x` `bash` option commented out at the top. That can
be uncommented in the future, if it becomes useful to make the commands more
verbose (probably for debugging).
