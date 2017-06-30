
CREATE TABLE T1(key STRING, value STRING) STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH '../../data/files/kv1.txt' INTO TABLE T1;
LOAD DATA LOCAL INPATH '../../data/files/kv2.txt' INTO TABLE T1;


CREATE TABLE T2(key STRING, value STRING);

EXPLAIN 
INSERT OVERWRITE TABLE T2 SELECT * FROM (SELECT * FROM T1 DISTRIBUTE BY key) T ORDER BY key, value LIMIT 20;

INSERT OVERWRITE TABLE T2 SELECT * FROM (SELECT * FROM T1 DISTRIBUTE BY key) T ORDER BY key, value LIMIT 20;

SELECT * FROM T2 ORDER BY key, value;



