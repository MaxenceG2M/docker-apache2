FROM phusion/baseimage:0.9.15

# Install apache2
RUN apt-get -qqy update \
	&& apt-get -qqy install apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

VOLUME ["/var/www"]
VOLUME ["/etc/apache2"]

EXPOSE 80
EXPOSE 443

# Change root password for easy SSH connection
# BE CAREFUL! DO NOT EXPOSE PORT 22 ON INTERNET !
RUN echo 'root:root' | chpasswd

ADD daemons/apache2.sh /etc/service/apache2/run

CMD ["/sbin/my_init"]
