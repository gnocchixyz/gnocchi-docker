#!/bin/bash
set -e
exec >&2

export COLLECTD_HOST=fake-phy-host-$(hostname -f)

echo "collectd host: $COLLECTD_HOST"
envtpl --keep-template /etc/collectd/collectd.conf.tpl

echo "starting collectd"
collectd -f &

echo "starting stress"
while true ; do
    stress -c 1 -m 2 -i 1 -t 5 --vm-hang 2
    sleep 5
done
