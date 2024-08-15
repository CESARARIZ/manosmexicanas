<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ingresar</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <style>
        body {
            background-color: #F2F2F2;
            font-family: Arial, sans-serif; /* Fuente sencilla */
        }

        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
        }

        .container-fluid {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #log img {
            width: 100px;
            height: 60px;
        }

        #nave {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        #nave a {
            color: #fff;
            margin-left: 20px;
            text-decoration: none;
            font-family: Arial, sans-serif; /* Fuente sencilla */
        }

        .container {
            margin-top: 5%;
            background-color: #F2F2F2;
        }

        .sidebar {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            border: 1px solid black;
            width: 100%;
            max-width: 400px;
        }

        .formu {
            text-align: center;
        }

        #titulo {
            text-align: center;
            font-family: Verdana, sans-serif; /* Cambiado a Verdana */
            font-size: 30px; /* Tamaño ajustado */
        }

        .form-group {
            text-align: left;
            font-family: Helvetica, sans-serif; /* Cambiado a Helvetica */
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-family: Arial, sans-serif; /* Fuente sencilla */
        }

        .text-center button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-family: Arial, sans-serif; /* Fuente sencilla */
        }

        .text-center button:hover {
            background-color: #0056b3;
        }

        .text-center a {
            color: #007bff;
            text-decoration: none;
            font-family: Arial, sans-serif; /* Fuente sencilla */
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        .header a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
            font-family: Arial, sans-serif; /* Fuente sencilla */
        }
    </style>
</head>
<body>

<header>
    <div class="container-fluid">
        <div id="log">
            <img src="img/logoMM.png" alt="" width="100px" height="80px">
        </div>
        <div id="nave">
            <a href="index.jsp">Catálogo</a>
            <a href="registrarse.jsp">Registrarse</a>
        </div>
    </div>
</header>
<center>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 d-flex justify-content-center">
                <div class="sidebar bg-light">
                    <div class="formu">
                        <form method="post" action="recuperarContra">
                            <h2 id="titulo"><b>Recupera tu contraseña</b></h2>
                            <br>
                            <div class="form-group mb-3">
                                <label for="correo">Correo electrónico</label>
                                <input type="email" class="form-control mb-3" id="correo" name="correo" required placeholder="ejemplo@gmail.com">
                            </div>
                            <br>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Verificar</button>
                                <br><br>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div></center>
</body>
</html>
