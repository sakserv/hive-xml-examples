#!/bin/bash

# Source the config
. /tmp/hive-xml-examples/conf/env.cfg

# Create the base dir in HDFS
echo -e "\n###  Creating $HDFS_BASE_DIR in HDFS"
if hdfs dfs -test -d $HDFS_BASE_DIR; then
  hdfs dfs -rm -r $HDFS_BASE_DIR
fi
hdfs dfs -mkdir $HDFS_BASE_DIR

# Ingest the data
echo -e "\n### Ingesting the sample data"
#hdfs dfs -put $SAMPLE_DATA_DIR/auctions.xml $HDFS_BASE_DIR
hdfs dfs -put $SAMPLE_DATA_DIR/books.xml $HDFS_BASE_DIR
