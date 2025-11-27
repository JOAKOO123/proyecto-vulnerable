#!/bin/bash

echo "Running OWASP ZAP Baseline Scan..."

docker pull owasp/zap2docker-weekly

docker run --rm \
  -v $(pwd)/reports/zap:/zap/reports \
  owasp/zap2docker-weekly \
  zap-baseline.py \
  -t http://host.docker.internal:5000 \
  -r zap-report.html
