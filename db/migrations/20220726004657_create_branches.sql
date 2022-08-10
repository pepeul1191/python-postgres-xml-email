-- migrate:up

CREATE TABLE branches (
	id	SERIAL PRIMARY KEY,
	name	VARCHAR(30) NOT NULL,
  address	VARCHAR(70) NOT NULL,
  phone	VARCHAR(25),
  whatsapp	VARCHAR(25),
  branch_type_id	INT,
  FOREIGN KEY(branch_type_id) REFERENCES branch_types ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS branches;