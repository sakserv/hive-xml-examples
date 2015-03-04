#!/bin/bash

# Source the config
. /tmp/hive-xml-examples/conf/env.cfg

echo -e "\n###  Creating table $HIVE_XPATH_TABLE_NAME"
hive -e "DROP TABLE IF EXISTS $HIVE_XPATH_TABLE_NAME;"
hive -e "CREATE EXTERNAL TABLE $HIVE_XPATH_TABLE_NAME (xmldoc STRING) LOCATION '$HDFS_BASE_DIR'";


echo -e "\n###  Querying $HIVE_XPATH_TABLE_NAME for xpath /catalog/book/author/text()"
hive -e "select explode(xpath(xmldoc, '/catalog/book/author/text()')) FROM hive_xpath_test;"