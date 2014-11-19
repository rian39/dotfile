#!/bin/bash
echo fetching dotfile
cd ~/dotfile/
git pull
cd ~/ref_bibs/
echo fetching ref_bibs
git pull
cd ~/document-archive/
echo fetching document-archive
git pull
cd ~/notes/
echo fetching notes
git pull
