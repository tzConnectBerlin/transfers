#!/bin/bash

CHAIN_HEAD=`curl --silent http://localhost:8732/chains/main/blocks/head|jq .header.level`
DB_HEAD=`psql -t -h localhost -U quepasa tezos -c 'select max(block_height) from transfers'`

echo $CHAIN_HEAD $DB_HEAD

for i in `seq $DB_HEAD $CHAIN_HEAD`; do ./load-block.sh $i; done
