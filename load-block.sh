#!/bin/bash

curl http://enormously.tzconnect.berlin:8732/chains/main/blocks/$1 | jq '[.. | select(objects)|.hash as $opg | select(has("contents")) | .contents | map(select(.metadata?.operation_result?.status? == "applied")) | .. | select(.kind? == "transaction") | select(.amount != "0") | {$opg, source, destination, amount}]' | ./insert.py $1
