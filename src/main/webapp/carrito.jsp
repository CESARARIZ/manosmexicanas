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
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }
        body{
            background-color: #F2F2F2;
        }
        .container-fluid {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #log img {
            width: 100px;
            height: 60px;
        }

        #nave {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        #nave a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
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

</body>
</html>