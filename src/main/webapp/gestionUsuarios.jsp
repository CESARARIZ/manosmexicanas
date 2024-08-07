<%@ page import="mx.edu.utez.manosmexicanas.dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
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

    <table class="table" id="tabla-redondeada">
        <thead>
        <tr style="background-color: #FE7DCC; margin-bottom: 3px">
            <th>Id</th>
            <th>Nombre</th>
            <th>Correo Electronico</th>
            <th>Telefono</th>
            <th>Dirección</th>
            <th>Status</th>
            <th>Acción</th>
        </tr>
        </thead>
        <tbody>
        <%
            UsuarioDao dao = new UsuarioDao();
            ArrayList<Usuario> lista = dao.getAll();
            if (lista != null && !lista.isEmpty()) {
                int contador = 1;
                String direccion="";
                for( Usuario u : lista){
                    if(u.getDireccion()==null){
                        direccion="Sin direccion registrada.";
                    }else{
                        direccion=u.getDireccion();
                    }
        %>
        <tr>
            <td><%=contador%></td>
            <td><%=u.getNombre_usuario()%></td>
            <td><%=u.getCorreo()%></td>
            <td><%=u.getTelefono()%></td>
            <td><%=direccion%></td>
            <td><%=u.getEstado()%></td>
            <td>
                <div style="vertical-align: middle">
                    <form action="eliminar" method="post">
                        <input type="hidden" name="id_usuario" class="" value="<%= u.getId() %>">
                        <input type="hidden" name="estado" value="<%= u.getEstado() %>">
                        <button type="submit" class="btn <%= "Activo".equals(u.getEstado()) ? "btn-danger" : "btn-success" %>" style="vertical-align: middle">
                            <img src="<%= "Activo".equals(u.getEstado()) ? "img/bloquear-usuario.png" : "img/desbloquear.png" %>" alt="<%= "Activo".equals(u.getEstado()) ? "Bloquear" : "Desbloquear" %>" style="width: 20px; height: 20px;">
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
            <td colspan="7" class="text-center align-middle">Aún no hay clientes registrados.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>