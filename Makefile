.PHONY: config
config:
	rm -rf clickhouse01 clickhouse02
	mkdir -p clickhouse01 clickhouse02
	REPLICA=01 SHARD=01 envsubst < config.xml > clickhouse01/config.xml
	REPLICA=02 SHARD=01 envsubst < config.xml > clickhouse02/config.xml
	SHARD=01 envsubst < init.sql > clickhouse01/init.sql
	SHARD=02 envsubst < init.sql > clickhouse02/init.sql
	cp users.xml clickhouse01/users.xml
	cp users.xml clickhouse02/users.xml

.PHONY: up
up:
	docker-compose up -d

.PHONY: start
start:
	docker-compose start

.PHONY: down
down:
	docker-compose down
