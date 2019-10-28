#!/usr/bin/env bash

I=0
FILES=()
while read line ; do 
    echo "$I" "$line"
    FILES+=($line)
    let "I++"
done

echo "Which do you want to edit?"
read INDEX < /dev/tty
FILE=${FILES[$INDEX]}

$EDITOR $FILE
