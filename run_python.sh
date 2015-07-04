#!/bin/sh

num=0

if [ -f /tmp/counter.txt ]; then
	num=$(cat /tmp/counter)
fi

echo "$*" >> /tmp/output.txt

echo "$*" | grep -E "import\ssocket.*socket\.socket\(socket\.AF_INET" &> /dev/null

if [ $? -eq 0 ]; then

	mod=$((num%2))

	if [ $mod -eq 0 ]; then
		echo "('0.0.0.0', 21000)" | tee -a /tmp/output_response.txt
	else
		echo "('0.0.0.0', 21001)" | tee -a /tmp/output_response.txt
	fi

	num=$((num+1))
	echo "$num" > /tmp/counter
else
	python "$@" | tee -a /tmp/output_response.txt
fi