<%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 10/07/2024
  Time: 11:30 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <title>Title</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F2F2F2;
        }

        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }

        #log {
            text-align: left;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin: 0 15px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        main {
            display: flex;
            justify-content: space-around;
            margin: 20px;
        }

        .carrito {
            width: 60%;
            background-color: #ffe4e1;
            padding: 20px;
            border-radius: 10px;
        }

        .resumen {
            width: 30%;
            background-color: #ffe4e1;
            padding: 20px;
            border-radius: 10px;
        }

        .producto {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .producto img {
            width: 100px;
            height: 100px;
            border-radius: 10px;
            margin-right: 20px;
        }

        .detalles {
            flex-grow: 1;
        }

        .cantidad {
            display: flex;
            align-items: center;
        }

        .cantidad button {
            margin: 0 5px;
        }

        .precio {
            font-weight: bold;
        }

        .eliminar {
            background-color: #e74c3c;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
        }

        button {
            background-color: #f06292;
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            display: block;
            border-radius: 5px;
            margin-top: 10px;
            border-bottom-color: #0a0a0a;
        }

        button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
<header>

    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-lg-2" id="log"><a href="index.jsp">
                <img src="img/logoMM.png" alt="" width="100px" height="80px"></a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDA-->
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0">

                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-lg-4">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="indexCliente.jsp">Catálogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="pedido.jsp">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="perfil.jsp">Perfil</a>

                </nav>
            </div>
        </div>
    </div>

</header>
<main>
    <section class="carrito">
        <h2>Carrito</h2>
        <div class="producto">
            <div class="detalles">
                <p><strong>Alfombra colorida</strong></p>
                <p>Talla: Extra larga</p>
                <p>Color: Colorful</p>
                <div class="cantidad">
                    <button>-</button>
                    <span>1</span>
                    <button>+</button>
                </div>
                <p class="precio">$100.00</p>
                <button class="eliminar">Eliminar</button>
            </div>
        </div>
        <!-- Aqui se repite el div producto para más productos -->
        <div class="producto">
            <div class="detalles">
                <p><strong>Alfombra colorida</strong></p>
                <p>Talla: Extra larga</p>
                <p>Color: Colorful</p>
                <div class="cantidad">
                    <button>-</button>
                    <span>1</span>
                    <button>+</button>
                </div>
                <p class="precio">$100.00</p>
                <button class="eliminar">Eliminar</button>
            </div>
        </div>
        <div class="producto">
            <div class="detalles">
                <p><strong>Alfombra colorida</strong></p>
                <p>Talla: Extra larga</p>
                <p>Color: Colorful</p>
                <div class="cantidad">
                    <button>-</button>
                    <span>1</span>
                    <button>+</button>
                </div>
                <p class="precio">$100.00</p>
                <button class="eliminar">Eliminar</button>
            </div>
        </div>
    </section>
    <aside class="resumen">
        <h3>Resumen de compra</h3>
        <p>Productos: 6</p>
        <p>Total: $600.00</p>
        <button>&nbsp;&nbsp;Realizar pedido&nbsp;&nbsp;</button>
        <br>
        <button>&nbsp;&nbsp;&nbsp;&nbsp;Vaciar carrito&nbsp;&nbsp;&nbsp;&nbsp;</button>
    </aside>
</main>
</body>
</html>

