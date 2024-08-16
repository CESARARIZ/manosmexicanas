<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.*" %>
<%@ page import="mx.edu.utez.manosmexicanas.dao.ProductoDao" %>
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
        }else {
            ruta = "index.jsp";
            response.sendRedirect("ingresar.jsp");
        }

    }else{
        response.sendRedirect("ingresar.jsp");
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="<%= ruta %>">Catalogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="perfil.jsp"><% if (usuario != null) { %>
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
<div class="container mt-5" style=" border-radius: 10px; align-items: center;">
    <%
        HttpSession sesion = request.getSession();
        Producto p = (Producto) sesion.getAttribute("producto");
        if (p != null) {
        int id_producto =0;
    %>
    <div class="row justify-content-center">
        <div class="col-md-10" style="background-color: #FFFFFF;">
            <div class="row justify-content-center">
                <div class="col-md-5 justify-content-center mt-4 mb-4 m-2" style="background-color: #FFFFFF;">
                    <div class="text-center">
                        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">

                            <div id="carouselProducto<%= p.getId_producto() %>" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <%
                                        ProductoDao productoDao = new ProductoDao();
                                        List<Integer> imagenes = productoDao.idsImagenes(p.getId_producto());
                                        int index = 0;

                                        for (Integer image : imagenes) {
                                    %>
                                    <div class="carousel-item <%= (index == 0) ? "active" : "" %>" data-bs-interval="6000">
                                        <a href="#">
                                            <img src="mostrarImagen?id_pc=<%=image%>" alt="<%= p.getNombre_producto() %>" class="img-fluid" style="width: 300px; height: 500px; object-fit: cover;">
                                        </a>
                                    </div>
                                    <%
                                            index++;
                                        }
                                    %>
                                </div>
                                <!-- Verificar si hay más de una imagen antes de mostrar los botones -->
                                <%
                                    if (imagenes.size() > 1) {
                                %>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselProducto<%= p.getId_producto() %>" data-bs-slide="prev" style="background-color: transparent; border: none;">
                                    <span class="carousel-control-prev-icon" aria-hidden="true" style="filter: invert(0) brightness(0);"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselProducto<%= p.getId_producto() %>" data-bs-slide="next" style="background-color: transparent; border: none;">
                                    <span class="carousel-control-next-icon" aria-hidden="true" style="filter: invert(0) brightness(0);"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                                <%
                                    }
                                %>
                            </div>

                        </div>

                        <h2 class="product-title"><%= p.getNombre_producto() %></h2>
                        <p class="product-price">Precio por unidad: $<span id="precio"><%= p.getPrecio() %></span></p>
                        <p>Disponibles: <%= p.getStockDisponible() %></p>
                        <div class="star-rating">
                            ★★★★☆
                        </div>
                    </div>
                </div>
                <div class="col-md-5  justify-content-center mt-4 mb-4 mx-4 m-2" style="background-color: #FFFFFF;">
                    <h5><b>Descripción del producto</b></h5>
                    <p><%= p.getDescripcion() %></p>
                    <p><b>Categoría:</b> <%= p.getCategoria().getNombre_categoria() %></p>

                    <form id="form-carrito" action="carrito" method="post">
                        <div class="mb-3">
                            <label for="talla" class="form-label"><b>Selecciona la talla:</b></label>
                            <div id="talla">
                                <%
                                    List<Talla> tallas = p.getTallas();
                                    if (tallas != null && !tallas.isEmpty()) {
                                        for (Talla talla : tallas) {
                                            String tallaId = "talla_" + talla.getId_talla();
                                %>
                                <input type="radio" class="btn-check" name="id_talla" id="<%= tallaId %>" value="<%= talla.getId_talla() %>" autocomplete="off" required>
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
                            <label for="color" class="form-label"><b>Selecciona el color:</b></label>
                            <div id="color">
                                <%
                                    List<ColorProducto> colores = p.getColores();
                                    if (colores != null && !colores.isEmpty()) {
                                        for (ColorProducto color : colores) {
                                            String colorId = "color" + color.getId_color();
                                %>
                                <input type="radio" class="btn-check" name="id_color" id="<%= colorId %>" value="<%= color.getId_color() %>" autocomplete="off" required>
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
                            <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1" max="<%=p.getStockDisponible()%>" oninput="calculateTotal()" required>
                            <p>Total: $<span id="total">0.00</span></p>
                        </div>
                        <input type="hidden" id="totalHidden" name="total" value="0.00">
                        <input type="hidden" name="id_producto" value="<%= p.getId_producto() %>">
                        <input type="hidden" name="nombre_producto" value="<%=p.getNombre_producto()%>">
                        <input type="hidden" name="id_categoria" value="<%= p.getCategoria().getId_categoria() %>">
                        <input type="hidden" name="id_usuario" value="<%=id_usuario%>">
                        <input type="hidden" name="precio" value="<%=p.getPrecio()%>">
                        <button class="text-center align-content-center" style="margin-top: auto; border: none; padding: 10px; border-radius: 5px; color: white; text-decoration: none; background-color: <%= "Disponible".equals(p.getEstado()) ? "#28a745" : "#6c757d" %>;"
                                <%= "Disponible".equals(p.getEstado()) ? "type='submit'" : "disabled" %> >
                            <h6>
                                <% if ("Disponible".equals(p.getEstado())) { %>
                                Añadir al carrito
                                <% } else { %>
                                No disponible
                                <% } %>
                            </h6>
                        </button>

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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
