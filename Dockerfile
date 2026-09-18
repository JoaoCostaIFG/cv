# based on https://github.com/mingchen/docker-latex
FROM ubuntu:26.04@sha256:da6fc2be547864451aa253836dd926da33623312df4a9a243e35dc877c378a78

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get install -y texlive-full

RUN \
  apt-get install -y curl unzip wget && \
  rm -rf /var/lib/apt/lists/*


COPY install_font_awesome5.sh /install_font_awesome5.sh
COPY install_source_code_pro.sh /install_source_code_pro.sh
RUN \
  sh /install_source_code_pro.sh && \
  sh /install_font_awesome5.sh && \
  fc-cache -f -v

WORKDIR /data

VOLUME ["/data"]
