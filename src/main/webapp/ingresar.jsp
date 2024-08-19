<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ingresar</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&family=Sansita:ital,wght@0,400;0,700;0,800;0,900;1,400;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
        #nave, #log {
            text-align: center;
        }
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }
        body {
            background-color: #F2F2F2;
            font-family: "Roboto", sans-serif; /* Cambiado a Roboto */
            font-weight: 300;
            font-style: normal;
        }

        .formu {
            border-radius: 10px;
           /* border: 1px solid black; Mejor sin borde*/
            padding: 30px;
            height: auto;
            background-color: #FFFFFF; /* Añadido fondo blanco para contraste */
        }
        .container {
            margin-top: 1%;
            background-color: #F2F2F2;
        }
        .sidebar {
            padding: 20px;
        }
        #titulo {
            text-align: center;
            font-family: "Sansita", sans-serif; /* Cambiado a Sansita */
            font-size: 36px; /* Tamaño ajustado */
            font-weight: 400;
            font-style: normal;
        }
        p, label, input, a {
            font-family: Helvetica, sans-serif; /* Cambiado a Helvetica */
            font-size: 16px; /* Tamaño más uniforme */
        }
        #mar {
            background-color: #F2F2F2;
        }
        .btn-primary {
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif; /* Fuente sencilla para el botón */
            background-color: #ff15c0; /* Color d fondo */
            font-size: 18px;
            color: white; /* Color letras */
            /*font-weight: bold;*/
            border: 2px solid #ff15c0; /* Borde */
        }
        .btn-primary:hover{
            background-color: #7a34cf ;
        }
        .custom-link{
            color: #ff15c0;
        }
        .custom-link:hover{
            color: #7a34cf ;
        }
    </style>
</head>
<body>

<header class="py-3">
    <div class="container-fluid">
        <div class="row align-items-center">
            <!-- Columna para el logo -->
            <div class="col-6 col-lg-3" id="log">
                <a href="index.jsp">
                    <img src="${pageContext.request.contextPath}/img/logoMM.png" alt="Logo" class="img-fluid" width="100" height="80">
                </a>
            </div>

            <!-- Columna para la barra de búsqueda -->
            <div class="col-12 col-lg-5 d-flex justify-content-center mt-3 mt-lg-0">
            </div>

            <!-- Columna para los enlaces -->
            <div class="col-6 col-lg-4 text-start mt-3 mt-lg-0">
                <nav id="nave">
                    <a class="me-5  link-body-emphasis text-decoration-none" style="color:#FFB2EA" href="registrarse.jsp">Crear cuenta</a>
                    <a class="me-5 link-body-emphasis text-decoration-none" style="color:#FFB2EA" href="index.jsp">Catálogo</a>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-sm-8 col-12 sidebar shadow-lg p-3 mb-5 bg-white rounded" id="mar">
            <div class="formu">
                <form method="post" action="login">
                    <h2 id="titulo"><b>Inicia sesión</b></h2>
                    <br>
                    <p>Ingresa tu correo electrónico y contraseña para acceder a tu cuenta.</p>
                    <br>
                    <div class="form-group mb-3">
                        <label for="correo">Correo electrónico</label>
                        <input type="email" class="form-control mb-3" id="correo" name="correo" required placeholder="Ingresa tu correo">
                    </div>
                    <div class="form-group mb-3">
                        <label for="contra">Contraseña</label>
                        <input type="password" class="form-control mb-3" id="contra" name="contra" required placeholder="Ingresa tu contraseña">
                    </div>
                    <br>
                    <%
                        HttpSession sesion = request.getSession();
                        String mensaje = (String) sesion.getAttribute("mensaje");
                        String msj = (String) sesion.getAttribute("mensajeContraNueva");

                        if (mensaje != null) {
                    %>
                    <div class="alert alert-danger" role="alert"><%= mensaje %></div>
                    <%
                        // Limpiar el mensaje después de mostrarlo
                        sesion.removeAttribute("mensaje");
                    %>
                    <%
                    } else if (msj != null) {
                    %>
                    <div class="alert alert-success" role="alert"><%=msj%></div>
                    <%
                        // Limpiar el mensaje de éxito después de mostrarlo
                        sesion.removeAttribute("mensajeContraNueva");
                    %>
                    <%
                        }
                    %>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                        <br><br>
                        <p><a href="recuperarCuenta.jsp" class="custom-link">Olvidé mi contraseña</a></p>
                        <p>¿No tienes una cuenta? <a href="registrarse.jsp" class="custom-link">Crear cuenta</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
