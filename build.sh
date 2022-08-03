#!/bin/bash

JMETER_VERSION="5.4.3"
IMAGE_TIMEZONE="Asia/Tokyo"

# Example build line
#docker build --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg TZ=${IMAGE_TIMEZONE} -t "justb4/jmeter:${JMETER_VERSION}" .

docker build --build-arg JMETER_VERSION=${JMETER_VERSION} --build-arg TZ=${IMAGE_TIMEZONE} --build-arg http_proxy=http://${USER}:${PASSWORD}@${HOST}:${PORT} --build-arg https_proxy=http://${USER}:${PASSWORD}@${HOST}:${PORT}-t "justb4/jmeter:${JMETER_VERSION}" .
