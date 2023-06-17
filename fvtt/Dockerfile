ARG BUILD_FROM
FROM ${BUILD_FROM}

# Build arguments
ARG BASHIO_VERSION
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

VOLUME ["/share", "/ssl", "/media"]

# install bashio to parse config
RUN set -o pipefail \
    && apk add --no-cache --virtual .build-dependencies tar=1.34-r3 \
    && apk add --no-cache bash \
    && mkdir -p /usr/src/bashio \
    && curl -L -f -s "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz" \
    | tar -xzf - --strip 1 -C /usr/src/bashio \
    && mv /usr/src/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && apk del --no-cache --purge .build-dependencies \
    && rm -f -r /tmp/*

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="pkonshik@gmail.com" \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}"

# Copy data for add-on
COPY init.sh /
RUN chmod a+x /init.sh

# Need to override original ENTRYPOINT & CMD call from the FVTT container
# in order to pass properties from config and setup env variables for further FVTT run
# We can not rely on the original scripts since they are using hardcoded values which we want to adjust
ENTRYPOINT ["/init.sh"]
CMD ["resources/app/main.mjs",  "--port=30000",  "--headless", "--noupdate"]
