FROM adoptopenjdk/openjdk11:jre-11.0.11_9-debianslim

ARG VERSION=0.1.0
ARG BUILD_DATE
ARG VCS_REF

LABEL org.opencontainers.image.authors="dev@klib.io" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION.$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/klibio/io.klib.docker.osgi-starterkit" \
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

COPY setup_* /data
RUN set -eux; \
    cd /data && \
    ./setup_01_java.sh && \
    ./setup_02_osgi-starterkit.sh

CMD ["data/osgi/rt"]