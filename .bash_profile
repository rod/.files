export PS1='\n\W (╯°□°)╯︵ '

export PATH="$HOME/usr/local/bin:$HOME/.rbenv/bin:$HOME/.nodenv/bin:$PATH"

eval "$(rbenv init -)"
eval "$(nodenv init -)"

alias ll='ls -laG'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias nom='rm -rf node_modules && npm cache clean && npm install'
alias bom='rm -rf bower_components && bower cache clean && bower install'

# Wordpress - jump to theme folder
function wp() {
  cd wp-content/themes/${PWD##*/}
}

alias wp=wp
