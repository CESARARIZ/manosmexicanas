<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manos Mexicanas</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <style>
        .sidebar{

            padding: 20px 0;
            position: relative; /* Fijar la barra de filtros */
            top: 20px; /* Ajustar la posición superior según sea necesario */
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
        .filter-box {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
        }
        .filter-box h5 {
            margin-bottom: 10px;
        }
        .filter-box label {
            display: block;
        }
        #log {
            text-align: left;
        }
        /* Nuevas clases */
        .navbar {
            padding: 5px 0;
        }
        .filter-box {
            margin: 0 20px; /* Añadir un poco de espacio a los lados */
            margin-top: 20px;
        }
        #nave, #log{
            text-align: center;
        }
        img{
            max-width: 190px;
            border-radius: 10px;
        }
        .item{
            border-radius: 10px;
            border: 1px solid black;
            margin-right: 10px;
            margin-top: 20px;
        }

        /*esto degine la sombrita que le sale a los cuadraditos*/
        .item:hover{
            box-shadow: 0 10px 20px rgb(0, 0, 0);
        }
        /*esto ordena tanto texto como boton*/
        .info-producto{
            padding: 1px 20px;
            display: flex;
            flex-direction: column;
            gap:5px;
        }


        /*esto le da estilo al boton de busqueda*/
        .info-producto button{
            border: none;
            background: none;
            background-color: #000;
            color: #fff;
            padding: 15px 10px;
            cursor: pointer;
            border-radius: 10px;
            margin: 7px;
        }
    </style>
</head>
<body>

<header class="">
    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-lg-2" id="log"><a href="index.jsp">
                <img src="img/logoMM.png" alt="" width="100px" height="80px"></a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDAD-->
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0">
                    <input type="search" class="form-control" placeholder="Buscar..." aria-label="Search">
                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-lg-4">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="registrarse.jsp">Crear cuenta</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="ingresar.jsp">Ingresar</a>
                    <a href="html/carrito.html">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px"></a>
                </nav>
            </div>
        </div>
    </div>
</header>

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