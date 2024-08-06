<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page import="mx.edu.utez.manosmexicanas.dao.ProductoDao" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Producto" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.manosmexicanas.dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sessionn = request.getSession(false);
    Usuario usuario = null;
    int id_usuario = 0;
    if (sessionn != null) {
        usuario = (Usuario) sessionn.getAttribute("usuario");
        if (usuario != null) {
            id_usuario = usuario.getId();
            System.out.println("ID del usuario recuperado: " + id_usuario);
        } else {
            // Redirigir a la página de inicio de sesión si el usuario no está en la sesión
            response.sendRedirect("ingresar.jsp");
        }
    } else {
        // Redirigir a la página de inicio de sesión si no hay sesión
        response.sendRedirect("ingresar.jsp");
    }
%>

<html>
<head>
    <title>Perfil</title>
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
            border: 5px solid #dee2e6;
        }

        .info-personal {
            background-color: #f8e6ef;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;

        }
        .info-personal img {
            border-radius: 50%;
            margin-right: 20px;
            width: 100px;
            height: 100px;
            object-fit: cover;
            justify-self: center;
        }
        .info-personal div {
            flex-grow: 1;
            text-align: left;
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
            <div class="col-lg-2" id="log"><a href="indexCliente.jsp">
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none"  href="pedido?id_usuario=<%=id_usuario%>">Pedidos</a>
                    <a href="carrito.html">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px"></a>
                </nav>
            </div>
        </div>
    </div>

</header>
<div class="container">

    <div class="row" style="background-color: #FE7DCC">

        <div class="col-md-2 m-2">
            <img src="img/icono_de_perfil.png" alt="Perfil" height="150" width="230">
        </div>
        <div class="col-md-4 m-2">
            <div>
                <%
                    UsuarioDao dao = new UsuarioDao();
                %>
                <h2><%= usuario.getNombre_usuario() %></h2>
                <p><a href="<%=usuario.getCorreo()%>"><%=usuario.getCorreo()%></a></p>
                <p>Número de teléfono</p>
                <p><%=usuario.getTelefono()%></p>
            </div>
        </div>
    </div>

    <div class="row" style="background-color: #FE7DCC">

        <div class="col-md-6 text-center" style="align-items: center">
            <form>
                <section class="perfil">

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
                                <td><img src="img/Mantel.jpeg" alt="Mantel"></td>
                                <td>Mantel</td>
                                <td>Mantel de mesa</td>
                                <td>$150.00</td>
                                <td>Decorativos</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><img src="img/Alfombra.jpeg" alt="Alfombra"></td>
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
                                <td><img src="img/Mantel.jpeg" alt="Mantel"></td>
                                <td>Mantel</td>
                                <td>Mantel de mesa</td>
                                <td>$150.00</td>
                                <td>Decorativos</td>
                                <td><span class="estatus-recibido">RECIBIDO</span></td>
                            </tr>
                            <tr>
                                <td><img src="img/Alfombra.jpeg" alt="Alfombra"></td>
                                <td>Alfombra</td>
                                <td>Alfombra colorida</td>
                                <td>$100.00</td>
                                <td>Decorativos</td>
                                <td><span class="estatus-recibido">RECIBIDO</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </form>
        </div>
    </div>
</div>
</body>
</html>
