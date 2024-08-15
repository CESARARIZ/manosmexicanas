<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
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
            font-family: Arial, sans-serif; /* Cambiado a Arial */
        }
        #formRegistro {
            border-radius: 10px;
            /*border: 1px solid black;*/
            padding: 30px;
            height: auto;
            margin-top: 2%;
            background-color: #FFFFFF; /* Añadido fondo blanco para contraste */
        }
        #titulo {
            text-align: center;
            font-family: "Sansita", sans-serif; /* Cambiado a Sansita */
            font-size: 36px; /* Tamaño ajustado */
            font-weight: 400;
            font-style: normal;
        }
        #sub {
            font-family: Helvetica, sans-serif; /* Cambiado a Helvetica */
            font-size: 16px; /* Tamaño ajustado */
            margin-top: 15px;
        }
        label, #enl {
            font-family: Helvetica, sans-serif; /* Cambiado a Helvetica */
            font-size: 16px; /* Tamaño más uniforme */
        }
        .container {
            margin-top: 1%;
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
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="ingresar.jsp">Ingresar</a>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <div class="row justify-content-center" style="background-color: #F2F2F2;">
        <div class="col-md-6 sidebar">

            <form method="post" action="sign_in" class="formulario" id="formRegistro">
                <h2 id="titulo"><b>Crear cuenta</b></h2><br>
                <h8 id="sub">Ingresa tus datos para crear una cuenta nueva.</h8><br><br>
                <label for="nombre">Nombre</label>
                <input class="form-control mb-3" type="text" name="nombre" id="nombre" placeholder="Ingrese su nombre" maxlength="50">
                <label for="telefono">Teléfono</label>
                <input class="form-control mb-3" type="text" name="telefono" id="telefono" placeholder="Ingrese su teléfono" maxlength="10">
                <label for="email">Correo electrónico</label>
                <input class="form-control mb-3" type="email" name="email" id="email" placeholder="ejemplo@gmail.com" required>
                <label for="contraseña1">Contraseña</label>
                <input class="form-control mb-3" type="password" name="pass1" id="contraseña1" placeholder="Ingresa tu contraseña" required>
                <label for="contraseña2">Confirmar contraseña</label>
                <input class="form-control mb-3" type="password" name="pass2" id="contraseña2" placeholder="Confirma tu contraseña" required>
                <%
                    HttpSession sesion1 = request.getSession();
                    String mensaje2 = (String) sesion1.getAttribute("mensaje2");

                    if (mensaje2 != null) { %>
                <p style="color: red;"><%=mensaje2%></p>
                <% } %>
                <br>
                <center>
                    <button class="btn btn-primary mb-3" type="submit">Continuar</button><br>
                    <label for="index" id="enl">¿Ya tienes una cuenta? <a href="ingresar.jsp">Inicia sesión</a></label>
                </center>
            </form>
        </div>
    </div>
</div>
</body>
</html>
