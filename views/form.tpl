<!DOCTYPE html>
<html>
<head>
<style>
body {
  margin: 0;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
}

li a.active {
  background-color: #04AA6D;
  color: white;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
</style>
</head>
<body>

<ul id="nav">
  <li><a href="/">Home</a></li>
  <li><a class="active" href="/form">Formulario</a></li>
</ul>

<div style="margin-left:25%;padding:1px 16px;height:1000px;">
  <h2>Formulario</h2>
  <h3>Paǵina de prueba</h3>
  <form method="post" enctype="multipart/form-data" action="form">
    <div>
      <label for="file">Seleccione un archivo XML</label>
      <br>
      <input type="file" id="file" name="file" multiple>
    </div>
    <div>
      <br>
      <button>Enviar</button>
    </div>
  </form>
</div>

</body>
</html>