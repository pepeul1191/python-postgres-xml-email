-- migrate:up

CREATE TABLE service_types (
	id	SERIAL PRIMARY KEY,
	name	VARCHAR(40) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS service_types;