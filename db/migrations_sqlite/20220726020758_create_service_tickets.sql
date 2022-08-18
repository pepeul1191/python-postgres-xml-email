-- migrate:up

CREATE TABLE service_tickets (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  ticket_id	INT,
	FOREIGN KEY(ticket_id) REFERENCES tickets ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS service_tickets;