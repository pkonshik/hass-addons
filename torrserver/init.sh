#!/usr/bin/env bashio

TS_CONF_PATH=$(bashio::config 'ts_conf_path')
bashio::log.info "TS_CONF_PATH = ${TS_CONF_PATH}"
TS_LOG_PATH=$(bashio::config 'ts_log_path')
bashio::log.info "TS_LOG_PATH = ${TS_LOG_PATH}"
TS_TORR_DIR=$(bashio::config 'ts_torr_dir')
bashio::log.info "TS_TORR_DIR = ${TS_TORR_DIR}"


export TS_CONF_PATH TS_LOG_PATH TS_TORR_DIR

bashio::log.info "Calling native CMD"
/docker-entrypoint.sh
