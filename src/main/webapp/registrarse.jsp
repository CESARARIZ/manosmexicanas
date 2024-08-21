<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
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
            background-color: #ff15c0; /* Color d fondo */
            font-size: 18px;
            color: white; /* Color letras */
            /*font-weight: bold;*/
            border: 2px solid #ff15c0;
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
                    <img src="img/logoMM.png" alt="Logo" class="img-fluid" width="100" height="80">
                </a>
            </div>

            <!-- Columna para la barra de búsqueda -->
            <div class="col-12 col-lg-5 d-flex justify-content-center mt-3 mt-lg-0">
            </div>

            <!-- Columna para los enlaces -->
            <div class="col-6 col-lg-4 text-start mt-3 mt-lg-0">
                <nav id="nave">
                    <a class="me-5  link-body-emphasis text-decoration-none" style="color:#FFB2EA" href="ingresar.jsp">Ingresar</a>
                    <a class="me-5 link-body-emphasis text-decoration-none" style="color:#FFB2EA" href="index.jsp">Catálogo</a>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container">
    <div class="row justify-content-center" style="background-color: #F2F2F2;">
        <div class="col-md-6 sidebar shadow-lg p-3 mb-5 bg-white rounded">

            <form method="post" action="sign_in" class="formulario" id="formRegistro" onsubmit="return validarFormulario()">
                <h2 id="titulo"><b>Crear cuenta</b></h2><br>
                <h8 id="sub">Ingresa tus datos para crear una cuenta nueva.</h8><br><br>

                <label for="nombre">Nombre</label>
                <input class="form-control mb-3" type="text" name="nombre" id="nombre" placeholder="Ingrese su nombre..." maxlength="50" required>

                <label for="telefono">Teléfono</label>
                <input class="form-control mb-3" type="text" name="telefono" id="telefono" placeholder="Ingrese su teléfono..." maxlength="10" required>

                <label for="email">Correo electrónico</label>
                <input class="form-control mb-3" type="email" name="email" id="email" placeholder="ejemplo@gmail.com" required>

                <label for="contraseña1">Contraseña</label>
                <input class="form-control mb-3" type="password" name="pass1" id="contraseña1" placeholder="Ingresa tu contraseña..." required>

                <label for="contraseña2">Confirmar contraseña</label>
                <input class="form-control mb-3" type="password" name="pass2" id="contraseña2" placeholder="Confirma tu contraseña..." required>

                <%
                    HttpSession sesion1 = request.getSession();
                    String mensaje2 = (String) sesion1.getAttribute("mensaje2");

                    if (mensaje2 != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= mensaje2 %>
                </div>
                <% sesion1.removeAttribute("mensaje2"); %> <!-- Limpiar el mensaje -->
                <% } %>


                <br>
                <center>
                    <button class="btn btn-primary mb-3 btn-lg" type="submit">Confirmar</button><br>
                    <label id="enl">¿Ya tienes una cuenta? <a href="ingresar.jsp" class="custom-link">Inicia sesión</a></label>
                </center>
            </form>
        </div>
    </div>
</div>

<script>
    function validarFormulario() {
        // Obtener los valores de los campos
        var nombre = document.getElementById("nombre").value.trim();
        var telefono = document.getElementById("telefono").value.trim();
        var email = document.getElementById("email").value.trim();
        var pass1 = document.getElementById("contraseña1").value.trim();
        var pass2 = document.getElementById("contraseña2").value.trim();

        // Validar que ningún campo esté vacío
        if (nombre === "") {
            alert("El nombre no puede estar vacío.");
            return false;
        }

        if (telefono === "") {
            alert("El teléfono no puede estar vacío.");
            return false;
        }

        if (email === "") {
            alert("El correo electrónico no puede estar vacío.");
            return false;
        }

        if (pass1 === "") {
            alert("La contraseña no puede estar vacía.");
            return false;
        }

        if (pass2 === "") {
            alert("La confirmación de contraseña no puede estar vacía.");
            return false;
        }
        // Si todas las validaciones pasan, permitir el envío del formulario
        return true;
    }
</script>
<script src="js/bootstrap.js"></script>
</body>
</html>
