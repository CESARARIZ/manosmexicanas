<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 23/07/2024
  Time: 11:52 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionn = request.getSession(false);
    Usuario usuario = null;
    if (sessionn != null) {
        usuario = (Usuario) sessionn.getAttribute("usuario");
    }
%>
<html>
<head>
    <title>Corfirmar Producto</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <style>
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }
        .navbar {
            padding: 5px 0;
        }#nave, #log{
             text-align: center;
         }

        #nave .dropdown-menu {
            background-color: #FFFFFF; /* Color oscuro */
        }
        #nave .dropdown-menu a {
            color: #061029; /* Color de los enlaces del dropdown */
        }

        .navbar-nav {
            align-items: center; /* Centramos verticalmente los enlaces */
        }
        .color-circle {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 5px;
            cursor: pointer;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input[type="radio"] {
            display: none;
        }
        .form-group label span {
            display: inline-block;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 5px;
        }
        .form-group input[type="radio"]:checked + label span {
            background-color: #0d6efd;
            color: white;
        }
    </style>
</head>
<body>
<header class="">
    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-md-2" id="log">
                <a href="index.jsp">
                    <img src="img/logoMM.png" alt="" width="100px" height="80px">
                </a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDA-->
            <div class="col-md-6">
                <form class="mb-2 mb-lg-0">
                    <input type="search" class="form-control" placeholder="Buscar..." aria-label="Search">
                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-md-4 d-flex justify-content-center">
                <nav id="nave" class="navbar navbar-expand-md navbar-dark">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link me-3 py-1 text-decoration-none" style="color: #0d6efd" href="pedido.jsp">Pedidos</a>
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle me-3 py-1 text-decoration-none" style="color: #0d6efd" href="#" id="perfilDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <% if (usuario != null) { %>
                                <%= usuario.getNombre_usuario() %> <!-- Usando el método getNombre_usuario() -->
                                <% } else { %>
                                Perfil
                                <% } %>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="perfilDropdown">
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="perfil.jsp">Ver perfil</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="cerrarSesion">Cerrar sesión</a>
                            </div>
                        </div>
                        <a href="carrito.jsp" class="nav-item nav-link">
                            <img src="img/carritoB.png" alt="Carrito de compras" width="45px" height="45px">
                        </a>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            <img src="img/image44.png" alt="Top estilo crochet" class="img-fluid" width="260" height="230">
        </div>
        <div class="col-md-6">
            <h1>Especifica tu producto</h1>
            <form action="addToCart.jsp" method="post">
                <div class="form-group">
                    <label>Selecciona el color:</label>
                    <input type="radio" name="color" id="color_negro" value="Negro">
                    <label for="color_negro"><span class="color-circle" style="background-color: black;"></span>Negro</label>

                    <input type="radio" name="color" id="color_rosa" value="Rosa">
                    <label for="color_rosa"><span class="color-circle" style="background-color: pink;"></span>Rosa</label>

                    <input type="radio" name="color" id="color_azul" value="Azul">
                    <label for="color_azul"><span class="color-circle" style="background-color: blue;"></span>Azul</label>

                    <input type="radio" name="color" id="color_rojo" value="Rojo">
                    <label for="color_rojo"><span class="color-circle" style="background-color: red;"></span>Rojo</label>
                </div>
                <div class="form-group">
                    <label>Selecciona la talla:</label>
                    <input type="radio" name="size" id="size_ch" value="CH">
                    <label for="size_ch"><span>CH</span></label>

                    <input type="radio" name="size" id="size_m" value="M">
                    <label for="size_m"><span>M</span></label>

                    <input type="radio" name="size" id="size_g" value="G">
                    <label for="size_g"><span>G</span></label>

                    <input type="radio" name="size" id="size_extg" value="EXT G">
                    <label for="size_extg"><span>EXT G</span></label>
                </div>
                <div class="form-group">
                    <label for="quantity">Selecciona la cantidad:</label>
                    <input type="number" name="quantity" id="quantity" class="form-control" min="1" value="1">
                </div>
                <br>
                <button type="submit" class="btn btn-primary btn-block">Añadir al carrito</button>
            </form>
        </div>
    </div>
</div>
<script src="js/bootstrap.js"></script>

</body>
</html>
