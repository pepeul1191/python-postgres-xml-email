from bottle import Bottle, run, template, request, static_file
from datetime import datetime
import os

app = Bottle()

@app.route('/', method='GET')
def home():
  return template('home')

@app.route('/form', method='GET')
def form():
  return template('form')

@app.route('/form', method='POST')
def success():
  upload = request.files.get('file')
  ext = os.path.splitext(upload.filename)
  timestamp = int(datetime.timestamp(datetime.now()))
  if ext[1] not in ('.xml'):
    return 'Debe de seleccionar un XML'
  file_path = "{path}/{file}".format(path='tmp/uploads', file=str(timestamp) + ext[1])
  upload.save(file_path)
  return template('success')

run(
  app, host='localhost', port=8080, debug=True,reloader=True,
)