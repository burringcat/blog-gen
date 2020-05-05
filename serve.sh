#! /bin/bash
./down.sh
HOST=0.0.0.0
DIR=$(pwd)
cd output
case $1 in
    block) sudo $DIR/utils/quark -h $HOST -p 80 ;;
    *) sudo nohup $DIR/utils/quark -h $HOST -p 80 >/dev/null & ;;
esac
