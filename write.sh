#!/usr/bin/env bash

# make backup folder
echo "Making backup folder ~/dotfiles_old"
mkdir -p ~/dotfiles_old
ID=$(date +%Y%m%d_%H%M%S)
while read -r; do
    LOCAL_FILE=$(echo $REPLY | gawk -F, '{print $1}')
    REMOTE_FILE=$(echo $REPLY | gawk -F, '{print $2}')
    REMOTE_FILE_NAME=$(echo $REMOTE_FILE | ag -o '[^\/]+$')
    echo "Moving any existing file: "$REMOTE_FILE "into ~/dotfiles_old"
    eval mv $REMOTE_FILE ~/dotfiles_old/$REMOTE_FILE_NAME.$ID
    # TODO: create the needed path folders if not present
    # FOLDER=$(echo $REMOTE_FILE | ag -o  '.*(?<![^/]+$)')
    echo "Creating symlink to for "$LOCAL_FILE
    eval ln -s ~/dotfiles/$LOCAL_FILE $REMOTE_FILE
done < dotfilemappings.csv
