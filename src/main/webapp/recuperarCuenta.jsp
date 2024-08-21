<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ingresar</title>
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&family=Sansita:ital,wght@0,400;0,700;0,800;0,900;1,400;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
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
        #nave, #log{
            text-align: center;
        }
        p, label, input, a {
            font-family: Helvetica, sans-serif; /* Cambiado a Helvetica */
            font-size: 16px; /* Tamaño más uniforme */
        }
        #titulo {
            text-align: center;
            font-family: "Sansita", sans-serif; /* Cambiado a Sansita */
            font-size: 36px; /* Tamaño ajustado */
            font-weight: 400;
            font-style: normal;
        }
        .btn-primary {
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif; /* Fuente sencilla para el botón */
            background-color: #ff15c0; /* Color d fondo */
            font-size: 18px;
            color: #000000; /* Color letras */
            /*font-weight: bold;*/
            border: 2px solid #ff15c0; /* Borde */
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
                    <img src="img/logoMM.png" alt="Logo" class="img-fluid" width="100" height="80">
                </a>
            </div>

            <!-- Columna para la barra de búsqueda -->
            <div class="col-12 col-lg-5 d-flex justify-content-center mt-auto mt-lg-0">

            </div>

            <!-- Columna para los enlaces -->
            <div class="col-6 col-lg-4 text-start mt-3 mt-lg-0">
                <nav id="nave">
                    <a class="me-5  link-body-emphasis text-decoration-none" style="color:#FFB2EA" href="registrarse.jsp">Crear cuenta</a>
                    <a class="me-5 link-body-emphasis text-decoration-none" style="color:#FFB2EA" href="ingresar.jsp">Ingresar</a>
                </nav>
            </div>
        </div>
    </div>
</header>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5 col-sm-8 col-12 justify-content-center mt-5 m-3 p-3 shadow-lg p-3 mb-5 bg-white rounded" style="background-color: #FFFFFF; border-radius: 20px">
                <form action="recuperarContra" method="post">
                    <h2 id="titulo"><b>Recupera tu contraseña</b></h2>
                    <br>
                    <div class="form-group mb-3 m-2">
                        <label for="correo">Correo electrónico</label>
                        <input type="email" class="form-control mb-3" id="correo" name="correo" required placeholder="ejemplo@gmail.com">
                    </div>
                    <% HttpSession sesion = request.getSession();
                        String mensaje = (String) sesion.getAttribute("mensajeCorreo");
                        if (mensaje != null) { %>
                    <p style="color: red;"><%= mensaje %></p>
                    <% } %>
                    <br>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Verificar</button>
                        <br><br>
                    </div>
                </form>
            </div>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
