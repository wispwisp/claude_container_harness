#!/bin/bash

local_claude=$(pwd -P)/.claude
if [ ! -d "$local_claude" ]; then
    mkdir "$local_claude"
    echo "Created: $local_claude"
else
    echo "Already exists: $local_claude Use it."
fi

docker run --rm -it \
       -u $(id -u):$(id -g) \
       --network host \
       -e https_proxy="http://127.0.0.1:8080" \
       -e http_proxy="http://127.0.0.1:8080" \
       -v $(pwd -P):/home/claudeuser/workspace \
       -v $local_claude:/home/claudeuser/.claude \
       claude-agent

