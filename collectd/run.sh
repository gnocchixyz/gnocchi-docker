#!/bin/bash
exec >&2

# NOTE(sileht): To get collectd-gnocchi version in log
pip freeze | grep collectd-gnocchi

export COLLECTD_HOST=fake-phy-host-$(hostname -f)
export OS_AUTH_TYPE=gnocchi-basic
export GNOCCHI_USER=admin
export GNOCCHI_ENDPOINT=http://gnocchi-api:8041/

while [[ $( curl -Lk --noproxy '*' -s -o /dev/null -w '%{http_code}' $GNOCCHI_ENDPOINT ) != 200 || $? -eq 7 ]]; do
    sleep 1
done

configured=$(gnocchi archive-policy-rule list -c name -f value | grep network-interface-rate)
if [ ! "$configured" ] ; then
    gnocchi archive-policy create -d granularity:0:05:00,points:8640 rate:low -m rate:last
    gnocchi archive-policy-rule create -m "interface-*@if_*" -a rate:low network-interface-rate
fi

set -e
echo "collectd host: $COLLECTD_HOST"
envtpl --keep-template /etc/collectd/collectd.conf.tpl

echo "starting collectd"
collectd -f
