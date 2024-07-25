<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Producto" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Talla" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.ColorProducto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <a href="index.jsp">
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="index.jsp">Catalogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="perfil.jsp">Perfil</a>
                    <a href="carrito.jsp">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px">
                    </a>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container mt-5" style="background-color: #FFFFFF; border-radius: 10px; align-items: center; ">
    <%
        HttpSession sesion = request.getSession();
        Producto p = (Producto) sesion.getAttribute("producto");
        if (p != null) {
    %>
    <div class="row justify-content-center">
        <div class="col-md-6 mt-4 mb-4">
            <div class="text-center">
                <img src="img/image39.png" alt="Top tejido crochet" class="product-image">
                <h2 class="product-title"><%= p.getNombre_producto() %></h2>
                <p class="product-price">$<%= p.getPrecio() %></p>

                <p>Disponibles: <%= p.getStockDisponible() %></p>

                <div class="star-rating">
                    ★★★★☆
                </div>
                <button class="btn-add-cart">Añadir al Carrito</button>
            </div>
        </div>
        <div class="col-md-6 mt-4 mb-4">

                <h5>Descripción del producto</h5>
                <p><%= p.getDescripcion() %></p>

            <form action="AddToCartServlet" method="post">

                <div class="mb-3">
                    <label for="talla" class="form-label">Selecciona la talla:</label>
                    <div id="talla">
                        <%
                            List<Talla> tallas = p.getTallas();
                            if (tallas != null && !tallas.isEmpty()) {
                                for (Talla talla : tallas) {
                                    String tallaId = "talla_" + talla.getId_talla(); // Genera un ID único para cada input
                        %>
                        <input type="radio" class="btn-check" name="talla" id="<%= tallaId %>" value="<%= talla.getNombre() %>" autocomplete="off">
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
                                    String colorId = "color" + color.getId_color(); // Genera un ID único para cada input
                        %>
                        <input type="radio" class="btn-check" name="color" id="<%= colorId %>" value="<%= color.getNombre() %>" autocomplete="off">
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
                    <input type="number" class="form-control" id="cantidad" name="cantidad" value="1" min="1">
                </div>
                <button type="submit" class="btn btn-primary">Añadir al carrito</button>
            </form>

                <h5>Opiniones</h5>
                <div class="review-card" style="border-radius: 5px;background-color: #f2f2f2">
                    <img src="img/user.jpg" alt="Janette MM">
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
</body>
</html>
