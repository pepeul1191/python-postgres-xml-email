-- migrate:up

CREATE TABLE tickets (
	id	SERIAL PRIMARY KEY,
  created	TIMESTAMP NOT NULL,
  edited TIMESTAMP,
	resume	VARCHAR(30) NOT NULL,
  description	TEXT NOT NULL,
  worker_id	INT,
  FOREIGN KEY(worker_id) REFERENCES workers ( id ) ON DELETE CASCADE,
  priority_id	INT,
  FOREIGN KEY(priority_id) REFERENCES priorities ( id ) ON DELETE CASCADE,
  branch_id	INT,
  FOREIGN KEY(branch_id) REFERENCES branches ( id ) ON DELETE CASCADE,
  state_id	INT,
  FOREIGN KEY(state_id) REFERENCES states ( id ) ON DELETE CASCADE,
  ticket_type_id	INT,
  FOREIGN KEY(ticket_type_id) REFERENCES ticket_types ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS tickets;