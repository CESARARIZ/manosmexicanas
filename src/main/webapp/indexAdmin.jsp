<%@ page import="mx.edu.utez.manosmexicanas.dao.ProductoDao" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Producto" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionn = request.getSession(false);
    Usuario usuario = null;
    if (sessionn != null) {
        usuario = (Usuario) sessionn.getAttribute("usuario");
    }else {
        response.sendRedirect("ingresar.jsp");
    }
%>
<html>
<head>
    <title>Manos Mexicanas</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&family=Sansita:ital,wght@0,400;0,700;0,800;0,900;1,400;1,700;1,800;1,900&display=swap" rel="stylesheet">
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
        #nave .dropdown-menu {
            background-color: #FFFFFF; /* Color oscuro */
        }
        #nave .dropdown-menu a {
            color: #061029; /* Color de los enlaces del dropdown */
        }

        #nave, #log{
            text-align: center;
        }
        .navbar-nav {
            align-items: center; /* Centramos verticalmente los enlaces */
        }
        img{
            max-width: 190px;
            border-radius: 10px;
        }
        .item{
            width: 190px; /* Establece el ancho deseado para el div */
            border-radius: 10px;
            border: 1px solid black;
            margin-right: 10px;
            margin-top: 10px;
            overflow: hidden; /* Asegura que el contenido no se desborde */
        }

        /*esto degine la sombrita que le sale a los cuadraditos*/
        .item:hover{
            box-shadow: 0 10px 20px rgb(0, 0, 0);
        }
        /*esto ordena tanto texto como boton*/
        .info-producto{
            padding: 1px 10px;
            display: flex;
            flex-direction: column;
            gap:5px;
        }


        /*esto le da estilo al boton de busqueda*/
        .info-producto button{
            border: none;
            background: none;
            background-color: #28a745;
            color: #fff;
            padding: 10px 15px; /* Espacio interno del botón */
            cursor: pointer;
            border-radius: 10px;
            margin: 2px;
            font-size: 15px;
        }

        .item img {
            width: 100%; /* Asegura que la imagen ocupe el ancho del div */
            height: auto; /* Mantiene la proporción de la imagen */
        }


        .info-producto h6 {
            font-size: 14px; /* Tamaño de fuente para el nombre del producto */
            overflow-wrap: break-word; /* Hace que los nombres largos hagan salto de línea */
        }

        .info-producto .precio {
            font-weight: bold; /* Destaca el precio */
        }



        .info-producto button h6 {
            margin: 0; /* Elimina el margen del h6 dentro del botón */
            font-size: 14px; /* Tamaño de fuente del texto en el botón */
        }
    </style>
</head>
<body>

