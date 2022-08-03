#!/bin/bash
#
# Run JMeter Docker image with options

NAME="jmeter"
JMETER_VERSION="5.4.3"
IMAGE="justb4/jmeter:${JMETER_VERSION}"

# Finally run
#docker run --rm --name ${NAME} -e http_proxy=${PROXY_URL} -e https_proxy=${PROXY_URL} -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@
#docker run --rm --user 1000:1000 --name ${NAME} --network=external-jmeter -i -v ${PWD}:${PWD} -w ${PWD} -p20001:20001 -p20002:20002 -p20003:20003 ${IMAGE} $@
docker run --rm --user 1000:1000 --name ${NAME} --network=external-jmeter -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} $@
