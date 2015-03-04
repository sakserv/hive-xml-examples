set hive.support.concurrency=true;
set hive.enforce.bucketing=true;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;


CREATE EXTERNAL TABLE ${hiveconf:TABLE_NAME} (id STRING, author STRING, title STRING, price FLOAT)
PARTITIONED BY (publish_date STRING)
CLUSTERED BY (id) INTO 16 BUCKETS
STORED AS ORC tblproperties("orc.compress"="ZLIB")
LOCATION '${hiveconf:TABLE_LOC}';