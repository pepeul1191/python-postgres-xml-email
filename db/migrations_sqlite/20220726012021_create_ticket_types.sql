-- migrate:up

CREATE TABLE ticket_types (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name	VARCHAR(25) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS ticket_types;