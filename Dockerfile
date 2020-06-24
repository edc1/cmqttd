ARG BUILD_FROM=hassioaddons/base:latest
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# COPY rootfs /

COPY run.sh /
RUN chmod a+x /run.sh
RUN apk add --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    py3-wheel \
    git \
    gcc \
    g++ \
    libxml2 \
    libxml2-dev \
    libxslt \
    libxslt-dev \
    musl \
    musl-dev
RUN git clone -b master https://github.com/micolous/cbus.git && cd cbus && pip3 install -r requirements.txt && python3 setup.py install

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
    io.hass.name="CBus MQTT Bridge" \
    io.hass.description="Connect a Clpsal CBus network to an MQTT broker" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="CMQTTD <cmqttd@dotdashdash.co.uk>" \
    org.opencontainers.image.title="CBus MQTT Bridge" \
    org.opencontainers.image.description="Connect a Clpsal CBus network to an MQTT broker" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="CMQTTD <cmqttd@dotdashdash.co.uk>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/hassio-addons/cmqttd" \
    org.opencontainers.image.documentation="https://github.com/hassio-addons/cmqttd/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

CMD [ "/run.sh" ]
