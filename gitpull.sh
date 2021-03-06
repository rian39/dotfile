#!/bin/bash
echo fetching dotfile
echo ----------------------------
cd ~/dotfile/
git status -s
git pull
rm ~/.viminfo 
cp ~/dotfile/viminfo ~/.viminfo


cd ~/ref_bibs/
echo ----------------------------
echo fetching ref_bibs
echo ----------------------------
git status -s
git pull
echo done ref_bibs ok

cd ~/archive/
echo ----------------------------
echo fetching document-archive
echo ----------------------------
#git status -s
git pull

cd ~/notes/
echo ----------------------------
echo fetching notes
echo ----------------------------
git status -s
git pull

echo ---------------------------
echo copying pandoc templates
echo ---------------------------

cp ~/dotfile/pandoc/default.latex ~/.pandoc/
