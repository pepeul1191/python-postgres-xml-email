from postgres import Postgres
import xml.etree.ElementTree as ET

db = Postgres(url="postgres://root:123@127.0.0.1:5432/tickets?sslmode=disable")

id = int(input("Ingrese ID a buscar: "))
worker = db.one("SELECT * FROM workers WHERE id=%(id)s;", {"id": id})
print(worker)

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

tree.write("output.xml")