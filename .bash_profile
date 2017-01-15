export PATH="$HOME/bin:$PATH";

eval "$(nodenv init -)"
eval "$(rbenv init -)"

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
if which brew &> /dev/null then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# load dotfiles
for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# case-insensitive globbing
shopt -s nocaseglob;

# append to the bash history
shopt -s histappend;

# autocorrect pathname typos
shopt -s cdspell;

# tab completion for bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
