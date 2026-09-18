# based on https://github.com/mingchen/docker-latex
FROM ubuntu:26.04@sha256:9559ceb7c21e528e233e8dff26a0fb2682f4094cce06176eeb075d87a22b31de

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