<header>
    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-6 col-lg-3" id="log">
                <a href="index.jsp">
                    <img src="img/logoMM.png" alt="Logo" class="img-fluid" width="100" height="80">
                </a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDA-->
            <div class="col-12 col-lg-5 d-flex justify-content-center mt-3 mt-lg-0 align-items-center">
                <form class="w-100 w-lg-75 align-items-center">
                    <div class="input-group  mt-3">
                        <input class="form-control custom-input search-bar" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn" type="submit" style="background-color: #FFB2EA;">
                            <img src="img/lupa.png" alt="Buscar" width="20" height="20">
                        </button>
                    </div>
                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-md-4 d-flex justify-content-center">
                <nav id="nave" class="navbar navbar-expand-md navbar-dark">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link me-3 py-1 text-decoration-none"  style="color:#FFB2EA" href="publicarProductos.jsp">Publicar</a>
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle me-3 py-1 text-decoration-none"  style="color:#FFB2EA" href="perfil.jsp" id="perfilDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Gestiones
                            </a>
                            <div class="dropdown-menu" aria-labelledby="perfilDropdown">
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="gestionUsuarios.jsp">Clientes</a>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="gestionPedidos.jsp">Pedidos</a>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="gestionProductos.jsp">Productos</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="cerrarSesion">Cerrar sesión</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container-fluid">
    <!--SE UTILZA UNA FILA PARA REALIZAR LA BARRA DE FILTROS-->
    <div class="row ">
        <div class="col-md-2 sidebar bg-light">
            <h4 class="px-1"  style="font-family: 'Sansita', sans-serif; text-align: center">Filtros</h4>
            <!--SE CREAN CAJAS PARA CADA FILTRO-->
            <div class="filter-box">
                <h5  style="font-family: 'Sansita', sans-serif;">Categorías</h5>
                <label><input type="checkbox" name="category" value="ropa-hombre"> Ropa Hombre</label>
                <label><input type="checkbox" name="category" value="ropa-mujer"> Ropa Mujer</label>
            </div>
            <!--SE CREAN CAJAS PARA CADA FILTRO-->
            <div class="filter-box">
                <h5  style="font-family: 'Sansita', sans-serif;">Tallas</h5>
                <label><input type="checkbox" name="size" value="s"> S</label>
                <label><input type="checkbox" name="size" value="m"> M</label>
                <label><input type="checkbox" name="size" value="l"> L</label>
                <label><input type="checkbox" name="size" value="xl"> XL</label>
                <label><input type="checkbox" name="size" value="xxl"> XXL</label>
            </div>
            <!--SE CREAN CAJAS PARA CADA FILTRO-->
            <div class="filter-box">
                <h5  style="font-family: 'Sansita', sans-serif;">Colores</h5>
                <label><input type="checkbox" name="color" value="rojo"> Rojo</label>
                <label><input type="checkbox" name="color" value="azul"> Azul</label>
                <label><input type="checkbox" name="color" value="verde"> Verde</label>
                <label><input type="checkbox" name="color" value="negro"> Negro</label>
                <label><input type="checkbox" name="color" value="blanco"> Blanco</label>
                <label><input type="checkbox" name="color" value="amarillo"> Amarillo</label>
            </div>
        </div>
        <div class="col-md-10">
            <main class="py-3">
                <h1 style="font-family: 'Sansita', sans-serif;">Catálogo</h1>
                <!--SE CREAN CLASES PARA CADA COLUMNA, SE UTILIZA MARGIN TOP PARA LA SEPARACION TANTO SUPERIOR COMO INFERIOR DE LA OTRA COLUMNA-->
                <div class="row">
                    <div class="col-md-12" style="display: flex; flex-wrap: wrap; margin-top: 20px;">
                        <%
                            ProductoDao productoDao = new ProductoDao();
                            List<Producto> productos = null;

                            try {
                                productos = productoDao.obtenerTodosLosProductos();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                            if (productos != null) {
                                int count = 0;
                                for (Producto producto : productos) {
                                    if (count > 0 && count % 6 == 0) {
                        %>
                        <!-- Nueva fila -->
                        <div class="w-100"></div>
                        <%
                            }
                        %>
                        <div class="item mt-4" style="flex: 0 0 calc(16.66% - 20px); max-width: calc(16.66% - 20px); display: flex; flex-direction: column; margin-right: 10px; margin-bottom: 20px;">
                            <figure style="margin: 0;">
                                <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <%
                                            // Aquí se supone que 'imagenes' es una lista de URLs o ids de las imágenes del producto.
                                            List<Integer> imagenes = productoDao.idsImagenes(producto.getId_producto()); // Este método debe retornar una lista con los IDs de las imágenes
                                            int index = 0;
                                            System.out.println("Tamaño de imagenes: " + imagenes.size());
                                            for (Integer image : imagenes) {
                                                System.out.println("ID de la imagen: " + image);
                                        %>
                                        <!-- Asegúrate de que solo el primer elemento tenga la clase 'active' -->
                                        <div class="carousel-item <%= (index == 0) ? "active" : "" %>" data-bs-interval="10000">
                                            <a href="mostrarProducto?id=<%=producto.getId_producto()%>">
                                                <img src="mostrarImagen?id_pc=<%=image%>" alt="<%= producto.getNombre_producto() %>" class="img-fluid" style="width: 100%; height: 200px;">
                                            </a>
                                        </div>
                                        <%
                                                index++;
                                            }
                                        %>
                                    </div>

                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>

                                </div>


                            </figure>
                            <div class="info-producto" style="padding: 10px; flex: 1; display: flex; flex-direction: column;">
                                <h5 class="mb-2"><%= producto.getNombre_producto() %></h5>
                                <p class="precio mb-1">$<%= producto.getPrecio() %></p>
                                <p class="mt-1 mb-2" style="font-size: 15px">Disponibles: <%= producto.getStockDisponible() %></p>
                                <button class="btn btn-success" style="margin-top: auto; border: none; padding: 10px; border-radius: 5px; color: white;">
                                    <a href="gestionProductos.jsp" style="color: white; text-decoration: none;">Actualizar</a></button>
                            </div>
                        </div>
                        <%
                                    count++;
                                }
                            }
                        %>
                    </div>
                </div>

            </main>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
