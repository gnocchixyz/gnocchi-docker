#!/bin/sh

set -x
set -e

GRAFANA_URL="http://admin:${GF_SECURITY_ADMIN_PASSWORD}@grafana:3000/api"

echo "Creating datasource..."
curl -v -# \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/tmp/datasource.json \
    ${GRAFANA_URL}/datasources

if [ -z "$GNOCCHI_RATE_SUPPORT" ]; then
    sed -i -e 's/"rate:last/"mean/g' /tmp/dashboard.json
fi

echo "Creating dashboard..."
curl -v -# \
    -X DELETE \
    -H "Accept: application/json" \
    ${GRAFANA_URL}/dashboards/db/collectd-gnocchi-system-metrics


echo '{"dashboard":' > /tmp/dashboard.json.mod
sed -e 's/\${DS_GNOCCHI}/Gnocchi/g' /dashboard.json >> /tmp/dashboard.json.mod
echo '}' >> /tmp/dashboard.json.mod
curl -v -# \
    -H "Expect:" \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/tmp/dashboard.json.mod \
    ${GRAFANA_URL}/dashboards/db
