-- migrate:up

INSERT INTO states (id, name) VALUES
  (1, 'ABIERTO'),
  (2, 'EN PROCESO'),
  (3, 'CANCELADO'),
  (4, 'CERRADO');

-- migrate:down

TRUNCATE states;