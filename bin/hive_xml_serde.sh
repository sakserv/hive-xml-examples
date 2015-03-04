#!/bin/bash

# Source the config
. /tmp/hive-xml-examples/conf/env.cfg

echo -e "\n###  Creating table $HIVE_XML_SERDE_TABLE_NAME"
hive -e "DROP TABLE IF EXISTS $HIVE_XML_SERDE_TABLE_NAME;"
hive --auxpath $XML_SERDE_JAR \
     -hiveconf TABLE_NAME=$HIVE_XML_SERDE_TABLE_NAME \
     -hiveconf TABLE_LOC=$HDFS_BASE_DIR \
     -f $SQL_BASE_DIR/xml_serde_test.sql


echo -e "\n###  Querying $HIVE_XML_SERDE_TABLE_NAME for id and price"
hive --auxpath $XML_SERDE_JAR -e "select id,price from $HIVE_XML_SERDE_TABLE_NAME;"
