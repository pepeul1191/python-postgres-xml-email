import os
import sys
from re import S
import zipfile
import random
import xml.etree.ElementTree as ET
from datetime import datetime
import sqlite3
from dotenv import load_dotenv
import smtplib, ssl
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.utils import formatdate

def zipdir(path, ziph):
  # ziph is zipfile handle
  for root, dirs, files in os.walk(path):
    for file in files:
      ziph.write(
        os.path.join(root, file), 
        os.path.relpath(os.path.join(root, file), 
        os.path.join(path, '..'))
      )

# env variables
load_dotenv()
# ids
i = 0
ids = ""
while i < 5:
  id = random.randint(1, 100)
  ids = ids + "," + str(id)
  i = i + 1
# db
conn = sqlite3.connect('db/app.db')
conn.row_factory = sqlite3.Row
cur = conn.cursor()
query = "SELECT * FROM workers WHERE id IN (" +  ids[1:] + ");"
cur.execute(query)
rs = cur.fetchall()
cur.close()
workers = []
for row in rs:
  workers.append(dict(row))
# folder
timestamp = int(datetime.timestamp(datetime.now()))
path = "tmp/" + str(timestamp)
os.mkdir(path)
# xmls
for worker in workers:
  tree = ET.parse("base.xml")
  root = tree.getroot()
  for child in root:
    child.attrib["id"] = str(worker["id"])
    for tmp in child:
      if (
        tmp.tag == "names" or 
        tmp.tag == "last_names" or 
        tmp.tag == "email"
      ):
        tmp.text = worker[tmp.tag]
      if (
        tmp.tag == "phone"
      ):
        tmp.attrib["whastapp"] = worker["phone"]
  name = str(worker["id"]) + "_" + (worker["last_names"] + worker["names"]).replace(" ", "") + ".xml"
  tree.write(path + "/" + name, encoding="utf8", method="xml")
# zip
with zipfile.ZipFile("tmp/" + str(timestamp) + ".zip", "w", zipfile.ZIP_DEFLATED) as zipf:
  zipdir("tmp/" + str(timestamp) + "/", zipf)
# email
smtp_server = os.getenv("MAIL_HOST")
port = os.getenv("PORT")
sender_email = os.getenv("MAIL_USER")
send_to = os.getenv("MAIL_TO")
password = os.getenv("MAIL_PASS")
context = ssl.create_default_context()
try:
  # header + body + attachment
  msg = MIMEMultipart()
  msg['From'] = sender_email
  msg['To'] = send_to
  msg['Date'] = formatdate(localtime=True)
  msg['Subject'] = "XMLs " + str(timestamp)
  body_mail = '''
    <h1>correo</h1>
    hola mundo
  '''
  msg.attach(MIMEText(body_mail, 'html'))
  with open("tmp/" + str(timestamp) + ".zip", "rb") as fil:
    part = MIMEApplication(
      fil.read(),
      Name=str(timestamp) + ".zip"
    )
    part['Content-Disposition'] = 'attachment; filename="%s"' % str(timestamp) + ".zip"
    msg.attach(part)
  # smtp server connection
  server = smtplib.SMTP(smtp_server,port)
  server.ehlo() 
  server.starttls(context=context)
  server.ehlo()
  server.login(sender_email, password)
  server.sendmail(sender_email, send_to, msg.as_string())
except Exception as e:
  print(e)
finally:
  server.quit() 