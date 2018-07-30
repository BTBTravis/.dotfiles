#!/usr/bin/env bash

read -r -p "Fix php-extras? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    # echo "Updating php-extras.sample.txt"
    # sed -i '' 's/\((php-extras :location\).*/\1 "test")/g' php-extra-sample.txt
    # sed 's/\((php-extras :location\).*/\1 "test")/g' php-extra-sample.txt
    # mkdir -p parent/child/grand-child
    # echo "Updated php-extras.sample.txt..."

    # make fix folder if needed
    echo "Create fixs/php-extra/"
    mkdir -p fixes/php-extras/
    # get github url 
    PACKAGE_INFO=$(
        cd ~/.emacs.d/
        ag -o '(?<=php-extras :location \(recipe :fetcher github :repo ")[^"]+'
    )
    echo $PACKAGE_INFO

    # clone repo to fix folder
    REPO=$(echo $PACKAGE_INFO | gawk -F: '{print $3}' )
    echo "Clone "$REPO
    git clone git@github.com:$REPO.git ./fixes/php-extras/

    # backup config file
    echo "Update config"
    CONFIG_FILE=$(echo $PACKAGE_INFO | gawk -F: '{print $1}')
    ID=$(date +%Y%m%d_%H%M%S)
    mkdir -p ~/dotfiles_old/
    cp ~/.emacs.d/$CONFIG_FILE ~/dotfiles_old/packages.el.$ID.bak
    # update config file
    sed -i '' 's/\((php-extras :location\).*/\1 "~\/dotfiles\/fixes\/php-extras")/g' ~/.emacs.d/$CONFIG_FILE
else
    echo "ok not fixing php-extras"
fi
