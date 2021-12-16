#!/bin/bash

curl http://enormously.tzconnect.berlin:8732/chains/main/blocks/$1 | jq '[.. | select(objects)|select(.operation_result?.status? == "applied") | .. | select(.kind? == "transaction") |  {source:.source, destination:.destination, amount:.amount}]' | ./insert.py $1
