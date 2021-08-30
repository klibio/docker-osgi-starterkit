#!/bin/bash
set -eux && scriptDir="$( cd $( dirname ${BASH_SOURCE[0]} ) >/dev/null 2>&1 && pwd )"

dataDir=${scriptDir}
mkdir -p ${dataDir} && cd ${dataDir}

# this script downloads and prepares the java runtime
JAVA_URL=https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.11%2B9/OpenJDK11U-jre_x64_linux_hotspot_11.0.11_9.tar.gz
javaArchive=$(echo "${JAVA_URL}" | sed "s/.*\///")
curl -LfsSo ${javaArchive} ${JAVA_URL} && tar -xvzf ${javaArchive}
rm -rf $javaArchive
JavaURLdecoded=$(echo "$JAVA_URL" | sed "s/%2B/+/")
javaDir=$(echo "${JavaURLdecoded}" | sed "s/.*\/\(.*\)\/.*/\1/")
mv ${javaDir}-jre jre
export JAVA_HOME=${dataDir}/jre
export PATH="${JAVA_HOME}/bin:$PATH"
java -version
cd $scriptDir
