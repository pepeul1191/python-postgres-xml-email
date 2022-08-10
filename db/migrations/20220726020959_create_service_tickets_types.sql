-- migrate:up

CREATE TABLE service_tickets_types (
	id	SERIAL PRIMARY KEY,
  service_ticket_id	INT,
  service_type_id	INT,
  FOREIGN KEY(service_ticket_id) REFERENCES service_tickets ( id ) ON DELETE CASCADE,
  FOREIGN KEY(service_type_id) REFERENCES service_types ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS service_tickets_types;