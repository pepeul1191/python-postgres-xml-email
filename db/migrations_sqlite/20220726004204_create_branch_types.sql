-- migrate:up

CREATE TABLE branch_types (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name	VARCHAR(11) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS branch_types;