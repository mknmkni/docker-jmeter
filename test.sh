#!/bin/bash
#
# Test the JMeter Docker image using a trivial test plan.

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line
#export TARGET_HOST="www.map5.nl"
#export TARGET_PORT="80"
#export TARGET_PATH="/kaarten.html"
#export TARGET_KEYWORD="Kaartdiensten"

T_DIR=tests/trivial

# Reporting dir: start fresh
R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/test-plan.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

#./run.sh -Dlog_level.jmeter=DEBUG \
#	-JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT} \
#	-JTARGET_PATH=${TARGET_PATH} -JTARGET_KEYWORD=${TARGET_KEYWORD} \
#	-n -t ${T_DIR}/test-plan.jmx -l ${T_DIR}/test-plan.jtl -j ${T_DIR}/jmeter.log \
#	-e -o ${R_DIR}

# iSyn
./run.sh -Dlog_level.jmeter=DEBUG \
        -JTARGET_HOST=${TARGET_HOST} -JTARGET_PORT=${TARGET_PORT} \
        -JTARGET_PATH=${TARGET_PATH} -JTARGET_KEYWORD=${TARGET_KEYWORD} \
        -n -t ${T_DIR}/${JMX_FILENAME}.jmx -l ${T_DIR}/${JMX_FILENAME}.jtl -j ${T_DIR}/jmeter.log \
        -e -o ${R_DIR}

# JMeterClient の起動
#./run.sh -Dlog_level.jmeter=DEBUG \
#        -Djava.rmi.server.hostname=$(hostname -i | awk '{print $1}') \
#        -Dclient.rmi.localport=20001 \
#        -Dserver.rmi.ssl.disable=true \
#        -Jremote_hosts=10.178.51.155:20000 \
#        -Jmode=Statistical \
#        -n -t ${T_DIR}/${JMX_FILENAME}.jmx -l ${T_DIR}/${JMX_FILENAME}.jtl \
#        -j ${T_DIR}/jmeter.log \
#        -e -o ${R_DIR} -r -X

#echo "==== jmeter.log ===="
#cat ${T_DIR}/jmeter.log

#echo "==== Raw Test Report ===="
#cat ${T_DIR}/${JMX_FILENAME}.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"
