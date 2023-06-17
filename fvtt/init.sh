#!/usr/bin/env bashio

FOUNDRY_VERSION=$(bashio::config 'foundry_version')
bashio::log.info "FOUNDRY_VERSION = ${FOUNDRY_VERSION}"
CONTAINER_PRESERVE_CONFIG=$(bashio::config 'container_preserve_config')
bashio::log.info "CONTAINER_PRESERVE_CONFIG = ${CONTAINER_PRESERVE_CONFIG}"
FOUNDRY_VTT_DATA_PATH=$(bashio::config 'foundry_vtt_data_path')
bashio::log.info "FOUNDRY_VTT_DATA_PATH = ${FOUNDRY_VTT_DATA_PATH}"
CONTAINER_CACHE=$(bashio::config 'container_cache')
bashio::log.info "CONTAINER_CACHE = ${CONTAINER_CACHE}"
FOUNDRY_SSL_CERT=$(bashio::config 'certfile')
bashio::log.info "FOUNDRY_SSL_CERT = ${FOUNDRY_SSL_CERT}"
FOUNDRY_SSL_KEY=$(bashio::config 'keyfile')
bashio::log.info "FOUNDRY_SSL_KEY = ${FOUNDRY_SSL_KEY}"

export CONTAINER_PRESERVE_CONFIG FOUNDRY_VTT_DATA_PATH CONTAINER_CACHE FOUNDRY_SSL_CERT FOUNDRY_SSL_KEY FOUNDRY_VERSION

bashio::log.info "Calling native entrypoint with the following arguments" "$@" "--dataPath=${FOUNDRY_VTT_DATA_PATH}"
./entrypoint.sh "$@" "--dataPath=${FOUNDRY_VTT_DATA_PATH}"
