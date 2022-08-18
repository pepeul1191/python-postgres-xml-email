-- migrate:up

INSERT INTO positions (id, name) VALUES
  (1, 'ADMINISTRADOR'),
  (2, 'RECEPCIONISTA'),
  (3, 'SOPORTE TÉCNICO');

-- migrate:down

TRUNCATE positions;