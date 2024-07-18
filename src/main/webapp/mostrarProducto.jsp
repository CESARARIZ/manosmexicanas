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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="pedido.jsp">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="perfil.jsp">Perfil</a>
                    <a href="carrito.jsp">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px"></a>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="product-card d-flex">
                <div class="col-md-4 text-center">
                    <img src="img/top_crochet.jpg" alt="Top tejido crochet" class="product-image">
                </div>
                <div class="col-md-8">
                    <h2 class="product-title">Top tejido crochet</h2>
                    <p class="product-price">$100</p>
                    <div class="star-rating">
                        ★★★★☆
                    </div>
                    <button class="btn-add-cart">Añadir al Carrito</button>
                </div>
            </div>

            <div class="product-card mt-3">
                <h3>Descripción del producto</h3>
                <p>Top negro tejido a crochet. Este top combina la elegancia del negro clásico con el encanto artesanal del crochet, creando una pieza única que no pasará desapercibida. Cada detalle ha sido cuidadosamente tejido a mano, utilizando hilo de alta calidad para asegurar tanto durabilidad como comodidad.</p>
            </div>

            <div class="product-card mt-3">
                <h3>Colores disponibles</h3>
                <div class="d-flex">
                    <div class="color-swatch"><img src="img/" alt="Blanco"></div>
                    <div class="color-swatch"><img src="img/" alt="Negro"></div>
                    <div class="color-swatch"><img src="img/" alt="Café"></div>
                    <div class="color-swatch"><img src="img/" alt="Rosa claro"></div>
                    <div class="color-swatch"><img src="img/" alt="Rosa chicle"></div>
                </div>
            </div>

            <div class="product-card mt-3">
                <h3>Opiniones del producto</h3>
                <div class="review-card d-flex align-items-center">
                    <img src="img/user.jpg" alt="Janette MM">
                    <div>
                        <p class="reviewer-name">Janette MM</p>
                        <div class="star-rating">
                            ★★★★☆
                        </div>
                        <p>Me encantó!!! Es de muy buena calidad y el envío fue súper rápido</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>