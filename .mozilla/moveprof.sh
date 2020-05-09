#!/bin/bash

# moveprof - A script to move Firefox profiles inbetween eachother 

SRC=""
DEST=""

important_files=(
    places.sqlite 
    favicons.sqlite 
    key4.db 
    logins.json 
    permissions.sqlite 
    search.json.mozlz4 
    formhistory.sqlite 
    cookies.sqlite 
    cert9.db 
    handlers.json
)

optional=( persdict.dat )
session=( sessionstore-backup.jsonlz4 logins.json )

show_help() {
echo "moveprof - Move files inbetween Firefox profiles"
echo " "
echo "moveprof [options] SRC DEST"
echo " "
echo "options:"
echo "-h, --help                  show brief help"
echo "-s, --session               moves the session to a profile"
echo "-a, --all                   moves all the important files to a profile (this can render Firefox unusable)"
}

move_files() {
if [ -z "$1" ]; then     # Check for SRC and DEST directories, and the list of files
    echo "No list of files to move"
    exit 1
else 
    local files=("$@")
    for i in ${!files[@]}; do
        cp -rf $SRC/${files[$i]} $DEST/${files[$i]}
        # echo "copy $SRC/${files[$i]} $DEST/${files[$i]}?"
    done
fi
}

while test $# -gt 0; do
  case "$1" in
    -h|--help)
        show_help
        exit 0
      ;;
    -a)
        shift
        SRC=$1  # Set source
        shift
        DEST=$1 # Set destination
        shift
        move_files ${important_files[@]}
        exit
        shift ;;
    -s|--session) 
        shift
        SRC=$1  # Set source
        shift
        DEST=$1 # Set destination
        shift
        move_files ${session[@]}
        exit
        shift ;;
    -a|--all) 
        move_files $@
        exit
        ;;
    *) # Exit with any other input 
        echo "No valid arguments passed"
        show_help
        exit 1
      break
      ;;
  esac
done
