#!/bin/bash

# Source the config
. /tmp/hive-xml-examples/conf/env.cfg

echo -e "\n###  Creating table $HIVE_XPATH_TABLE_NAME"
hive -e "DROP TABLE IF EXISTS $HIVE_XPATH_TABLE_NAME;"
hive -e "CREATE EXTERNAL TABLE $HIVE_XPATH_TABLE_NAME (xmldoc STRING) LOCATION $SAMPLE_DATA_DIR";