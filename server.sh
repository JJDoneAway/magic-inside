#!/bin/sh
lsof -i :8000 | awk 'NR>1 {print $2}' | xargs kill -9
# Start a local web server and clear browser cache
python3 -m http.server 8000 &

