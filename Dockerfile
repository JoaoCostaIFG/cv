FROM mingc/latex:latest

COPY install_font_awesome5.sh /install_font_awesome5.sh
COPY install_source_code_pro.sh /install_source_code_pro.sh

RUN \
  sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
  apt-get update && apt-get install fonts-crosextra-carlito unzip && \
  sh /install_source_code_pro.sh && \
  sh /install_font_awesome5.sh && \
  fc-cache -f -v
