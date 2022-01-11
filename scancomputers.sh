#!/bin/bash
# ./scancomputers.sh <3 first octects of ip>
if [ $1 ]; then
ip=$1
for i in $(seq 1 255); do
timeout 1 bash -c "ping -c 1 $1.$i > /dev/null 2>&1" && echo "$ip.$i - Active" &
done; wait
else
echo -e "\nUse ./scancomputers.sh <3 first octects of ip>\n"
exit 1
fi
