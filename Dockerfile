FROM tianon/centos:latest

ADD supervisord.conf /supervisord.conf
ADD mongodb.repo /etc/yum.repos.d/mongodb.repo

RUN	yum install -y python-setuptools mongodb-org && \ 
	easy_install supervisor && \ 
	mkdir /data && \ 
	mkdir /logs 

VOLUME [ "/logs" ]
VOLUME [ "/data" ]

EXPOSE 27017
EXPOSE 28017

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf", "-n"]
