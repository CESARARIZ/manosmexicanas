<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Recuperar Contraseña</title>
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

        .formu {
            border-radius: 10px;
            border: 1px solid black;
            padding: 60px;
            height: auto;

        }
        .container{
            margin-top: 1%;
            background-color: #F2F2F2;
        }
        /* Estilos personalizados */
        .sidebar {
            padding: 20px;
        }
        body{
            background-color: #F2F2F2;
        }
        #titulo{
            text-align: center;
            font-family: Sansita;
            font-size: 50px;
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
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LsuA BARRA DE BUSQUEDA-->
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0">

                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
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
        <div class="col-12 d-flex justify-content-center">
            <div class="sidebar bg-light">
                <div class="formu">
                    <form method="post" action="login">
                        <h2 id="titulo"><b>Recuperar contraseña</b></h2>
                        <br>
                        <div class="form-group mb-3">
                            <label for="correo" style="font-family: Roboto; font-size: 18px;">Ingresa tu correo electrónico</label>
                            <input type="email" style="font-family: Monserrat; font-size: 17px" class="form-control mb-3" id="correo" name="correo" required placeholder="Ingresa tu correo">
                        </div>
                        <br>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Recuperar contraseña</button>
                            <br><br>
                            <p><a href="ingresar.jsp">Iniciar sesión</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div></center>
</body>
</html>