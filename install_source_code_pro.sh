#!/bin/sh
# Based on: https://gist.githubusercontent.com/lucasdavila/3875946/raw/3ad424ae03ac2e4f8f55ca36434d2e1f1630d080/install_source_code_pro.sh

printf "\n* Downloading source code pro font latest version"
wget -O SourceCodeProOTF.zip "$(curl https://api.github.com/repos/adobe-fonts/source-code-pro/releases/latest | grep browser_download_url | head -1 | sed -re 's/.*: "([^"]+)".*/\1/')"

printf "\n* Unziping package"
unzip SourceCodeProOTF.zip
mkdir -p ~/.local/share/fonts

printf "\n* Copying fonts to ~/.local/share/fonts/"
mv OTF /usr/local/share/fonts/sourcecodepro

printf "\n* Updating font cache"
fc-cache -f -v

printf "\n* Looking for 'Source Code Pro' in installed fonts"
fc-list | grep "Source Code Pro"

printf "\n* Done\n"
