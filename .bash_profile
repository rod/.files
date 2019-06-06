export PATH="$HOME/bin:$PATH";

eval "$(nodenv init -)"
eval "$(rbenv init -)"

# load dotfiles
for file in ~/.{prompt,exports,aliases,functions}; do
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

#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi
