-- migrate:up

ALTER TABLE users ALTER COLUMN last_login DROP NOT NULL;

-- migrate:down

-- ALTER TABLE users MODIFY last_login DATETIME NOT NULL;
