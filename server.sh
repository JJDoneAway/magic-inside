#!/bin/sh

# Start a local web server and clear browser cache
python3 -m http.server 8000 &
SERVER_PID=$!

# Watch for changes in the workspace and refresh the browser
fswatch -o . | while read f; do
    kill -HUP $SERVER_PID
    python3 -m http.server 8000 &
    SERVER_PID=$!
    echo "Server refreshed due to changes."
    curl -X PURGE http://localhost:8000
done