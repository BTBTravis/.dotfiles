#!/usr/bin/env bash
# get the status of shop and club dev envs
CYAN=`tput setaf 6`
RESET_COLORS=`tput sgr0`
echo "${CYAN}--------CLUB STATUS--------${RESET_COLORS}"
docker-machine ls
echo "${CYAN}--------SHOP STATUS--------${RESET_COLORS}"
vagrant status
docker ps
