#!/usr/bin/env python3

#!/usr/bin/env python3

import os

import io
import json
import psycopg2
import sys

DB_HOST = 'localhost'
DB_USER = 'quepasa'
DB_PASSWORD = 'quepasa'
DB_NAME = 'tezos'

def connect_db():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD)

def insert_transfer(cur, block_height, deets):
    print(deets)
    cur.execute("INSERT INTO transfers(block_height, source, destination, amount, opg)  VALUES (%s, %s, %s, %s, %s);",
                (block_height, deets['source'],
                 deets['destination'], deets['amount'],
                 deets['opg']))


if __name__ == '__main__':
    block = int(sys.argv[1])
    conn = connect_db()
    cur = conn.cursor()
    data = sys.stdin.read()
    print(data)
    all_transfers = json.loads(data)
    for transfer in all_transfers:
        insert_transfer(cur, block, transfer)
    conn.commit();
