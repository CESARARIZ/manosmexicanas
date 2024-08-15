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
            background-color: #ffdaf1; /* Color d fondo */
            font-size: 18px;
            color: #000000; /* Color letras */
            /*font-weight: bold;*/
            border: 2px solid #ffdaf1; /* Borde */

        }
    </style>
</head>
<body>

<header>
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-lg-2" id="log">
                <a href="index.jsp"><img src="img/logoMM.png" alt="" width="100px" height="80px"></a>
            </div>
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0">
                    <!-- Aquí podrías agregar una barra de búsqueda si es necesario -->
                </form>
            </div>
            <div class="col-lg-4">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="index.jsp">Catálogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="registrarse.jsp">Registrarse</a>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5 col-sm-8 col-12 sidebar" id="mar">
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
                    <% HttpSession sesion = request.getSession();
                        String mensaje = (String) sesion.getAttribute("mensaje");
                        if (mensaje != null) { %>
                    <p style="color: red;"><%= mensaje %></p>
                    <% } %>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Iniciar sesión</button>
                        <br><br>
                        <p><a href="recuperarCuenta.jsp">Olvidé mi contraseña</a></p>
                        <p>¿No tienes una cuenta? <a href="registrarse.jsp">Crear cuenta</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
