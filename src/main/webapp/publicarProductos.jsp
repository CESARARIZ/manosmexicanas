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
        .form-color-rouse
        {
            background-color: #f5eaf1;
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
<header>

    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-lg-2" id="log"><a href="index.jsp">
                <img src="img/logoMM.png" alt="" width="100px" height="80px"></a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDA-->
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0">

                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-lg-4">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="indexAdmin.jsp">Catálogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionPedidos.jsp">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="publicarProductos.jsp">Publicar</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionUsuarios.jsp">Clientes</a>

                </nav>
            </div>
        </div>
    </div>

</header>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-3 sidebar">
            <img src="img/icono_de_perfil.png" alt="Usuario Administrador">
            <br><form class="form-color-rouse">
            <h2>Usuario Administrador</h2>
            <p>Nombre: administrador</p>
            <p>Correo Electrónico: administrador@utez.edu.mx</p>
            <p>Teléfono: 7771234567</p></form>
        </div>

        <div class="col-md-4">
            <h1>Publicar producto</h1>
            <form action="addProducto">
                <div class="form-group">
                    <label for="nombre-producto">Nombre del producto:</label>
                    <input type="text" class="form-control" id="nombre-producto">
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea class="form-control" id="descripcion" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <label>Colores:</label>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Color 1">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">+</button>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Color 2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">+</button>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Tallas:</label>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Talla 1">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">+</button>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Talla 2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button">+</button>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Publicar</button>
            </form>
        </div>
        &nbsp;&nbsp;
        &nbsp;&nbsp;
        &nbsp;&nbsp;


        <div class="col-md-4">
            <!-- Espacio en blanco para colocar contenido adicional -->
            <div><h1>&nbsp;</h1>
                <!-- Contenido adicional aquí -->
                <div class="form-group">
                    <label for="unidades">Unidades disponibles:</label>
                    <input type="number" class="form-control" id="unidades">
                </div>
                <div class="form-group">
                    <label for="categoria">Categoría:</label>
                    <input type="text" class="form-control" id="categoria">
                </div>
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" class="form-control" id="precio">
                </div>
                <div class="form-group">
                    <label>Adjuntar imagen del producto:</label>
                    <div class="d-flex flex-wrap">
                        <br>
                        <button class="btn btn-outline-secondary" type="button">Adjuntar imagen...</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>