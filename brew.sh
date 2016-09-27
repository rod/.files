#!/usr/bin/env bash

# Update Homebrew
brew update

# Upgrade existing formulae
brew upgrade --all

brew install rbenv
brew install ruby-build
brew install nodenv
brew install node-build

# Remove outdated versions from cellar
brew cleanup
