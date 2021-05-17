#! /bin/bash

FRED="$(tput setaf 1)"
FCYN="$(tput setaf 6)"

BWHT="$(tput setab 7)"

FNC="$(tput sgr0)" # No Color

BOLD="$(tput bold)"

#install NGINX
echo "${FCYN}${BOLD}NGINX starts to intall${FNC}"
read -p "${FRED}${BWHT}Are you sure? ${FNC}" -n 1 -r

