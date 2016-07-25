#!/bin/bash

sudo -v

# setup

# no need to install command line tools if you can use git or ruby
# xcode-select --install

#install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew

# symlink casks to /Applications not ~/Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

KEGS="
ag
bash
thefuck
"

for keg in $KEGS
do
	brew install $keg
done

CASKS="
Caskroom/cask/dropbox
Caskroom/cask/firefox
Caskroom/versions/sublime-text3
Caskroom/cask/vlc    
"

for cask in $CASKS
do
	brew install $cask
done

# change shell
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash

#  copy things around

cp -r "dotfiles/". "$HOME/"

# FIX ST3 packages copying
# cp -r "app-settings/Application Support/Sublime Text 3/". "$HOME/Library/Application Support/Sublime Text 3"

# fonts from dropbox

cp "files/Inconsolata-dz.otf" "$HOME/Library/Fonts"
# ln -s $HOME/Dropbox/Fonts $HOME/Library/Fonts