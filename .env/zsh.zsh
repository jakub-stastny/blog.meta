load ~/.zsh/environments/helpers.zsh && save-function-list
load ~/.zsh/environments/basic.zsh
load ~/.zsh/environments/emacs.zsh

start-emacs-session
rename-first-tab

# Custom functions & aliases.

# Usage: regenerate-icons 32x32
regenerate-icons() {
  for file in doc/icons/*.orig.png; do
    convert -resize $1 $file $(echo $file | sed -E 's/.orig//')
  done
}

report-custom-functions
