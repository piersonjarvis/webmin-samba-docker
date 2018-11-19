# webmin-samba-docker
Docker container based on ubuntu running a samba server, with a webmin webui.

This container was build with simplisity in mind. 

To run this container all you need to do is pass port 80 on the host to port 80 on the contrainer, and mount the volume you wish to share to /media/storage on the container.

Example: docker run -d -p 80:80 -p 139:139 -p 445:445 -v /path/on/host:/media/storage piersonjarvis/webmin-samba

config files are stored in /data. Add -v /path/on/host:/data to the docker run command to make the configuration files availble for edit on the host. 
