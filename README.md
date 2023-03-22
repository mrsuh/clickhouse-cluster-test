# Clickhouse Cluster

```bash
make config up
````

```bash
echo "INSERT INTO db_test.replicated_table VALUES ('replicated', '2000-01-01')" | curl -H 'Transfer-Encoding: chunked' 'http://127.0.0.1:8123/' --data-binary @- -vvv
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to 127.0.0.1 (127.0.0.1) port 8123 (#0)
> POST / HTTP/1.1
> Host: 127.0.0.1:8123
> User-Agent: curl/7.64.1
> Accept: */*
> Transfer-Encoding: chunked
> Content-Type: application/x-www-form-urlencoded
> 
> 49
* upload completely sent off: 80 out of 73 bytes
< HTTP/1.1 200 OK
< Date: Wed, 22 Mar 2023 13:16:21 GMT
< Connection: Keep-Alive
< Content-Type: text/plain; charset=UTF-8
< X-ClickHouse-Server-Display-Name: clickhouse01
< Transfer-Encoding: chunked
< Keep-Alive: timeout=3
< X-ClickHouse-Summary: {"read_rows":"1","read_bytes":"21","written_rows":"1","written_bytes":"21","total_rows_to_read":"0","result_rows":"1","result_bytes":"21"}
< 
* Connection #0 to host 127.0.0.1 left intact
* Closing connection 0



echo "INSERT INTO db_test.simple_table VALUES ('simple', '2000-01-01')" | curl -H 'Transfer-Encoding: chunked' 'http://127.0.0.1:8123/' --data-binary @- -vvv
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to 127.0.0.1 (127.0.0.1) port 8123 (#0)
> POST / HTTP/1.1
> Host: 127.0.0.1:8123
> User-Agent: curl/7.64.1
> Accept: */*
> Transfer-Encoding: chunked
> Content-Type: application/x-www-form-urlencoded
> 
> 41
* upload completely sent off: 72 out of 65 bytes
< HTTP/1.1 200 OK
< Date: Wed, 22 Mar 2023 13:16:32 GMT
< Connection: Keep-Alive
< Content-Type: text/plain; charset=UTF-8
< X-ClickHouse-Server-Display-Name: clickhouse01
< Transfer-Encoding: chunked
< Keep-Alive: timeout=3
< X-ClickHouse-Summary: {"read_rows":"1","read_bytes":"17","written_rows":"1","written_bytes":"17","total_rows_to_read":"0","result_rows":"1","result_bytes":"17"}
< 
* Connection #0 to host 127.0.0.1 left intact
* Closing connection 0
```

```bash
docker logs -f clickhouse01 2>&1 | grep "Got an HTTP request with no content length"
2023.03.22 16:13:14.067399 [ 261 ] {} <Warning> HTTPServerRequest: Got an HTTP request with no content length and no chunked/multipart encoding, it may be impossible to distinguish graceful EOF from abnormal connection loss
```
