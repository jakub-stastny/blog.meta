META_ROOT=../blog.meta
SHARED_ROOT=$META_ROOT/inherit

update-readme() {
  ../blog.meta/inherit/bin/generate-readme $PWD
}

ruby-with-repo() {
  ruby -r../blog.meta/inherit/lib/repo.rb -e "$*"
}

update-gh-desc() {
  description=$(ruby-with-repo "puts Repo.build(File.read('meta.yml'), project_name: File.basename('`pwd`')).description")
  echo "$(tput setaf 2)~$(tput sgr0) Updating description to: $(tput setaf 7)$description$(tput sgr0)"
  gh api '/repos/{owner}/{repo}' -f "description=$description" > /dev/null
}
