git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[33m\]\$(git_branch)\[\033[00m\] (╯°□°)╯︵ "

export PATH="$HOME/usr/local/bin:$HOME/.rbenv/bin:$HOME/.nodenv/bin:$PATH"

eval "$(rbenv init -)"
eval "$(nodenv init -)"

alias ll='ls -lhaG'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias nom='rm -rf node_modules && npm cache clean && npm install'
alias bom='rm -rf bower_components && bower cache clean && bower install'

# Wordpress - jump to theme folder
function wp() {
  cd wp-content/themes/${PWD##*/}
}

alias wp=wp
