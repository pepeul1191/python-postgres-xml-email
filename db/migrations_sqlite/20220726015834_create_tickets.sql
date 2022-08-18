-- migrate:up

CREATE TABLE tickets (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  created	TIMESTAMP NOT NULL,
  edited TIMESTAMP,
	resume	VARCHAR(30) NOT NULL,
  description	TEXT NOT NULL,
  worker_id	INT,
  priority_id	INT,
  branch_id	INT,
  state_id	INT,
  ticket_type_id	INT,
  FOREIGN KEY(worker_id) REFERENCES workers ( id ) ON DELETE CASCADE,
  FOREIGN KEY(priority_id) REFERENCES priorities ( id ) ON DELETE CASCADE,
  FOREIGN KEY(branch_id) REFERENCES branches ( id ) ON DELETE CASCADE,
  FOREIGN KEY(state_id) REFERENCES states ( id ) ON DELETE CASCADE,
  FOREIGN KEY(ticket_type_id) REFERENCES ticket_types ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS tickets;