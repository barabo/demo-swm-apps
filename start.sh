#!/bin/bash
set -e
set -u
set -x

killall live-server || true
cd "${0%start.sh}./"
cd ehr
live-server --cors --port=8000 &
cd ../app
live-server --cors --port=8001 &
cd ..
trap "echo cancelled; killall live-server" SIGINT
wait
