#!/bin/bash

TARGET="http://vulnerable-app:5000"

docker run --rm -v $(pwd)/reports/zap:/zap/reports owasp/zap2docker-stable zap-baseline.py \
    -t http://host.docker.internal:5000 \
    -r zap-report.html
