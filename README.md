# Website Mockup

I decided to sketch out how I'd like my site to look, and this is one such
mockup.

## Requirements

I want my site to have the following properties:

- Essentially all a "blog" 
  - All static `html`, generated from some source kept elsewhere
  - Easy to post new blog entries
    - e.g. `markdown`, possibly with code references (might be tough to
      implement)
- Templatized header – easy to update stuff like title, contact info, etc.

### URL Structure

The ideal URL structure for blog posts is to have the posts resource expose a
tree of sub-resources, structured by date:

```
posts/
  year/
    month/
      day/
        <post-name>/
          content.html
          <optional additional contents within>
```

For example:
```
posts/
  2017/
    08/
      01/
        some-topic/
          content.html
      05/
        idea-1/
          content.html
        idea-2/
          content.html
```

## Source

The source from whence this site is generated should parallel the URL structure,
but with markdown files instead of html resources. These are then compiled into
the final html:

```
src
├── posts
│   └── 2017
│       └── 08
│           └── 05
│               ├── post-1
│               │   └── content.md
│               ├── post-2
│               │   └── content.md
│               └── post-3
│                   └── content.md
└── static
```

## Inspirations
- http://matt.might.net/

