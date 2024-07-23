<%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 30/06/2024
  Time: 02:42 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <style>
        #nave, #log{
            text-align: center;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #2c3e50;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        header .logo img {
            width: 50px;
        }

        header nav a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
        }

        main {
            display: flex;
            justify-content: space-between;
            padding: 20px;
        }

        .carrito, .resumen {
            background-color: #e6e6fa;
            padding: 20px;
            border-radius: 5px;
            width: 45%;
        }

        .carrito h2, .resumen h2 {
            margin-top: 0;
        }

        .producto {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .producto img {
            width: 100px;
            height: 100px;
            margin-right: 10px;
        }

        .producto .detalles {
            flex: 1;
        }

        .producto .cantidad {
            display: flex;
            align-items: center;
            margin-right: 10px;
        }

        .producto .cantidad input {
            width: 40px;
            text-align: center;
            margin: 0 5px;
        }

        .producto .precio {
            width: 100px;
        }

        .producto .btn-eliminar {
            background-color: red;
            color: white;
            border: none;
            padding: 5px;
            cursor: pointer;
        }

        .btn-agregar, .btn-realizar, .btn-vaciar {
            background-color: #8a2be2;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            display: block;
            margin: 10px 0;
            width: 100%;
            text-align: center;
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="perfil.jsp">Perfil</a>
                    <a href="carrito.jsp">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px"></a>

                </nav>
            </div>
        </div>
    </div>

</header>
<main>
<div class="carrito">
    <h2>Carrito</h2>
    <div class="producto">
        <img src="img/Alfombra.jpeg" alt="Alfombra colorida">
        <div class="detalles">
            <p><strong>Alfombra colorida</strong></p>
            <p>Talla: Extra larga</p>
            <p>Color: Colorful</p>
        </div>
        <div class="cantidad">
            <button class="btn-menos">-</button>
            <input type="text" value="1" class="input-cantidad">
            <button class="btn-mas">+</button>
        </div>
        <p class="precio">$100.00</p>
        <button class="btn-eliminar"></button>
    </div>
    <div class="producto">
        <img src="img/Alfombra.jpeg" alt="Alfombra colorida">
        <div class="detalles">
            <p><strong>Alfombra colorida</strong></p>
            <p>Talla: Extra larga</p>
            <p>Color: Colorful</p>
        </div>
        <div class="cantidad">
            <button class="btn-menos">-</button>
            <input type="text" value="2" class="input-cantidad">
            <button class="btn-mas">+</button>
        </div>
        <p class="precio">$200.00</p>
        <button class="btn-eliminar"></button>
    </div>
    <div class="producto">
        <img src="img/Alfombra.jpeg" alt="Alfombra colorida">
        <div class="detalles">
            <p><strong>Alfombra colorida</strong></p>
            <p>Talla: Extra larga</p>
            <p>Color: Colorful</p>
        </div>
        <div class="cantidad">
            <button class="btn-menos">-</button>
            <input type="text" value="3" class="input-cantidad">
            <button class="btn-mas">+</button>
        </div>
        <p class="precio">$300.00</p>
        <button class="btn-eliminar"></button>
    </div>
    <button class="btn-agregar">Agregar más productos</button>
</div>
<div class="resumen">
    <h2>Resumen de compra</h2>
    <p>Productos: 6</p>
    <p>Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $600.00</p>
    <button class="btn-realizar">Realizar pedido</button>
    <button class="btn-vaciar">Vaciar carrito</button>
</div>
</main>

</body>
</html>
