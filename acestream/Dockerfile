FROM ubuntu:20.04
LABEL maintainer="Rene Serral <rserral@gmail.com>"

ARG ACE_STREAM_VERSION
ENV ACE_STREAM_VERSION=${ACE_STREAM_VERSION:-3.1.75rc4_ubuntu_18.04_x86_64_py3.8}

RUN DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && apt-get --yes upgrade && \
    apt-get --no-install-recommends --yes install \
	curl \
	libpython3.8 \
        gzip \
	net-tools \
        python3-apsw \
	python3-lxml \
	python3-m2crypto \
	python3-pkg-resources
RUN apt-get clean && rm --force --recursive /var/lib/apt/lists

RUN curl --silent --insecure "https://download.acestream.media/linux/acestream_${ACE_STREAM_VERSION}.tar.gz" | \
        tar --extract --gzip

EXPOSE 6878/tcp

ENTRYPOINT ["/start-engine"]
CMD ["--client-console"]
