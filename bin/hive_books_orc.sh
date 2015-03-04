#!/bin/bash

# Source the config
. /tmp/hive-xml-examples/conf/env.cfg

echo -e "\n###  Creating table $HIVE_BOOKS_ORC_TABLE_NAME"
hive -e "DROP TABLE IF EXISTS $HIVE_BOOKS_ORC_TABLE_NAME;"
hive --auxpath $XML_SERDE_JAR \
     -hiveconf TABLE_NAME=$HIVE_BOOKS_ORC_TABLE_NAME \
     -hiveconf TABLE_LOC=$HDFS_BOOKS_ORC_DIR \
     -f $SQL_BASE_DIR/books_orc_test_xml_serde.sql
     
     
echo -e "\n###  Populate the table from $HIVE_XML_SERDE_TABLE_NAME"
hive --auxpath $XML_SERDE_JAR \
     -hiveconf TABLE_NAME=$HIVE_BOOKS_ORC_TABLE_NAME \
     -hiveconf SOURCE_TABLE_NAME=$HIVE_XML_SERDE_TABLE_NAME \
     -f $SQL_BASE_DIR/books_orc_insert_into.sql