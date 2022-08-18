-- migrate:up

INSERT INTO priorities (id, name) VALUES
  (1, 'ALTO'),
  (2, 'MEDIO'),
  (3, 'BAJO');

-- migrate:down

TRUNCATE priorities;