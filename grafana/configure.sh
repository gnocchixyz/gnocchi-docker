#!/bin/sh

set -x
set -e

GRAFANA_URL="http://admin:${GF_SECURITY_ADMIN_PASSWORD}@grafana:3000/api"

echo "Creating datasource..."
curl -v -# \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/datasource.json \
    ${GRAFANA_URL}/datasources

if [ -z "$GNOCCHI_RATE_SUPPORT" ]; then
    sed -i -e 's/"rate:last/"mean/g' /dashboard.json
fi

echo "Creating dashboard..."
curl -v -# \
    -X DELETE \
    -H "Accept: application/json" \
    ${GRAFANA_URL}/dashboards/db/collectd-gnocchi-system-metrics


echo '{"dashboard":' > /dashboard.json.mod
sed -e 's/\${DS_GNOCCHI}/Gnocchi/g' /dashboard.json >> /dashboard.json.mod
echo '}' >> /dashboard.json.mod
curl -v -# \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/dashboard.json.mod \
    ${GRAFANA_URL}/dashboards/db
