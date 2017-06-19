#!/bin/sh

set -x
set -e

GRAFANA_URL="http://admin:${GF_SECURITY_ADMIN_PASSWORD}@grafana:3000/api"
curl -v \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      ${GRAFANA_URL}/datasources

echo "Creating datasource..."
curl -vv -# \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/datasource.json \
    ${GRAFANA_URL}/datasources


echo "Creating dashboard..."
curl -vv -# \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -d @/dashboard.json \
    ${GRAFANA_URL}/dashboards/db
