#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# env variables
load_dotenv()
# db 1 - env - postgres
host1=str(os.getenv("DB_HOST"),)
database1=str(os.getenv("DB_NAME"),)
user1=str(os.getenv("DB_USER"),)
password1=str(os.getenv("DB_PASS"),)
port1=str(os.getenv("DB_PORT"))
# db 2 - env - mysql
host2=str(os.getenv("DB_HOST_2"),)
database2=str(os.getenv("DB_NAME_2"),)
user2=str(os.getenv("DB_USER_2"),)
password2=str(os.getenv("DB_PASS_2"),)
port2=str(os.getenv("DB_PORT_2"))

Base = declarative_base()
# mysql
str1 = 'postgresql+psycopg2://' + user1 + ':' + password1 + '@' + host1 + ':' + port1 + '/' + database1
# str1 = 'postgresql+psycopg2://root:123@127.0.0.1:5433/tickets'
engine1 = create_engine(str1)
session_db1 = sessionmaker()
session_db1.configure(bind=engine1)
# postgres
str2 = 'mysql+pymysql://' + user2 + ':' + password2 + '@' + host2 + ':' + port2 + '/' + database2
engine2 = create_engine(str2)
session_db2 = sessionmaker()
session_db2.configure(bind=engine2)
# connections
try:
  # mysql
  conn = engine1.connect()
  stmt = ("""
    SELECT * FROM workers WHERE id={0}"""
  ).format(1)
  rs1 = [dict(r) for r in conn.execute(stmt)]
  print(rs1)
  # postgres
  conn = engine2.connect()
  stmt = ("""
    SELECT * FROM workers WHERE id={0}"""
  ).format(1)
  rs2 = [dict(r) for r in conn.execute(stmt)]
  print(rs2)
except Exception as e:
  print(e)