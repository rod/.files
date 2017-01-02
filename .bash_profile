export PATH="$HOME/bin:$PATH";

eval "$(nodenv init -)"
eval "$(rbenv init -)"

# Load dotfiles
for file in ~/.{bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing
shopt -s nocaseglob;

# Append to the Bash history
shopt -s histappend;

# Autocorrect pathname typos
shopt -s cdspell;

# Tab completion for Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
