#!/usr/bin/env bash
docker run --rm -d -P -p 2222:22 -v ~/.ssh:/home/builder/.ssh --name ssh ssh
