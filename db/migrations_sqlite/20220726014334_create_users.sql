-- migrate:up

CREATE TABLE users (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user"	VARCHAR(145) NOT NULL,
  password	VARCHAR(145) NOT NULL,
	last_login	TIMESTAMP,
  worker_id	INT,
  activation_key VARCHAR(25),
  reset_key VARCHAR(25),
  FOREIGN KEY(worker_id) REFERENCES workers ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS users;