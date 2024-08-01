<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Producto" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.ColorProducto" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Talla" %><%--
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
    int id_usuario = 0;
    String tipo_usuario="";
    String ruta = "index.jsp";
    if (sessionn != null) {
        usuario = (Usuario) sessionn.getAttribute("usuario");
        id_usuario = usuario.getId();
        tipo_usuario = usuario.getTipo_usuario();
        if ("usuario".equals(tipo_usuario)) {
            ruta = "indexCliente.jsp";
        } else if ("admin".equals(tipo_usuario)) {
            ruta = "indexAdmin.jsp";
        }

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
    <%
        HttpSession sesion = request.getSession();
        Producto p = (Producto) sesion.getAttribute("producto");
        if (p != null) {

    %>
    <div class="card">
        <div class="card-body">
            <h2 class="card-title text-center">Especifica tu producto</h2>
            <div class="row">
                <div class="col-md-6 text-center">
                    <img src="img/traje1.jpeg" class="img-fluid" alt="Producto" width="320" height="340" style="border-radius: 10px">
                    <h3><%= p.getNombre_producto() %></h3>
                    <p class="product-price">Precio por unidad: $<span id="precio"><%= p.getPrecio() %></span></p>
                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                    </div>
                </div>
                <div class="col-md-6">
                    <form id="form-carrito" action="carrito" method="post">
                        <div class="mb-3">
                            <label for="talla" class="form-label">Selecciona la talla:</label>
                            <div id="talla">
                                <%
                                    List<Talla> tallas = p.getTallas();
                                    if (tallas != null && !tallas.isEmpty()) {
                                        for (Talla talla : tallas) {
                                            String tallaId = "talla_" + talla.getId_talla();
                                %>
                                <input type="radio" class="btn-check" name="id_talla" id="<%= tallaId %>" value="<%= talla.getId_talla() %>" autocomplete="off">
                                <label class="btn btn-outline-primary" for="<%= tallaId %>"><%= talla.getNombre() %></label>
                                <%
                                    }
                                } else {
                                %>
                                <p>No hay tallas disponibles.</p>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="color" class="form-label">Selecciona el color:</label>
                            <div id="color">
                                <%
                                    List<ColorProducto> colores = p.getColores();
                                    if (colores != null && !colores.isEmpty()) {
                                        for (ColorProducto color : colores) {
                                            String colorId = "color" + color.getId_color();
                                %>
                                <input type="radio" class="btn-check" name="id_color" id="<%= colorId %>" value="<%= color.getId_color() %>" autocomplete="off">
                                <label class="btn btn-outline-primary" for="<%= colorId %>"><%= color.getNombre() %></label>
                                <%
                                    }
                                } else {
                                %>
                                <p>No hay colores disponibles.</p>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="cantidad" class="form-label">Selecciona la cantidad:</label>
                            <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1" oninput="calculateTotal()">
                            <p>Total: $<span id="total">0.00</span></p>
                        </div>
                        <input type="hidden" id="totalHidden" name="total" value="0.00">
                        <input type="hidden" name="id_producto" value="<%= p.getId_producto() %>">
                        <input type="hidden" name="id_categoria" value="<%= p.getCategoria().getId_categoria() %>">
                        <input type="hidden" name="id_usuario" value="<%=id_usuario%>">
                        <input type="hidden" name="precio" value="<%=p.getPrecio()%>">
                        <input type="submit" class="btn btn-primary" value="Añadir al carrito">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<% } %>
<script src="js/bootstrap.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function calculateTotal() {
        var precio = parseFloat(document.getElementById("precio").innerText);
        var cantidad = parseInt(document.getElementById("cantidad").value);

        if (isNaN(precio) || isNaN(cantidad) || cantidad < 1) {
            console.error("Precio o cantidad no son números válidos.");
            document.getElementById("total").innerText = "0.00";
            document.getElementById("totalHidden").value = "0.00";
            return;
        }

        var total = precio * cantidad;
        document.getElementById("total").innerText = total.toFixed(2);
        document.getElementById("totalHidden").value = total.toFixed(2);
    }

    function addToCart() {
        var form = document.getElementById("form-carrito");
        var formData = new FormData(form);

        alert("Total añadido al carrito: $" + formData.get("total"));

        // Aquí puedes usar fetch o XMLHttpRequest para enviar el formulario sin recargar la página.
    }

    calculateTotal();
</script>
</body>
</html>
