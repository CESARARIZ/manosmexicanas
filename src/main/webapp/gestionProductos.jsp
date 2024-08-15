<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.manosmexicanas.dao.ProductoDao" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Producto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 30/06/2024
  Time: 01:29 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Productos</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&family=Sansita:ital,wght@0,400;0,700;0,800;0,900;1,400;1,700;1,800;1,900&display=swap" rel="stylesheet">
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
        .search-bar-container {
            position: relative;
            max-width: 400px; /* Máximo ancho de la barra de búsqueda */
            width: 100%;

        }
        table{
            width: 100%;
            margin: 10px;
            margin-top: 10px;
            border-radius: 10px;
            border: 3px solid #333;
        }
        td, th{
            font-family: Sansita;
            font-size: 20px;
            padding: 10px;
            vertical-align: middle;

        }
        tbody tr{
            border: 0.5px solid #A7A7A7;
        }
        tbody tr:nth-child(even) {
            background-color: #FEE9F5; /* Color para las filas pares */
        }

        /* Aplica el borde redondeado a las esquinas de la cabecera */
        #tabla-redondeada thead th:first-child {
            border-top-left-radius: 10px;
            font-family: "Sansita", sans-serif; /* Cambiado a Sansita */
        }

        #tabla-redondeada thead th:last-child {
            border-top-right-radius: 10px;
        }

        /* Aplica el borde redondeado a las esquinas del pie de la tabla */
        #tabla-redondeada tbody tr:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }

        #tabla-redondeada tbody tr:last-child td:last-child {
            border-bottom-right-radius: 10px;
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="indexAdmin.jsp">Catálogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="gestionPedidos.jsp">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="publicarProductos.jsp">Publicar</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="gestionUsuarios.jsp">Clientes</a>

                </nav>
            </div>
        </div>
    </div>

</header>
<div class="container">
    <div class="row align-items-center" style="margin-top: 30px; margin: 30px">
        <div class="col-md-8">
            <h1 style="font-family: 'Sansita', sans-serif;"><b>Productos</b></h1>
        </div>
        <div class="col-md-4">
            <div class="form-inline justify-content-end">
                <div class="search-bar-container">
                    <input class="form-control mb-lg-0" type="search" placeholder="Buscar pedido..." aria-label="Buscar">
                </div>
            </div>
        </div>
    </div>
    <table class="table" id="tabla-redondeada">
        <thead>
        <tr style="background-color: #FE7DCC; margin-bottom: 3px; height: 40px">
            <th>#</th>
            <th>Nombre</th>
            <th>Descripcion</th>
            <th>Categoria</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Estado</th>
            <th>Acción</th>
        </tr>
        </thead>
        <tbody>
        <%
            ProductoDao dao = new ProductoDao();
            List<Producto> lista = null;
            try {
                lista = dao.obtenerTodosLosProductos();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if (lista != null && !lista.isEmpty()) {
                int contador = 1;
                for( Producto p : lista){
        %>
        <tr style="height: 60px;">
            <td><%=contador%></td>
            <td><%=p.getNombre_producto()%></td>
            <td><%=p.getDescripcion()%></td>
            <td><%= p.getCategoria().getNombre_categoria() %></td>
            <td>$<%=p.getPrecio()%></td>
            <td><%=p.getStockDisponible()%></td>
            <td><%=p.getEstado()%></td>
            <td>
                <div style="vertical-align: middle">
                    <form action="desactivarProducto" method="post">
                        <input type="hidden" name="id_producto" class="" value="<%= p.getId_producto() %>">
                        <input type="hidden" name="estado" value="<%= p.getEstado() %>">
                        <button type="submit" class="btn <%= "Disponible".equals(p.getEstado()) ? "btn-danger" : "btn-success" %>" style="vertical-align: middle">
                            <img src="<%= "Disponible".equals(p.getEstado()) ? "img/bloquear-usuario.png" : "img/desbloquear.png" %>" alt="<%= "Disponible".equals(p.getEstado()) ? "No disponible" : "Disponible" %>" style="width: 20px; height: 20px;">
                        </button>
                    </form>
                </div>
            </td>




        </tr>
        <%
                contador++;
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="text-center align-middle">Aún no hay productos registrados.</td>
            <td colspan="7" class="text-center align-middle">
                <button class="btn btn-outline-primary">Publicar productos ahors</button>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>