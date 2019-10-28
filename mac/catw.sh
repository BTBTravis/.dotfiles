#!/usr/bin/env bash

blue=$(tput setaf 2)
normal=$(tput sgr0)
while read F ; do 
    printf "\n${blue}==== File: ""$F"" ====${normal}\n"
    cat "$F"
done
