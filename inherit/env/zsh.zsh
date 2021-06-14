META_ROOT=../blog.meta
SHARED_ROOT=$META_ROOT/inherit

generate-readme() {
  ../blog.meta/inherit/bin/generate-readme $PWD
}
