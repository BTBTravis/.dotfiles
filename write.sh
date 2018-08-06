#!/usr/bin/env bash
LINUX_FOLDER="linux_configs"

case "$(uname -s)" in
    Linux*)     OS=Linux;;
    Darwin*)    OS=Mac;;
    *)          OS="UNKNOWN"
esac

if [ $OS != "Linux" ] &&  [ $OS != "Mac" ]; then
    exit 1
fi
# make backup folder
echo "Making backup folder ~/dotfiles_old"
mkdir -p ~/dotfiles_old
ID=$(date +%Y%m%d_%H%M%S)
if [ $OS == "Linux" ]; then
    echo "Creating temp folder for linux configs"
    mkdir $LINUX_FOLDER
fi

while read -r; do
    LOCAL_FILE=$(echo $REPLY | gawk -F, '{print $1}' | (echo -n "config_files/" && cat))
    REMOTE_FILE=$(echo $REPLY | gawk -F, '{print $2}')
    REMOTE_FILE_NAME=$(echo $REMOTE_FILE | ag -o '[^\/]+$')
    echo "Moving any existing file: "$REMOTE_FILE "into ~/dotfiles_old"
    eval mv $REMOTE_FILE ~/dotfiles_old/$REMOTE_FILE_NAME.$ID
    # TODO: create the needed path folders if not present
    # FOLDER=$(echo $REMOTE_FILE | ag -o  '.*(?<![^/]+$)')
    echo "Creating symlink to for "$LOCAL_FILE
    eval ln -s ~/dotfiles/$LOCAL_FILE $REMOTE_FILE
done < dotfilemappings.csv
