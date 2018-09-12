# webmin-samba-docker
Docker container based on ubuntu running a samba server, with a webmin webui.



This container was build with simplisity in mind. 

To run this container all you need to do is pass port 80 on the host to port 80 on the contrainer, and mount the volume you wish to share to /media/storage on the container.

Example: docker run -d -p 80:80 -v /path/on/host:/media/storage piersonjarvis/webmin-samba
