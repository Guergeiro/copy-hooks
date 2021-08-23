# MIT License
#
# Copyright (c) 2021 Breno Salles
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#!/bin/sh

copyHooks() {
  local fromDir="$1"
  local toDir="$2"

  if [ -d "$toDir" ]; then
    cp -r $fromDir* $toDir
    chmod -R +x "$toDir"
  fi
}

# Git dir + git worktree
gitworktree="$(git rev-parse --show-toplevel)"
hooksdir="$gitworktree/hooks/"
commondir="$gitworktree/.git"

if [ "$#" -gt 0 ]; then
  hooksdir="$gitworktree/$1"
  shift
fi

if [ -f ./.git ]; then
  # Git worktree
  gitdir=$(cat ./.git | sed 's/gitdir: //')
  commondir=$(cd $(cat "$gitdir/commondir") && pwd)
fi

copyHooks "$hooksdir" "$commondir/hooks/"
