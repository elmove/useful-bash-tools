#!/bin/bash
# ./portscan.sh <ip-address>
if [ $1 ]; then
	ip=$1
for port in $(seq 1 65535); do
	timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "Port $port - open"
done; wait
else
	echo -e "\nUse ./portscan.sh ip\n"
exit 1
fi
