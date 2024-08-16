<%@ page import="mx.edu.utez.manosmexicanas.dao.ProductoDao" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.PedidoDetalle" %>
<%@ page import="mx.edu.utez.manosmexicanas.dao.PedidoDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 30/06/2024
  Time: 01:30 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pedidos</title>
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="publicarProductos.jsp">Publicar</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="gestionUsuarios.jsp">Clientes</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  style="color:#FFB2EA" href="gestionProductos.jsp">Productos</a>

                </nav>
            </div>
        </div>
    </div>

</header>

<div class="container">
    <div class="row align-items-center" style="margin-top: 30px; margin: 30px">
        <div class="col-md-8">
            <h1 style="font-family: 'Sansita', sans-serif;"><b>Pedidos</b></h1>
        </div>
        <div class="col-md-4">
            <div class="form-inline justify-content-end">
                <div class="search-bar-container">
                    <input class="form-control mb-lg-0" type="search" placeholder="Buscar" aria-label="Buscar">
                </div>
            </div>
        </div>
    </div>
    <table class="table" id="tabla-redondeada">
        <thead>
        <tr style="background-color: #FE7DCC; margin-bottom: 3px">
            <th>#</th>
            <th>Cliente</th>
            <th>Producto</th>
            <th>Categoria</th>
            <th>Talla</th>
            <th>Color</th>
            <th class="text-center">Unidades</th>
            <th>Total</th>
            <th>Estatus</th>
            <th>Accion</th>
        </tr>
        </thead>
        <tbody>
        <%
            PedidoDao dao = new PedidoDao();
            List<PedidoDetalle> lista = null;
            lista = dao.getPedidoDetallesParaAdministrador();
            if (lista != null && !lista.isEmpty()) {
                int contador = 1;
                for( PedidoDetalle p : lista){
        %>
        <tr>
            <td class="py-3"><%=contador%></td>
            <td class="py-3"><%=p.getNombre_cliente()%></td>
            <td class="py-3"><%=p.getNombre_producto()%></td>
            <td class="py-3"><%= p.getNombre_categoria()%></td>
            <td class="py-3 text-center"><%=p.getNombre_talla()%></td>
            <td class="py-3"><%=p.getNombre_color()%></td>
            <td class="py-3 text-center"><%=p.getCantidad()%></td>
            <td class="py-3">$<%=p.getTotal()%></td>
            <td class="py-3">
                <input type="button" class="btn <%="Pendiente".equals(p.getEstado()) ? "btn-danger" : "btn-success" %>" value="<%="Pendiente".equals(p.getEstado()) ? "Pendiente" : "Entregado" %>" readonly>
            </td>
            <td class="d-flex align-items-center py-2">
                <%
                    if("Pendiente".equals(p.getEstado())){
                %>
                <form action="entregarPedido" method="post" class="align-middle">
                    <input type="hidden" name="id_pedido_detalle" value="<%=p.getId_pedido_detalle()%>">
                    <input type="hidden" name="id_pedido" value="<%=p.getId_pedido()%>">
                    <input type="hidden" name="estado" value="<%=p.getEstado()%>">
                    <input type="submit" class="btn btn-outline-danger align-middle mt-4" value="Entregar">
                </form>
                <%
                } else {
                %>
                <input type="button" class="btn btn-secondary align-middle mt-4" value="Entregado" readonly>
                <% } %>
            </td>

        </tr>
        <%
                contador++;
            }
        } else {
        %>
        <tr>
            <td colspan="10" class="text-center align-middle">Aún no hay pedidos registrados.</td>

        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
