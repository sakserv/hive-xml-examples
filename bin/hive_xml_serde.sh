#!/bin/bash

echo -e "\n###  Creating table $HIVE_XML_SERDE_TABLE_NAME"
hive -e "DROP TABLE IF EXISTS $HIVE_XML_SERDE_TABLE_NAME;"
hive -hiveconf TABLE_NAME=$HIVE_XML_SERDE_TABLE_NAME \
     -hiveconf TABLE_LOC=$HDFS_BASE_DIR \
     -auxpath $XML_SERDE_JAR \
     -f $SQL_BASE_DIR/xml_serde_test.sql


#echo -e "\n###  Querying $HIVE_XPATH_TABLE_NAME for xpath /catalog/book/author/text()"
#hive -e "select explode(xpath(xmldoc, '/catalog/book/author/text()')) FROM $HIVE_XML_SERDE_TABLE_NAME;"