FROM ubuntu:22.04
LABEL maintainer="Rene Serral <rserral@serralgarcia.com>"

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV ACE_STREAM_VERSION=3.2.3_ubuntu_22.04_x86_64_py3.10

# Install all system and Python dependencies in a single layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    procps dos2unix curl \
    python3 libpython3.10 python3-pip python3-setuptools python3-wheel \
    python3-greenlet python3-gevent python3-psutil python3-simplejson \
    build-essential python3-dev libsqlite3-dev libxml2-dev libxslt1-dev \
 && pip install --no-cache-dir \
    apsw lxml PyNaCl requests pycryptodome isodate \
 && rm -rf /var/lib/apt/lists/* && cd /home && \
    curl --silent --insecure "https://download.acestream.media/linux/acestream_${ACE_STREAM_VERSION}.tar.gz" | \
        tar --extract --gzip

COPY acestream.conf /home/acestream.conf

EXPOSE 6878

ENTRYPOINT ["/home/start-engine"]
CMD ["--client-console"]
