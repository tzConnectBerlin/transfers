CREATE SCHEMA IF NOT EXISTS transfers;

CREATE TABLE IF NOT EXISTS transfers.transfers
(
    id integer NOT NULL DEFAULT nextval('transfers_id_seq'::regclass),
    block_height bigint,
    source text COLLATE pg_catalog."default",
    destination text COLLATE pg_catalog."default",
    amount numeric(18,0),
    opg text COLLATE pg_catalog."default",
    CONSTRAINT transfers_pkey PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS transfers_block_height_idx
    ON transfers.transfers USING btree
    (block_height ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS transfers_destination_idx
    ON transfers.transfers USING btree
    (destination COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS transfers_opg_idx
    ON transfers.transfers USING btree
    (opg COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS transfers_source_idx
    ON transfers.transfers USING btree
    (source COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;