-- migrate:up

CREATE TABLE ticket_types (
	id	SERIAL PRIMARY KEY,
	name	VARCHAR(25) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS ticket_types;