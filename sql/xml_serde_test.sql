CREATE EXTERNAL TABLE ${hiveconf:TABLE_NAME} (id STRING, author STRING, title STRING, price FLOAT)
ROW FORMAT SERDE 'com.ibm.spss.hive.serde2.xml.XmlSerDe' 
WITH SERDEPROPERTIES (
"column.xpath.id"="/book/@id",
"column.xpath.author"="/book/author/text()",
"column.xpath.title"="/book/title/text()",
"column.xpath.price"="/book/price/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
TBLPROPERTIES (
"xmlinput.start"="<book id",
"xmlinput.end"="</book>"
);
LOCATION '${hiveconf:TABLE_LOC}'