#!/bin/bash

    OPTS=`getopt -o vhcd:w: --long verbose,help,clear,dir:,deploy-dir -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

#echo "$OPTS"
eval set -- "$OPTS"

VERBOSE=false
HELP=false
CLEAR=false

SEARCH_PATH_CMD=""
SEARCH_PATH=""
DEPLOY_DIR="./"

while true; do
  case "$1" in
    -v | --verbose ) VERBOSE=true; shift ;;
    -h | --help )    HELP=true; shift ;;
    -d | --dir ) SEARCH_PATH_CMD="-D $2 $SEARCH_PATH_CMD"; SEARCH_PATH="$2 $SEARCH_PATH"; shift 2;;
    -w | --deploy-dir ) DEPLOY_DIR=$2; shift 2;;
    -c | --clear ) CLEAR=true; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

#do not do this becouse shell inherits windows PATH
#SEARCH_PATH="$SEARCH_PATH `echo $PATH | sed -e 's/:/ /g'`"

shift $(expr $OPTIND - 1 )

while test $# -gt 0; do
  TARGET=$1
  shift
done

if [[ $CLEAR == true ]] ; then
    echo Cleaning in $DEPLOY_DIR
    rm $DEPLOY_DIR/*.dll
fi

#echo VERBOSE=$VERBOSE
#echo HELP=$HELP
SEARCH_PATH=$(echo "$SEARCH_PATH" | sed "s/\/\//\//g")
SEARCH_PATH_CMD=$(echo "$SEARCH_PATH_CMD" | sed "s/\/\//\//g")
echo SEARCH_PATH_CMD=$SEARCH_PATH_CMD

find_and_copy() {
    for f in "$@"; do
        dllname=`cygpath $f`
        dir=`dirname $dllname`
        name=`basename $dllname`
        #echo $name $dir ${SEARCH_PATH}
        if [[ ${SEARCH_PATH} =~ (^| )"$dir"($| ) ]] ; then
            echo "copying" $dllname
            cp $dllname $DEPLOY_DIR
        fi
    done
}

export -f find_and_copy
export SEARCH_PATH
export DEPLOY_DIR

ntldd $SEARCH_PATH_CMD -R $TARGET | \
grep -oP "([A-Z]:.*dll)" | \
sed -e 's/\\/\//g' | \
awk '{print $1}' | \
xargs bash -c 'find_and_copy "$0 $@"'
#                             ^ xargs feature
