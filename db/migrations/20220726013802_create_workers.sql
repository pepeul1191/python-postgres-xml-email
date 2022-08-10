-- migrate:up

CREATE TABLE workers (
	id	SERIAL PRIMARY KEY,
  names	VARCHAR(45) NOT NULL,
  last_names	VARCHAR(45) NOT NULL,
	email	VARCHAR(45) NOT NULL,
  phone	VARCHAR(25),
  position_id	INT,
  FOREIGN KEY(position_id) REFERENCES positions ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS workers;