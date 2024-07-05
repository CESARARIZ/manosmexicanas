
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            background-color: #f8f9fa;
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
    </style>
</head>
<body>

<header class="">
    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-lg-2" id="log"><a href="index.jsp">
                <img src="img/logo.png" alt="" width="100px" height="60px"></a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDAD-->
            <div class="col-lg-5">
                <form class="mb-2 mb-lg-0">
                    <input type="search" class="form-control" placeholder="Buscar..." aria-label="Search">
                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-lg-5">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="publicarProductos.jsp">Publicar</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionUsuarios.jsp">Clientes</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionPedidos.jsp">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionProductos.jsp">Productos</a>
                    <a href="carrito.html">
                        <img src="img/carrito.png" alt="" width="35px" height="35px"></a>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container-fluid">
    <!--SE UTILZA UNA FILA PARA REALIZAR LA BARRA DE FILTROS-->
    <div class="row ">
        <div class="col-md-2 sidebar bg-light">
            <h4 class="px-1" style="text-align: center;">Filtros</h4>
            <!--SE CREAN CAJAS PARA CADA FILTRO-->
            <div class="filter-box">
                <h5>Categorías</h5>
                <label><input type="checkbox" name="category" value="ropa-hombre"> Ropa Hombre</label>
                <label><input type="checkbox" name="category" value="ropa-mujer"> Ropa Mujer</label>
            </div>
            <!--SE CREAN CAJAS PARA CADA FILTRO-->
            <div class="filter-box">
                <h5>Tallas</h5>
                <label><input type="checkbox" name="size" value="s"> S</label>
                <label><input type="checkbox" name="size" value="m"> M</label>
                <label><input type="checkbox" name="size" value="l"> L</label>
                <label><input type="checkbox" name="size" value="xl"> XL</label>
                <label><input type="checkbox" name="size" value="xxl"> XXL</label>
            </div>
            <!--SE CREAN CAJAS PARA CADA FILTRO-->
            <div class="filter-box">
                <h5>Colores</h5>
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
                <h1>Catálogo</h1>
                <!--SE CREAN CLASES PARA CADA COLUMNA, SE UTILIZA MARGIN TOP PARA LA SEPARACION TANTO SUPERIOR COMO INFERIOR DE LA OTRA COLUMNA-->
                <div class="col-md-12" style="display: flex; flex-wrap: wrap; margin-top: 20px;">
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet1.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet2.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet3.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet4.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet5.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet6.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                </div>
                <!--SE CREAN CLASES PARA CADA COLUMNA, SE UTILIZA MARGIN TOP PARA LA SEPARACION TANTO SUPERIOR COMO INFERIOR DE LA OTRA COLUMNA-->
                <div class="col-md-12" style="display: flex; flex-wrap: wrap; margin-top: 30px;">
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet7.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/traje1.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/traje2.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet8.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/crochet9.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                    <!--TARJETA DE PRODUCTO-->
                    <div class="item">
                        <figure>
                            <a href="html/mostrarProducto.html">
                                <img src="img/traje3.jpeg" alt="producto"></a>
                        </figure>
                        <div class="info-producto">
                            <h4>ropa </h4>
                            <p class="precio">$50</p>
                            <button><h6>añadir al carrito</h6></button>
                        </div>
                    </div>
                </div>



            </main>
        </div>
    </div>
</div>
<script src="js/bootstrap.js"></script>
</body>
</html>
