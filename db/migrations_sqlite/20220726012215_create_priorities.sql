-- migrate:up

CREATE TABLE priorities (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name	VARCHAR(25) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS priorities;