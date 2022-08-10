-- migrate:up

CREATE TABLE branch_types (
	id	SERIAL PRIMARY KEY,
	name	VARCHAR(11) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS branch_types;