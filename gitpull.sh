#!/bin/bash
echo fetching dotfile
cd ~/dotfile/
git status -s
git pull

cd ~/ref_bibs/
echo fetching ref_bibs
git status -s
git pull

cd ~/document-archive/
echo fetching document-archive
git status -s
git pull

cd ~/notes/
echo fetching notes
git status -s
git pull
