#!/usr/bin/env bash

# Figure out if we are on mac or linux
case "$(uname -s)" in
    Linux*)     OS=Linux;;
    Darwin*)    OS=Mac;;
    *)          OS="UNKNOWN"
esac

if [ $OS != "Linux" ] &&  [ $OS != "Mac" ]; then
    exit 1
fi

# pick map file
if [ $OS == "Mac" ]; then
    MAP_FILE="mac_mappings.csv"
    DIR=$HOME"/dotfiles/mac/"
else
    MAP_FILE="linix_mappings.csv"
    DIR=$HOME"/dotfiles/linix/"
fi


# make backup folder
BACKUP_FILE=/tmp/dotfile-backup-$(date +%s).tar
echo "BACKUP_FILE "$BACKUP_FILE
while read -r; do
    LOCAL_FILE=$DIR$(echo $REPLY | gawk -F, '{print $1}')
    REMOTE_FILE=$HOME/$(echo $REPLY | gawk -F, '{print $2}')
    #REMOTE_FILE_NAME=$(echo $REMOTE_FILE | ag -o '[^\/]+$')
    echo "LF "$LOCAL_FILE
    echo "RM "$REMOTE_FILE
    # backup remote files files
    if [ -f "$REMOTE_FILE" ]; then
        echo "Backing up: "$REMOTE_FILE
        tar cvf "$BACKUP_FILE" "$REMOTE_FILE"
        # wipe remote files
        rm "$REMOTE_FILE"
    fi
    
    if [ -L "$REMOTE_FILE" ]; then
        rm "$REMOTE_FILE"
    fi

    mkdir -p $(dirname "$REMOTE_FILE")
    echo "Creating symlink to for "$LOCAL_FILE
    eval ln -s "$LOCAL_FILE" "$REMOTE_FILE"
done < $MAP_FILE
