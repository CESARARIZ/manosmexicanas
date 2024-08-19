<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manos Mexicanas</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link href="https://fonts.googleapis.com/css2?family=Sansita:wght@400&display=swap" rel="stylesheet">

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
        #titulo{
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
                    <img src="${pageContext.request.contextPath}/img/logoMM.png" alt="Logo" class="img-fluid" width="100" height="80">
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
            <form action="updateContra" method="post">
                <h2 id="titulo"><b>Actualiza tu contraseña</b></h2>
                <br>
                <div class="form-group mb-4 m-2">
                    <label for="contra1">Ingresa tu nueva contraseña</label>
                    <input type="password" class="form-control mb-3" id="contra1" name="contra1" required placeholder="Ingresa tu contraseña...">
                </div>
                <div class="form-group mb-4 m-2">
                    <label for="contra2">Confirma tu nueva contraseña</label>
                    <input type="password" class="form-control mb-3" id="contra2" name="contra2" required placeholder="Confirma tu contraseña...">
                </div>
                <% HttpSession sesion = request.getSession();
                    String mensaje = (String) sesion.getAttribute("mensajeContra");
                    if (mensaje != null) { %>
                <p style="color: red;"><%= mensaje %></p>
                <% } %>
                <br>
                <input type="hidden" name="id" value="${param.id}">
                <input type="hidden" name="codigo" value="${param.codigo}">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                    <br><br>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>