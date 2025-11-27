#!/bin/bash

echo "Running OWASP ZAP Baseline Scan..."

docker pull ghcr.io/zaproxy/zaproxy:weekly

docker run --rm \
  -v $(pwd)/reports/zap:/zap/reports \
  ghcr.io/zaproxy/zaproxy:weekly \
  zap-baseline.py \
  -t http://host.docker.internal:5000 \
  -r zap-report.html
