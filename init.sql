CREATE DATABASE IF NOT EXISTS db_test;

DROP TABLE IF EXISTS db_test.replicated_table;
CREATE TABLE IF NOT EXISTS db_test.replicated_table
(
    `name` String,
    `date` Date
)
    ENGINE = ReplicatedMergeTree('/clickhouse/tables/db_test/replicated_table', '${SHARD}')
    PARTITION BY toYYYYMMDD(date)
    ORDER BY name;

DROP TABLE IF EXISTS db_test.simple_table;
CREATE TABLE IF NOT EXISTS db_test.simple_table
(
    `name` String,
    `date` Date
)
    ENGINE = MergeTree()
    PARTITION BY toYYYYMMDD(date)
    ORDER BY name;
