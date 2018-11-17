FROM ubuntu
EXPOSE 80 139 445
WORKDIR /
COPY Service-check.sh .
RUN apt-get update && apt-get upgrade -y
RUN apt-get install apt-transport-https wget samba samba-common -y && \
mkdir /media/storage /data /data/samba /data/webmin && \
chmod 0777 /media/storage /data /data/samba /data/webmin

RUN echo "deb https://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list && \
cd /root && \
wget http://www.webmin.com/jcameron-key.asc && \
apt-key add jcameron-key.asc 

RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes && \
apt-get purge apt-show-versions -y && \
rm /var/lib/apt/lists/*lz4 && \
apt-get -o Acquire::GzipIndexes=false update -y

RUN apt-get update && apt-get install webmin -y

RUN sed -i 's/10000/80/g' /etc/webmin/miniserv.conf && \
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf 

RUN echo root:webmin | chpasswd
VOLUME /data
CMD [ "/bin/bash","/Service-check.sh" ]
