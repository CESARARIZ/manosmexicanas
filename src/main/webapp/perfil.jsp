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
    assert usuario != null;%>

<html>
<head>
    <title>Perfil</title>
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
            background-color: #ffffff;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            /*border: 5px solid #dee2e6;*/
        }

        .info-personal {
            background-color: #ffdaf1;
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

         .table th, .table td {
             width: 5%; /* O ajusta este valor según tus necesidades */
             text-align: center;
             vertical-align: middle;
         }

        .table img {
            display: block;
            margin: 0 auto;
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



        #tabla-redondead thead th:first-child {
            border-top-left-radius: 10px;
            font-family: "Sansita", sans-serif; /* Cambiado a Sansita */
        }

        #tabla-redondead thead th:last-child {
            border-top-right-radius: 10px;
        }

        /* Aplica el borde redondeado a las esquinas del pie de la tabla */
        #tabla-redondead tbody tr:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }

        #tabla-redondead tbody tr:last-child td:last-child {
            border-bottom-right-radius: 10px;
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" style="color: #FFB2EA" href="indexCliente.jsp">Catálogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" style="color: #FFB2EA" href="pedido?id_usuario=<%=id_usuario%>">Pedidos</a>
                    <a href="verCarrito">
                        <img src="img/carritoB.png" alt="" width="45px" height="45px"></a>
                </nav>
            </div>
        </div>
    </div>

</header>
<div class="container mt-4 mb-4" style="border: 1px solid; border-radius: 8px;">
    <div class="row" style="background-color: #FEE9F5; border-radius: 8px;">
        <div class="col-md-2 m-4">
            <img src="img/icono_de_perfil.png" alt="Perfil" height="150" width="230">
        </div>
        <div class="col-md-6 mt-4">
            <div>
                <h2> <%=usuario.getNombre_usuario()%> </h2>
                <p style="font-size: 20px;" class="mt-3"><b>Contacto:</b> <br>
                    Correo: <%=usuario.getCorreo()%> <br>
                    Telefono: <%=usuario.getTelefono()%> </p>
            </div>
        </div>
    </div>
    <div class="row mt-1 align-content-center">
        <div class="col-md-1"></div>
        <div class="col-md-10 mt-1">
            <table class="table table-striped  table-hover mt-5 caption-top table-responsive m-3 me-3" id="tabla-redondeada">
                <caption>
                    <div class="row">
                        <div class="col-md-2">
                            <h5>Mis Pedidos</h5>
                        </div>
                        <div class="col-md-8"></div>
                        <div class="col-md-2 text-center">
                            <a href="pedidosPendientes?id_usuario=<%=id_usuario%>">
                                <img src="img/ojo.png" alt="" width="45px" height="45px"></a>
                        </div>
                    </div>
                </caption>
                <thead>
                <tr style="background-color: #FE7DCC; margin-bottom: 3px">
                    <th>Imagen</th>
                    <th>Nombre</th>
                    <th>Categoria</th>
                    <th>Talla</th>
                    <th>Color</th>
                    <th>Unidades</th>
                    <th>Total</th>
                    <th>Estatus</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><img src="alfombra.jpg" alt="Alfombra" width="50"></td>
                    <td>Mantel para mesa</td>
                    <td>Decorativos</td>
                    <td>G</td>
                    <td>Multicolor</td>
                    <td>1</td>
                    <td>$150.00</td>
                    <td class="mx-3"> <button type="button" class="btn btn-danger btn-sm">PENDIENTE</button></td>
                </tr>
                <tr>
                    <td><img src="alfombra.jpg" alt="Alfombra" width="50"></td>
                    <td>Alfombra colorida</td>
                    <td>Decorativos</td>
                    <td>G</td>
                    <td>Roja</td>
                    <td>1</td>
                    <td>$100.00</td>
                    <td class="mx-3"> <button type="button" class="btn btn-danger btn-sm">PENDIENTE</button></td>
                </tr>
                </tbody>
            </table>

            <table class="table table-striped table-hover mt-5 caption-top table-responsive m-3 me-3" id="tabla-redondead">
                <caption>
                    <div class="row">
                        <div class="col-md-2">
                            <h5>Mis Compras</h5>
                        </div>
                        <div class="col-md-8"></div>
                        <div class="col-md-2 text-center">
                            <a href="compras?id_usuario=<%=id_usuario%>">
                                <img src="img/ojo.png" alt="" width="45px" height="45px"></a>
                        </div>
                    </div>
                </caption>
                <thead>
                <tr style="background-color: #FE7DCC; margin-bottom: 3px">
                    <th>Imagen</th>
                    <th>Nombre</th>
                    <th>Categoria</th>
                    <th>Talla</th>
                    <th>Color</th>
                    <th>Unidades</th>
                    <th>Total</th>
                    <th>Estatus</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><img src="alfombra.jpg" alt="Alfombra" width="50"></td>
                    <td>Mantel para mesa</td>
                    <td>Decorativos</td>
                    <td>G</td>
                    <td>Multicolor</td>
                    <td>1</td>
                    <td>$150.00</td>
                    <td class="mx-5"> <button type="button" class="btn btn-secondary btn-sm">RECIBIDO</button></td>
                </tr>
                <tr>
                    <td><img src="alfombra.jpg" alt="Alfombra" width="50"></td>
                    <td>Alfombra colorida</td>
                    <td>Decorativos</td>
                    <td>G</td>
                    <td>Roja</td>
                    <td>1</td>
                    <td>$100.00</td>
                    <td class="mx-5"> <button type="button" class="btn btn-secondary btn-sm">RECIBIDO</button></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="js/bootstrap.js"></script>
</body>
</html>
