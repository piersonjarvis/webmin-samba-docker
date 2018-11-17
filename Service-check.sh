#!/bin/bash
apt-get update && apt-get upgrade -y
wait
service webmin start
service smbd start
service nmbd start
ln -s /data/samba /etc/samba
ln -s /data/webmin /etc/webmin
while true
do
if [[ $(service webmin status) = *stopped* ]]
then
break
else
sleep 5m
fi
done
