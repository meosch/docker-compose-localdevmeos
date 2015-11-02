#!/bin/bash
# This is a script to switch the docker-compose.yml link file between the full docker-compose_all_containers.yml file and the docker-compose_add_on_site.yml file. - Frederick Henderson
PS4=':${LINENO} + '
#set -x

allcontainersyml="./docker-compose_all_containers.yml"
addonsiteyml="./docker-compose_add_on_site.yml"
allcontainerstype="all containers"
addonsitetype="add on site"

# Console colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
NC='\033[0m'

currentdockercomposeyml=$(readlink ./docker-compose.yml)

function info(){
  echo -e "Currently using ${green}${type}${NC} docker-compose.yml file ${yellow}${currentdockercomposeyml}${NC} ."
}

function switch(){
  if [ "${type}" = "${allcontainerstype}" ]; then
    switchtoyml="${addonsiteyml}"
    switchtotyp="${addonsitetype}"
    switchyesno
    switchyml
  else
    if [ "${type}" = "${addonsitetype}" ]; then
      switchtoyml="${allcontainersyml}"
      switchtotyp="${allcontainerstype}"
      switchyesno
      switchyml
    fi
  
  fi
}

switchyesno(){
  echo -e -n "${yellow}>>>${NC} Should I switch to the ${green}${switchtotyp}${NC} .yml file, ${yellow}${switchtoyml}${NC}? [${red}y${NC}/${green}N${NC}] "
  read -r response
response=${response,,}    # tolower
  if [[ $response !=  "y" && $response != "Y"  && $response != "yes" && $response != "Yes" ]]; then
     echo -e "${red}User aborted script! Now exiting!${NC}"
    exit
  fi
  echo ""
}
function switchyml(){
  ln -sfn "${switchtoyml}" docker-compose.yml
}

function whichymlareweusing(){
  if [ "$currentdockercomposeyml" = "${allcontainersyml}" ]; then
  type="all containers"
  doit
else
  if [ "$currentdockercomposeyml" = "${addonsiteyml}" ]; then
    type="add on site"
    doit
  fi
fi
}

function doit(){
  info
  switch
}
############# MAIN PROGRAM #######################
whichymlareweusing



