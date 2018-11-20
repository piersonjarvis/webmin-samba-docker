#!/bin/bash
apt-get update && apt-get upgrade -y
wait
if [ ! -f /data/webmin/config ];
then
cp /etc/samba/* /data/samba/. && cp /etc/webmin/* /data/webmin/.
fi
wait
ln -f /data/samba/* /etc/samba/ && ln -f /etc/webmin/* /data/webmin/
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
