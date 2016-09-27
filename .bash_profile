# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[33m\]\$(git_branch)\[\033[00m\] (╯°□°)╯︵ "

export PATH="$HOME/usr/local/bin:$HOME/.rbenv/bin:$HOME/.nodenv/bin:$PATH"

eval "$(rbenv init -)"
eval "$(nodenv init -)"

# Wordpress - jump to theme folder
function wp() {
  cd wp-content/themes/${PWD##*/}
}

alias wp=wp
