-- migrate:up

CREATE TABLE positions (
	id	SERIAL PRIMARY KEY,
	name	VARCHAR(25) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS positions;