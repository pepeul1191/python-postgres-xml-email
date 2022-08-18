-- migrate:up

CREATE TABLE branches_workers (
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  worker_id	INT,
  branch_id	INT,
  FOREIGN KEY(worker_id) REFERENCES workers ( id ) ON DELETE CASCADE,
  FOREIGN KEY(branch_id) REFERENCES branches ( id ) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS branches_workers;