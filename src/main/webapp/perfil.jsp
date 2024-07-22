<%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 30/06/2024
  Time: 02:43 p. m.
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
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }
        body{
            background-color: #F2F2F2;
        }
        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
        }

        .perfil {
            background-color: #fff;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .info-personal {
            background-color: #f8e6ef;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
        }

        .mis-pedidos, .mis-compras {
            margin-bottom: 20px;
        }

        h3 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        table th {
            background-color: #f2f2f2;
        }

        table img {
            width: 50px;
            height: auto;
        }

        .estatus-recibido {
            background-color: #d4edda;
            color: #155724;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
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
                    <a href="carrito.html">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px"></a>
                </nav>
            </div>
        </div>
    </div>

</header>
<form>
<section class="perfil">
    <div class="info-personal">
        <h2>Maximiliano Roque Balboa</h2>
        <p><a href="mailto:max@gmail.com">max@gmail.com</a></p>
        <p>Número de teléfono</p>
        <p>7771234567</p>
    </div>
    <div class="mis-pedidos">
        <h3>Mis pedidos</h3>
        <table>
            <thead>
            <tr>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Categoría</th>
                <th>Estatus</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><img src="mantel.png" alt="Mantel"></td>
                <td>Mantel</td>
                <td>Mantel de mesa</td>
                <td>$150.00</td>
                <td>Decorativos</td>
                <td></td>
            </tr>
            <tr>
                <td><img src="img/" alt="Alfombra"></td>
                <td>Alfombra</td>
                <td>Alfombra colorida</td>
                <td>$100.00</td>
                <td>Decorativos</td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="mis-compras">
        <h3>Mis compras</h3>
        <table>
            <thead>
            <tr>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Categoría</th>
                <th>Estatus</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><img src="mantel.png" alt="Mantel"></td>
                <td>Mantel</td>
                <td>Mantel de mesa</td>
                <td>$150.00</td>
                <td>Decorativos</td>
                <td><span class="estatus-recibido">RECIBIDO</span></td>
            </tr>
            <tr>
                <td><img src="alfombra.png" alt="Alfombra"></td>
                <td>Alfombra</td>
                <td>Alfombra colorida</td>
                <td>$100.00</td>
                <td>Decorativos</td>
                <td><span class="estatus-recibido">RECIBIDO</span></td>
            </tr>
            </tbody>
        </table>
    </div>
</section></form>
</main>
</body>
</html>
