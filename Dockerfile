# based on https://github.com/mingchen/docker-latex
FROM ubuntu:26.04@sha256:c098726dd9b9733f3e885f8de0ef375206a311b0a317eadc40d347b1115fb944

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
