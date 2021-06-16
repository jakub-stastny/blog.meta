load ~/.zsh/environments/helpers.zsh && save-function-list
load ~/.zsh/environments/basic.zsh
load ~/.zsh/environments/emacs.zsh

rename-first-tab

# Custom functions & aliases.
e() {
  test "$#" -eq 0 && emacs --load $PWD/.env/emacs.el . || emacs --load $PWD/.env/emacs.el $@
}

# Usage: regenerate-icons 32x32
regenerate-icons() {
  for file in doc/icons/*.orig.png; do
    convert -resize $1 $file $(echo $file | sed -E 's/.orig//')
  done
}

report-custom-functions
