FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qy apt-cacher apache2
RUN echo 'allowed_hosts = *' >> /etc/apt-cacher/apt-cacher.conf
RUN echo 'denied_hosts = ' >> /etc/apt-cacher/apt-cacher.conf

EXPOSE 3142

VOLUME ["/var/cache/apt-cacher/packages"]

CMD ["apt-cacher"]
