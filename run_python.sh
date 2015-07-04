#!/bin/sh

echo "$*" >> /tmp/output.txt

echo "$*" | grep -E "client.+0\.0\.0\.0.+--port" &> /dev/null

if [ $? -eq 0 ]; then
	echo "Adding debug messages"
	python "${@:1:2}" --DEBUG "${@:3}" | tee -a /tmp/output_response.txt
else
	python "$@" | tee -a /tmp/output_response.txt
fi