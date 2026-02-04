#!/bin/sh
#
# Usage example:
#
#   dockerlatex.sh pdflatex foo.tex
#

set -eu

docker build -t cv .

docker run --rm -i --user="$(id -u):$(id -g)" \
  -v "$(pwd)":/data \
  -v "$(pwd)/fonts":/root/.fonts \
  cv "$@"
