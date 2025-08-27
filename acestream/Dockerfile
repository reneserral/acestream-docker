FROM ubuntu:22.04
LABEL maintainer="Rene Serral <rserral@serralgarcia.com>"

ARG ACE_STREAM_VERSION
ENV ACE_STREAM_VERSION=${ACE_STREAM_VERSION:-3.2.3_ubuntu_22.04_x86_64_py3.10}

# Install all system and Python dependencies in a single layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Basic tools
    procps dos2unix curl \
    # Python environment
    python3 libpython3.10 python3-pip python3-setuptools python3-wheel \
    python3-greenlet python3-gevent python3-psutil python3-simplejson \
    # Build tools for Python modules
    build-essential python3-dev libsqlite3-dev libxml2-dev libxslt1-dev \
 && pip install --no-cache-dir \
    # Python modules required by Acestream
    apsw lxml PyNaCl requests pycryptodome isodate \
 && rm -rf /var/lib/apt/lists/*

RUN cd /home && curl --silent --insecure "https://download.acestream.media/linux/acestream_${ACE_STREAM_VERSION}.tar.gz" | \
        tar --extract --gzip
COPY acestream.conf /home/acestream.conf

EXPOSE 6878

ENTRYPOINT ["/home/start-engine"]
CMD ["--client-console"]
