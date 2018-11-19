#!/bin/bash
unison -batch /etc/samba /data/samba 
unison -batch /etc/webmin /data/webmin
apt-get update && apt-get upgrade -y
wait
service webmin start
service smbd start
service nmbd start
while true
do
if [[ $(service webmin status) = *stopped* ]]
then
break
else
sleep 5m
fi
done
