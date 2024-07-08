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
        .card-free {
            background-color: #f8f9fa;
        }
        .card-pro {
            background-color: #e9ecef;
        }
        .card-enterprise {
            background-color: #dee2e6;
        }
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .search-form {
            flex-grow: 1;
            margin: 0 15px;
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
        .text-bordered {
            border: 1px solid #dee2e6;
            padding: 10px;
            border-radius: 10px;
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
    <div class="row justify-content-center">
        <div class="col-md-5 col-sm-8 col-12 sidebar bg-light">
            <div class="sidebar bg-light">
                <div class="formu text-bordered">
                    <form method="post" action="login">

                            <h2 id="titulo"><b>Recuperar Contraseña</b></h2>
                            <br>
                            <p style="font-family: Roboto; font-size: 18px">Ingresa tu nueva contraseña</p>
                            <br>

                            <div class="form-group mb-3">
                                <label for="correo" style="font-family: Roboto; font-size: 18px">Nueva contraseña</label>
                                <input type="email"  style="font-family: Monserrat; font-size: 17px" class="form-control mb-3" id="correo" name="correo" required placeholder="Ingresa tu contraseña">
                            </div>
                            <div class="form-group mb-3">
                                <label for="contra" style="font-family: Roboto; font-size: 18px">Contraseña</label>
                                <input type="password" style="font-family: Monserrat; font-size: 17px" class="form-control mb-3" id="contra" name="contra" required placeholder="Ingresa de nuevo tu contraseña...">
                            </div>
                            <br>
                            <%-- Mensaje de error desde la sesión --%>
                            <% HttpSession sesion = request.getSession();
                                String mensaje = (String) sesion.getAttribute("mensaje");
                                if (mensaje != null) { %>
                            <p style="color: red;"><%= mensaje %></p>
                            <% } %>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Recuperar Contraseña</button>
                                <br><br>


                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>