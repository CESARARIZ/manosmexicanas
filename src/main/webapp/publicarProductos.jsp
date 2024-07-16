<%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 30/06/2024
  Time: 02:36 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <style>
        #nave, #log{
            text-align: center;
        }
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }
        body{
            background-color: #F2F2F2;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <img src="user-placeholder.png" alt="Usuario Administrador">
        <h2>Usuario Administrador</h2>
        <p>Nombre: administrador</p>
        <p>Correo Electrónico: administrador@utez.edu.mx</p>
        <p>Teléfono: 7771234567</p>
    </div>
    <div class="main">
        <h1>Publicar producto</h1>
        <div class="form-group">
            <label for="nombre-producto">Nombre del producto:</label>
            <input type="text" id="nombre-producto">
        </div>
        <div class="form-group">
            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" rows="4"></textarea>
        </div>
        <div class="form-group">
            <label for="unidades">Unidades disponibles:</label>
            <input type="number" id="unidades">
        </div>
        <div class="form-group">
            <label for="categoria">Categoría:</label>
            <input type="text" id="categoria">
        </div>
        <div class="form-group">
            <label for="precio">Precio:</label>
            <input type="number" id="precio">
        </div>
        <div class="form-group colors">
            <label>Colores:</label>
            <input type="text" placeholder="Color 1">
            <button>+</button>
        </div>
        <div class="form-group colors">
            <input type="text" placeholder="Color 2">
            <button>+</button>
        </div>
        <div class="form-group sizes">
            <label>Tallas:</label>
            <input type="text" placeholder="Talla 1">
            <button>+</button>
        </div>
        <div class="form-group sizes">
            <input type="text" placeholder="Talla 2">
            <button>+</button>
        </div>
        <div class="form-group images">
            <label>Adjuntar imagen del producto:</label>
            <img src="imagen_chochet_1.jpg" alt="imagen_chochet_1">
            <img src="imagen_chochet_2.jpg" alt="imagen_chochet_2">
            <img src="imagen_chochet_3.jpg" alt="imagen_chochet_3">
            <button>Adjuntar imagen...</button>
        </div>
        <button class="submit-button">Publicar</button>
    </div>
</div>
</body>
</html>