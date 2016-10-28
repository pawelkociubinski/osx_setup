#!/bin/bash

# cd ~/osx_setup
# chmod +x bash.sh
# ./bash.sh

# install brew

if ! type brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  xcode-select --install
else
  echo 'brew update'
  brew update
fi

# helper functions

brew_install() {
  if ! type $1; then
    echo "installing: $1..."
    brew install $1
    echo 'finished'
  else
    echo "$1 is installed"
  fi
}

cask_install() {
  if !(brew cask list | grep $1); then
    echo "installing: $1..."
    brew cask install $1
    echo 'finished'
    brew tap caskroom/versions
  else
    echo "$1 is installed"
    brew cask update
  fi
}



# if ! type rbenv; then
#   brew_install rbenv
#   brew_install ruby-build

  # Add rbenv to bash so that it loads every time you open a terminal
  # echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  # source ~/.bash_profile

  # Install Ruby # El Capitan hack
  # brew install https://raw.githubusercontent.com/Homebrew/homebrew/b5cffc8d5fc41540a41ed4deba23afbb6431435e/Library/Formula/openssl.rb
  # brew tap homebrew/versions
  # brew switch openssl 1.0.1l
  # brew link openssl --force

  # brew install llvm35 openssl
  # RUBY_CONFIGURE_OPTS="--with-lib-dir=$(brew --prefix openssl)/lib --with-include-dir=$(brew --prefix openssl)/include" rbenv install 2.2.2
#   rbenv global 2.3.1
#   ruby -v
#   gem install bundler
# else
#   echo 'rbenv and ruby installed'
# fi


brew_install caskroom/cask/brew-cask
brew_install heroku
brew_install pow
brew_install git

cask_install google-chrome
cask_install firefox
cask_install torbrowser
cask_install spotify
cask_install skype
cask_install dropbox
cask_install slack
cask_install atom
cask_install vlc
cask_install iterm2
cask_install bettertouchtool
cask_install libreoffice
cask_install gimp
cask_install spectacle
cask_install slack
cask_install steam
cask_install docker
cask_install postico
cask_install harvest
cask_install cyberduck
cask_install virtualbox
cask_install wireshark
cask_install zeplin
cask_install synology-cloud-station-drive
cask_install browserstacklocal
cask_install flux
cask_install caffeine
cask_install goofy
# You need to install manualy:
# monosnap
# discord
# gotomeeting
# sketch
# webstorm
# http://canarymail.io/
# nvm      curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
