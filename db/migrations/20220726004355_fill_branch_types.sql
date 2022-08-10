-- migrate:up

INSERT INTO branch_types (id, name) VALUES
  (1, 'LIMA'),
  (2, 'PROVINCIA');

-- migrate:down

TRUNCATE branch_types;