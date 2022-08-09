import os
import zipfile
import random
import xml.etree.ElementTree as ET
from datetime import datetime
from postgres import Postgres

def zipdir(path, ziph):
  # ziph is zipfile handle
  for root, dirs, files in os.walk(path):
    for file in files:
      ziph.write(
        os.path.join(root, file), 
        os.path.relpath(os.path.join(root, file), 
        os.path.join(path, '..'))
      )

# ids
i = 0
ids = ""
while i < 5:
  id = random.randint(1, 100)
  ids = ids + "," + str(id)
  i = i + 1
# db
db = Postgres(url="postgres://root:123@127.0.0.1:5432/tickets?sslmode=disable")
query = "SELECT * FROM workers WHERE id IN (" +  ids[1:] + ");"
workers = db.all(query)
# folder
timestamp = int(datetime.timestamp(datetime.now()))
path = "tmp/" + str(timestamp)
os.mkdir(path)
# xmls
for worker in workers:
  tree = ET.parse("base.xml")
  root = tree.getroot()
  for child in root:
    child.attrib["id"] = str(worker.id)
    for tmp in child:
      if (
        tmp.tag == "names" or 
        tmp.tag == "last_names" or 
        tmp.tag == "email"
      ):
        tmp.text = eval("worker." + tmp.tag)
      if (
        tmp.tag == "phone"
      ):
        tmp.attrib["whastapp"] = worker.phone
  name = str(worker.id) + "_" + (worker.last_names + worker.names).replace(" ", "") + ".xml"
  tree.write(path + "/" + name, encoding="utf8", method="xml")
# zip
with zipfile.ZipFile("tmp/" + str(timestamp) + ".zip", "w", zipfile.ZIP_DEFLATED) as zipf:
  zipdir("tmp/" + str(timestamp) + "/", zipf)
# email
