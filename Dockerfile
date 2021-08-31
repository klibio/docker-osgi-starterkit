FROM debian:buster-slim

ARG VERSION=NOT-SET
ARG BUILD_DATE=NOT-SET
ARG VCS_REF=NOT-SET

LABEL org.opencontainers.image.authors="dev@klib.io" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION.$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/klibio/docker-osgi-starterkit" \
      org.label-schema.vcs-ref=$VCS_REF

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata curl ca-certificates fontconfig locales unzip nano\
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 app && \
    useradd --home-dir /data --shell /bin/bash --uid 1000 --gid 1000 app && \
    mkdir -p /data && \
    echo $VERSION.$BUILD_DATE > /data/build_$VERSION.$BUILD_DATE.txt

COPY version.txt /data
ADD resources/data /data
RUN cd /data && \
    ./setup_01_java.sh && \
    ./setup_02_osgi-starterkit.sh
ENV PATH=/data/jre/bin:$PATH

CMD ["data/osgi/rt"]