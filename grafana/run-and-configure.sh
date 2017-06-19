#!/bin/bash

set -x
set -e

if [ ! "$GF_INSTALL_PLUGINS" ]; then
    /install-plugin.sh
fi
/run.sh &

while [[ $( curl -Lk --noproxy '*' -s -o /dev/null -w '%{http_code}' http://localhost:3000 ) != 200 || $? -eq 7 ]]; do
    sleep 1
done
/configure.sh
wait
