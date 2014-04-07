# apt-cacher container

tired of waiting for your container to install the same old debs over and over again?
lacking internet?

plug in this container and point your client docker containers at a pul-through deb cache.


build/run the server with

    docker build -t apt-cacher .
    docker run -d -p 3142:3142 -v /some/path/to/cached/packages:/var/cache/apt-cacher/packages --name apt-cacher apt-cacher

and configure clients with

    echo 'Acquire::http::Proxy "http://10.0.42.1:3142";' > /etc/apt/apt.conf.d/01proxy
    apt-get update


(sub 10.0.42.1 with the IP of your dockerd host)
