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

        .filter-box h5 {
            margin-bottom: 10px;
        }
        .filter-box label {
            display: block;
        }
        #log {
            text-align: left;
        }

        #nave, #log{
            text-align: center;
        }
        img{
            max-width: 190px;
            border-radius: 10px;
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