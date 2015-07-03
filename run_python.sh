#!/bin/sh

HOST_IP="172.17.42.1"

echo "$*" >> /tmp/output.txt

echo "$*" | grep -E "client.+0\.0\.0\.0.+--port" &> /dev/null

if [ $? -eq 0 ]; then
	echo 'Manipulating host. Params: ' >> /tmp/output_log.txt

	eval python $(echo "$@" | sed 's/0\.0\.0\.0/${HOST_IP}/')
else 
	python "$@"
fi