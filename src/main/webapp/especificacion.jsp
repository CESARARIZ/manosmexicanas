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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        header {
            width: 100%;
            background-color: #061029;
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

         .checked {
             color: orange;
         }
    </style>
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
    <div class="card">
        <div class="card-body">
            <h2 class="card-title text-center">Especifica tu producto</h2>
            <div class="row">
                <div class="col-md-6 text-center">
                    <img src="img/traje1.jpeg" class="img-fluid" alt="Producto" width="320" height="340" style="border-radius: 10px">
                    <h3>Top estilo crochet</h3>
                    <p>$100</p>
                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                    </div>
                </div>
                <div class="col-md-6">
                    <form action="AddToCartServlet" method="post">
                        <div class="mb-3">
                            <label for="color" class="form-label">Selecciona el color:</label>
                            <div id="color">
                                <input type="radio" class="btn-check" name="color" id="negro" value="negro" autocomplete="off">
                                <label class="btn btn-outline-primary" for="negro">Negro</label>

                                <input type="radio" class="btn-check" name="color" id="rosa" value="rosa" autocomplete="off">
                                <label class="btn btn-outline-primary" for="rosa">Rosa</label>

                                <input type="radio" class="btn-check" name="color" id="azul" value="azul" autocomplete="off">
                                <label class="btn btn-outline-primary" for="azul">Azul</label>

                                <input type="radio" class="btn-check" name="color" id="rojo" value="rojo" autocomplete="off">
                                <label class="btn btn-outline-primary" for="rojo">Rojo</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="talla" class="form-label">Selecciona la talla:</label>
                            <div id="talla">
                                <input type="radio" class="btn-check" name="talla" id="ch" value="ch" autocomplete="off">
                                <label class="btn btn-outline-primary" for="ch">CH</label>

                                <input type="radio" class="btn-check" name="talla" id="m" value="m" autocomplete="off">
                                <label class="btn btn-outline-primary" for="m">M</label>

                                <input type="radio" class="btn-check" name="talla" id="g" value="g" autocomplete="off">
                                <label class="btn btn-outline-primary" for="g">G</label>

                                <input type="radio" class="btn-check" name="talla" id="extg" value="extg" autocomplete="off">
                                <label class="btn btn-outline-primary" for="extg">EXT G</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="cantidad" class="form-label">Selecciona la cantidad:</label>
                            <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1">
                        </div>
                        <button type="submit" class="btn btn-primary">Añadir al carrito</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/bootstrap.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
