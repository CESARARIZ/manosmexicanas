<%@ page import="mx.edu.utez.manosmexicanas.model.PedidoDetalle" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 18/08/2024
  Time: 05:37 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pedidos</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&family=Sansita:ital,wght@0,400;0,700;0,800;0,900;1,400;1,700;1,800;1,900&display=swap" rel="stylesheet">
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

        .navbar {
            padding: 5px 0;
        }
        #nave, #log{
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

        .search-bar-container {
            position: relative;
            max-width: 400px; /* Máximo ancho de la barra de búsqueda */
            width: 100%;

        }
        table{
            width: 100%;
            margin: 10px;
            margin-top: 10px;
        }

        td, th{
            font-family: Sansita;
            font-size: 20px;
            padding: 10px;
            vertical-align: middle;
        }
        tbody tr{
            border: 0.5px solid #A7A7A7;
        }
        tbody tr:nth-child(even) {
            background-color: #FEE9F5; /* Color para las filas pares */
        }

        /* Aplica el borde redondeado a las esquinas de la cabecera */
        #tabla-redondeada thead th:first-child {
            border-top-left-radius: 10px;
            font-family: "Sansita", sans-serif; /* Cambiado a Sansita */
        }

        #tabla-redondeada thead th:last-child {
            border-top-right-radius: 10px;
        }

        /* Aplica el borde redondeado a las esquinas del pie de la tabla */
        #tabla-redondeada tbody tr:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }

        #tabla-redondeada tbody tr:last-child td:last-child {
            border-bottom-right-radius: 10px;
        }
    </style>
</head>
<body>

<header class="">
    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-md-2" id="log">
                <a href="indexCliente.jsp">
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
                        <a class="nav-item nav-link me-3 py-1 text-decoration-none"  style="color:#FFB2EA" href="indexCliente.jsp">Catálogo</a>
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle me-3 py-1 text-decoration-none"  style="color:#FFB2EA" href="#" id="perfilDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Más
                            </a>
                            <div class="dropdown-menu" aria-labelledby="perfilDropdown">
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="perfil.jsp">Ver perfil</a>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="recuperarCuenta.jsp">Recuperar contraseña</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="cerrarSesion">Cerrar sesión</a>
                            </div>
                        </div>
                        <a href="verCarrito" class="nav-item nav-link">
                            <img src="img/carritoB.png" alt="Carrito de compras" width="45px" height="45px">
                        </a>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <div class="row align-items-center" style="margin-top: 30px; margin: 30px">
        <div class="col-md-8">
            <h1 style="font-family: 'Sansita', sans-serif;"><b>Pedidos</b></h1>
        </div>
        <div class="col-md-4">
            <div class="form-inline justify-content-end">
                <div class="search-bar-container">
                    <input class="form-control mb-lg-0" type="search" placeholder="Buscar" aria-label="Buscar">
                </div>
            </div>
        </div>
    </div>
    <table class="table" id="tabla-redondeada">
        <thead>
        <tr style="background-color: #FE7DCC; margin-bottom: 3px">
            <th>#</th>
            <th>Producto</th>
            <th>Talla</th>
            <th>Color</th>
            <th>Unidades</th>
            <th>Total</th>
            <th>Estado</th>
            <th>Calificar</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<PedidoDetalle> lista = (List<PedidoDetalle>) request.getAttribute("pedidos");
            if (lista != null && !lista.isEmpty()) {
                int contador = 1;
                for (PedidoDetalle det : lista) {
        %>
        <tr>
            <td ><%= contador %></td>
            <td ><%= det.getNombre_producto() %></td>
            <td class="mx-1"><%= det.getNombre_talla() %></td>
            <td><%= det.getNombre_color() %></td>
            <td class="mx-2">  <%= det.getCantidad() %></td>
            <td>$<%= det.getTotal() %></td>
            <td><input type="button"  class="btn <%= "Pendiente".equals(det.getEstado()) ? "btn-secondary" : "btn-success" %>" value="<%= det.getEstado() %>" readonly></td>
            <td>
                <input type="button"
                       class="btn <%= "Calificado".equals(det.getEstado()) || "Pendiente".equals(det.getEstado()) ? "btn-secondary" : "btn-success" %>"
                       value="<%= "Calificado".equals(det.getEstado()) ? "Calificado" : "Calificar" %>" id="calificarButton">
            </td>
        </tr>
        <%
                contador++;
            }
        } else {
        %>
        <tr>
            <td colspan="8" class="text-center align-middle">Aún no realizas un pedido.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="rateModal" tabindex="-1" aria-labelledby="rateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rateModalLabel">Calificar y Comentar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Formulario de calificación y comentario -->
                <form>
                    <div class="mb-3">
                        <label for="rating" class="form-label">Calificación</label>
                        <select id="rating" class="form-select">
                            <option value="1">1 Estrella</option>
                            <option value="2">2 Estrellas</option>
                            <option value="3">3 Estrellas</option>
                            <option value="4">4 Estrellas</option>
                            <option value="5">5 Estrellas</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="comment" class="form-label">Comentario</label>
                        <textarea id="comment" class="form-control" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Enviar</button>
            </div>
        </div>
    </div>
</div>


<script>
    document.getElementById("calificarButton").addEventListener("click", function() {
        if (this.classList.contains("btn-success")) {
            // Mostrar modal solo si el botón tiene clase 'btn-success'
            var myModal = new bootstrap.Modal(document.getElementById('rateModal'));
            myModal.show();
        }
    });
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
