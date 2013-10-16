CREATE TABLE test (
	id smallint NOT NULL,
    name character varying(256) NOT NULL,
    price numeric(6,2) DEFAULT 0 NOT NULL
);

ALTER TABLE ONLY test ADD CONSTRAINT test_primary_key PRIMARY KEY(id);
