#!/bin/bash

docker run --rm --volume=$(pwd):/srv/jekyll \
  -it -p 4000:4000 apiaryio/blog \
  jekyll serve -H 0.0.0.0 --watch --drafts --trace --force_polling
