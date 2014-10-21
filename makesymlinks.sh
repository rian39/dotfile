#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfile in ~/dotfile
############################

########## Variables

dir=~/dotfile                    # dotfile directory
olddir=~/dotfile_old             # old dotfile backup directory
files="bashrc vimrc vim viminfo"    # list of files/folders to symlink in homedir

##########

# create dotfile_old in homedir
echo "Creating $olddir for backup of any existing dotfile in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfile directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfile in homedir to dotfile_old directory, then create symlinks 
for file in $files; do
        echo "Moving any existing dotfile from ~ to $olddir"
            mv ~/.$file ~/dotfile_old/
                echo "Creating symlink to $file in home directory."
                    ln -s $dir/$file ~/.$file
                done
