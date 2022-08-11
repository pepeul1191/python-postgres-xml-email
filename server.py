from bottle import Bottle, run, template

app = Bottle()

@app.route('/')
def home():
  return template('home')

@app.route('/form')
def form():
  return template('form')

run(
  app, host='localhost', port=8080, debug=True,reloader=True,
)