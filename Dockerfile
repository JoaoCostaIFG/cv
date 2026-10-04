# based on https://github.com/mingchen/docker-latex
FROM ubuntu:26.04@sha256:f144425ff09be612d6d9ad965196e9cdc23dae1f42110a8a11a3e9a8198759f7

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
