#!/bin/sh
#
# Usage example:
#
#   dockerlatex.sh pdflatex foo.tex
#

set -e # Exit with nonzero exit code if anything fails

docker build -t tex .

docker run --rm -i --user="$(id -u):$(id -g)" \
  -v "$(pwd)":/data \
  -v "$(pwd)/fonts":/root/.fonts \
  tex "$@"
  #mingc/latex "$@"
