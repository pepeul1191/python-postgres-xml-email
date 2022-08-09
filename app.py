from postgres import Postgres

db = Postgres(url="postgres://root:123@127.0.0.1:5432/tickets?sslmode=disable")

workers = db.all("SELECT * FROM workers;")
print(workers[0].names)