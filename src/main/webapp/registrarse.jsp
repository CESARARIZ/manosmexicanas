<%--
  Created by IntelliJ IDEA.
  User: dan-a
  Date: 23/06/2024
  Time: 10:33 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
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
        #formRegistro {
            border-radius: 10px;
            border: 1px solid black;
            padding: 30px;
            height: auto;
            margin-top: 2%;
            background-color: #FFFFFF;

        }
        #titulo{
            text-align: center;
            font-family: Sansita;
            font-size: 36px;
        }
        #sub{
            font-family: Roboto;
            font-size: 18px;
            margin-top: 15px;
        }

        body{
            background-color: #F2F2F2;
        }
        label{
            font-family: Roboto;
        }
        #enl{
            font-family: Monserrat;

        }
        .container{
            margin-top: 1%;
            background-color: #F2F2F2;
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
                <h4 id="titulo">CREAR CUENTA</h4>
                <h8 id="sub">Ingresa tus datos para crear una cuenta nueva.</h8><br>
                <label for="nombre">Nombre</label>
                <input class="form-control mb-3" type="text" name="nombre" id="nombre" placeholder="Ingrese su nombre" maxlength="50">
                <label for="telefono">Telefono</label>
                <input class="form-control mb-3" type="text" name="telefono" id="telefono" placeholder="Ingrese su telefono" maxlength="10">
                <label for="email">Correo electronico</label>
                <input class="form-control mb-3" type="text" name="email" id="email" placeholder="ejemplo@gmail.com" required>
                <label for="contraseña1">Contraseña</label>
                <input class="form-control mb-3" type="password" name="pass1" id="contraseña1" placeholder="Ingresa tu contraseña" required>
                <label for="contraseña2">Confirmar contraseña</label>
                <input class="form-control mb-3" type="password" name="pass2" id="contraseña2" placeholder="Confirma tu contraseña" required>
                <%
                    HttpSession sesion1 = request.getSession();
                    String mensaje2 = (String) sesion1.getAttribute("mensaje2");

                    if(mensaje2 !=null){ %>
                <p style="color: red;"><%=mensaje2%></p>
                <% } %>
                <br>
                <center>
                    <button class="btn btn-primary mb-3" type="submit">Crear cuenta</button><br>
                    <label for="index" id="enl">¿Ya tienes una cuenta? <a href="ingresar.jsp">inicia sesión</a> </label>
                </center>
            </form>
        </div>
    </div>
</div>
</body>
</html>
