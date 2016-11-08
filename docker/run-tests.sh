#!/bin/bash
docker run --volume=$(pwd):/srv/jekyll apiaryio/blog bundle exec rake test
