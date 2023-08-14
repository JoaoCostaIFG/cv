#!/bin/sh
# Based on: https://gist.githubusercontent.com/lucasdavila/3875946/raw/3ad424ae03ac2e4f8f55ca36434d2e1f1630d080/install_source_code_pro.sh

printf "\n* Downloading font awesome 5 font version v5.15.4"
wget -O fontawesome5.zip "https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip"

printf "\n* Unziping package"
unzip fontawesome5.zip
mkdir -p ~/.local/share/fonts

printf "\n* Copying fonts to ~/.local/share/fonts/"
mv fontawesome-free-5.15.4-desktop/otfs /usr/local/share/fonts/fontawesome5

printf "\n* Updating font cache"
fc-cache -f -v

printf "\n* Looking for 'Font Awesome' in installed fonts"
fc-list | grep "Font Awesome"

printf "\n* Done\n"
