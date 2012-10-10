#!/bin/sh

SERVER=cero1@huchra.bufferbloat.net
SERVER2=d@huchra.bufferbloat.net
SDIR=src/ceropackages/utils/cerowrt-chrome/files/etc/cerowrt
./mkall.sh
scp credits.html ${SERVER}:${SDIR}
ssh $SERVER "cd ${SDIR}; git pull; git commit -m 'update_credits' credits.html; git push;"
ssh $SERVER2 "cd ${SDIR}; git pull"
