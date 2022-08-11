# Python Postgres a XML

Instalar y activar el ambiente virtual:

    $ sudo apt install python3-virtualenv python3-venv
    $ python3 -m venv ./env
    $ source env/bin/activate

Arrancar aplicación con servidor Werkzeug:

    $ cd <<carpeta-proyecto>>
    $ pip install -r requirements.txt
    $ mkdir tmp
    $ python app.py

En Windows:

    > env\Scripts\activate.bat

En el archivo <b>.env</b> colocar los siguientes valores:

    MAIL_SENDER="info@correo.pe"
    MAIL_USER="correo@gmail.com"
    MAIL_PASS=""
    MAIL_HOST="smtp.gmail.com"
    MAIL_PORT=587
    MAIL_TO="pepe.valdivia.caballero@gmail.com"
    DB_USER="root"
    DB_PASS="123"
    DB_HOST="127.0.0.1"
    DB_PORT=5433
    DB_NAME="tickets"
    DB="postgres://root:123@127.0.0.1:5433/tickets?sslmode=disable"

## Servidor de Base de Datos con Docker

    $ docker compose up

## Migraciones

En el archivo <b>.env</b> colocar el siguiente string de conexión:

    DB="postgres://root:123@127.0.0.1:5433/tickets?sslmode=disable"

Migraciones con DBMATE - postgres/tickets:

    $ dbmate -d "db/migrations" -e "DB" new <<nombre_de_migracion>>
    $ dbmate -d "db/migrations" -e "DB" up
    $ dbmate -d "db/migrations" -e "DB" rollback
    $ dbmate -d "db/migrations" -e "DB" dump

Dump de la base de datos usando Postgres Client 14

    $ pg_dump -h 127.0.0.1 -p 5433 -Fc -U root tickets > db/tickets.dump

## En Nginx

Hay que instalar python3, python3-pip, Postgres Client 14.

    $ apt-get update
    $ apt-get install git python3-pip python3-virtualenv python3-venv tree htop nano

---

Fuentes:

+ https://programwithus.com/learn-to-code/Pip-and-virtualenv-on-Windows/
+ https://postgres-py.readthedocs.io/en/latest/
+ https://stackoverflow.com/questions/70583980/i-am-unable-to-create-a-new-virtualenv-in-ubuntu
+ https://postgres-py.readthedocs.io/en/latest/
+ https://www.geeksforgeeks.org/modify-xml-files-with-python/
+ https://docs.python.org/3/library/xml.etree.elementtree.html
+ https://stackoverflow.com/questions/15356641/how-to-write-xml-declaration-using-xml-etree-elementtree
+ https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-in/
+ https://stackoverflow.com/questions/1855095/how-to-create-a-zip-archive-of-a-directory
+ https://stackoverflow.com/questions/40216311/reading-in-environment-variables-from-an-environment-file
+ https://stackoverflow.com/questions/3362600/how-to-send-email-attachments
+ https://stackoverflow.com/questions/29648309/pg-dump-postgres-database-from-remote-server-when-port-5432-is-blocked
+ https://stackoverflow.com/questions/21158033/query-from-postgresql-using-python-as-dictionary
+ https://www.postgresqltutorial.com/postgresql-python/connect/
+ https://github.com/pepeul1191/python-bottle-tuto
