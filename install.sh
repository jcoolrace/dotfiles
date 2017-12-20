#!/bin/bash

sudo pacman -S --needed curl
curl -s https://gist.githubusercontent.com/Tadly/0e65d30f279a34c33e9b/raw/pacaur_install.sh | bash

pacaur -Syyu
pacaur -S --needed bdf-unifont calc caffeine-ng compton feh firefox git i3-gaps i3blocks keepass libotf lightdm lightdm-gtk-greeter npm pango qt5-webengine-widevine qutebrowser ranger rofi rxvt-unicode scrot system-san-francisco-font-git tmux tree ttf-droid ttf-ms-fonts ttf-roboto unzip vim volumeicon xdotool xorg-server xorg-xrdb youtube-dl zathura zathura-pdf-poppler zip zsh zsh-autosuggestions

ln -sfv ~/dotfiles/.compton.conf ~/.compton.conf
ln -sfv ~/dotfiles/.config/i3/config ~/.config/i3/config
ln -sfv ~/dotfiles/.config/i3blocks/config ~/.config/i3blocks/config
ln -sfv ~/dotfiles/.config/qutebrowser/ ~/.config/qutebrowser
ln -sfv ~/dotfiles/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sfv ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sfv ~/dotfiles/.vim/ ~/.vim
ln -sfv ~/dotfiles/.vimrc ~/.vimrc
ln -sfv ~/dotfiles/.Xresources ~/.Xresources
ln -sfv ~/dotfiles/.zshrc ~/.zshrc
xrdb ~/.Xresources

git config --global user.email "jerrett7@gmail.com"
git config --global user.name "Jerrett Longworth"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

pacaur -S --needed awk i3lock-color-git imagemagick

sudo npm install -g castnow npm
