-- migrate:up

INSERT INTO ticket_types (id, name) VALUES
  (1, 'SERVICIOS'),
  (2, 'INCIDENCIAS'),
  (3, 'SERVICIO TÉCNICO');

-- migrate:down

TRUNCATE ticket_types;