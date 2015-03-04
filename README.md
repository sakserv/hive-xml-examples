# hive-xml-examples

A collection of examples of working with XML with Hive

Setup:
------

* Clone the project
```
cd /tmp && git clone https://github.com/sakserv/hive-xml-examples.git
```

* Ingest the sample data
```
cd /tmp/hive-xml-examples && bash -x bin/ingest_data.sh
```

XML XPath UDF Example:
----------------------
* Create and query the table
```
cd /tmp/hive-xml-examples && bash -x bin/hive_xpath_udf.sh
```
