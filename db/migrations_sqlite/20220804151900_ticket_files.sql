-- migrate:up

CREATE TABLE ticket_files (
	id	SERIAL PRIMARY KEY,
  description	VARCHAR(150) NOT NULL,
  url	VARCHAR(60) NOT NULL,
  ticket_id INTEGER NOT NULL,
  FOREIGN KEY (ticket_id) REFERENCES tickets(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS ticket_files;