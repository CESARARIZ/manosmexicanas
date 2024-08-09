<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.*" %>
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
    <title>Manos Mexicanas</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <style>
        body {
            background-color: #F2F2F2;
        }

        .product-image {
            max-width: 100%;
            border-radius: 10px;
        }
        .btn-add-cart {
            background-color: #ffc0cb;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            cursor: pointer;
        }
        .star-rating {
            color: #FFD700;
            font-size: 1.5rem;
        }
        .color-swatch img {
            max-width: 50px;
            border-radius: 10px;
            margin-right: 10px;
        }
        .review-card img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }
        .navbar {
            padding: 5px 0;
        }
        #log {
            text-align: left;
        }
        #nave, #log {
            text-align: center;
        }
        .product-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin: 10px 0;
        }
        .product-price {
            font-size: 1.2rem;
            color: gray;
        }
        .reviewer-name {
            font-weight: bold;
        }
        .review-card {
            display: flex;
            align-items: center;
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<header class="">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-lg-2" id="log">
                <a href="indexCliente.jsp">
                    <img src="img/logoMM.png" alt="" width="100px" height="80px">
                </a>
            </div>
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0">
                    <input type="search" class="form-control" placeholder="Buscar..." aria-label="Search">
                </form>
            </div>
            <div class="col-lg-4">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="<%= ruta %>">Catalogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="perfil.jsp"><% if (usuario != null) { %>
                        <%= usuario.getNombre_usuario() %> <!-- Usando el método getNombre_usuario() -->
                        <% } else { %>
                        Perfil
                        <% } %></a>
                    <a href="verCarrito">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px">
                    </a>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container mt-5" style="background-color: #FFFFFF; border-radius: 10px; align-items: center;">
    <%
        HttpSession sesion = request.getSession();
        Producto p = (Producto) sesion.getAttribute("producto");
        if (p != null) {

    %>
    <div class="row justify-content-center">
        <div class="col-md-6 mt-4 mb-4">
            <div class="text-center">
                <img src="mostrarImagen?id_producto=<%=p.getId_producto()%>" alt="<%=p.getNombre_producto()%>" class="product-image" width="350" height="450">
                <h2 class="product-title"><%= p.getNombre_producto() %></h2>
                <p class="product-price">Precio por unidad: $<span id="precio"><%= p.getPrecio() %></span></p>
                <p>Disponibles: <%= p.getStockDisponible() %></p>
                <div class="star-rating">
                    ★★★★☆
                </div>
            </div>
        </div>
        <div class="col-md-6 mt-4 mb-4">
            <h5>Descripción del producto</h5>
            <p>Categoría: <%= p.getCategoria().getNombre_categoria() %></p>
            <p><%= p.getDescripcion() %></p>

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
                    <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1" max="<%=p.getStockDisponible()%>" oninput="calculateTotal()">
                    <p>Total: $<span id="total">0.00</span></p>
                </div>
                <input type="hidden" id="totalHidden" name="total" value="0.00">
                <input type="hidden" name="id_producto" value="<%= p.getId_producto() %>">
                <input type="hidden" name="img" value="<%=p.getImagenes()%>">
                <input type="hidden" name="id_categoria" value="<%= p.getCategoria().getId_categoria() %>">
                <input type="hidden" name="id_usuario" value="<%=id_usuario%>">
                <input type="hidden" name="precio" value="<%=p.getPrecio()%>">
                <input type="submit" class="btn btn-primary" value="Añadir al carrito">
            </form>
            <h5>Opiniones</h5>
            <div class="review-card" style="border-radius: 5px; background-color: #f2f2f2">
                <img src="img/albañil_mantenimiento.jpeg" alt="Janette MM">
                <div>
                    <p class="reviewer-name">Janette MM</p>
                    <div class="star-rating">
                        ★★★★☆
                    </div>
                    <p>Me encantó!!! Es de muy buena calidad y <br> el envío fue súper rápido</p>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</div>
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
