-- migrate:up

CREATE TABLE service_types (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name	VARCHAR(40) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS service_types;