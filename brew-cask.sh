#!/usr/bin/env bash

# setup
brew update
brew upgrade brew-cask
brew cleanup
brew cask cleanup

# install apps
brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew tap caskroom/versions

# life
brew cask install appcleaner
brew cask install dropbox
brew cask install flux
brew cask install google-drive
brew cask install sonos
brew cask install spectacle

# dev
brew cask install atom
brew cask install hyper
brew cask install imageoptim
brew cask install mamp
brew cask install postman
brew cask install sketch

# web
brew cask install firefox
brew cask install google-chrome

# font
brew cask install font-fira-code
