#!/bin/bash

# Source the config
. /tmp/hive-xml-examples/conf/env.cfg

echo -e "\n###  Creating table $HIVE_XPATH_TABLE_NAME"
hive -e "DROP TABLE $HIVE_XPATH_TABLE_NAME IF EXISTS;"
hive -e 'CREATE EXTERNAL TABLE $HIVE_XPATH_TABLE_NAME (string xmldoc) LOCATION \'$SAMPLE_DATA_DIR\'';