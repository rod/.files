#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# xcode command line tools
# thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh
if ! xcode-select --print-path &> /dev/null; then
  # prompt user to install the xcode command line tools
  xcode-select --install &> /dev/null
  # wait until the xcode command line tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done
  print_result $? 'Install XCode Command Line Tools'
  # point the `xcode-select` developer directory to
  # the appropriate directory from within `xcode.app`
  # https://github.com/alrra/dotfiles/issues/13
  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'
  # prompt user to agree to the terms of the xcode license
  # https://github.com/alrra/dotfiles/issues/10
  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'
fi

# homebrew
if ! which brew &> /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

function makeItSo() {
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  makeItSo;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    makeItSo;
  fi;
fi;
unset makeItSo;
