-- migrate:up

ALTER TABLE workers
ADD image_url VARCHAR(100);
UPDATE workers SET image_url = 'default-user.png'

-- migrate:down

ALTER TABLE workers
DROP COLUMN image_url; 