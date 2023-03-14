#!/bin/sh -l
export CODE_DIR="/github/workspace"
git config --global --add safe.directory $CODE_DIR
cd $CODE_DIR
git checkout $1
cd $CODE_DIR && checkmate init
cd $CODE_DIR && checkmate git init
cd $CODE_DIR && checkmate git analyze --branch $1
cd $CODE_DIR && checkmate issues html
git config --global user.email "bot@betterscan.io"
git config --global user.name "Betterscan.io Bot"
git init && git add . && git commit -m "state"
git push origin $1
