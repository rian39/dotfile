#!/bin/bash
cp .viminfo ~/dotfile/viminfo
echo pushing dotfile
cd ~/dotfile/
git status -s
git push


cd ~/document-archive/
echo pushing document-archive
git add ~/document-archive/*.pdf
git commit -a -m 'new pdfs'
git status -s
git push

cd ~/notes/
echo pushing notes
git add ~/notes/*.md
git commit -a -m 'adding new notes'
git status -s
git push

cd ~/ref_bibs/
echo pushing ref_bibs
git status -s
git push
