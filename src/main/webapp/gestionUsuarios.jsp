<%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 30/06/2024
  Time: 01:29 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Clientes</title>
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
        table{
            width: 100%;
            margin: 10px;
            margin-top: 10px;
            border-radius: 10px;
        }
        .search-bar-container {
            position: relative;
            max-width: 400px; /* Máximo ancho de la barra de búsqueda */
            width: 100%;

        }

        td, th{
            font-family: Sansita;
            font-size: 20px;

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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="indexAdmin.jsp">Catálogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionPedidos.jsp">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="publicarProductos.jsp">Publicar</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionProductos.jsp">Productos</a>

                </nav>
            </div>
        </div>
    </div>

</header>
<div class="container">

    <div class="row align-items-center" style="margin-top: 30px; margin: 30px">
        <div class="col-md-8">
            <h1 style="font-family: Sansita; font-size: 36px"><b>Usuarios Registrados</b></h1>
        </div>
        <div class="col-md-4">
            <div class="form-inline justify-content-end">
                <div class="search-bar-container">
                    <input class="form-control mb-lg-0" type="search" placeholder="Buscar cliente..." aria-label="Buscar">
                </div>
            </div>
        </div>
    </div>

    <table class="table-striped table-hover">
        <thead>
        <tr style="background-color: #FE7DCC">
            <th>Id</th>
            <th>Nombre</th>
            <th>Telefono</th>
            <th>Correo Electronico</th>
            <th>Dirección</th>
            <th>Status</th>
            <th>Acción</th>
        </tr>
        </thead>
    </table>
</div>

</body>
</html>