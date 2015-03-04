set hive.support.concurrency=true;
set hive.enforce.bucketing=true;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT INTO TABLE ${hiveconf:TABLE_NAME} PARTITION(publish_date)
SELECT id,author,title,price FROM ${hiveconf:SOURCE_TABLE_NAME};