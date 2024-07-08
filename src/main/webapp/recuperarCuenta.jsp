<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingresar Correo</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <style>
        body {
            background-color: #F2F2F2;
            font-family: Arial, sans-serif;
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
            font-family: Sansita;
            font-size: 30px;
        }

        .form-group {
            text-align: left;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .text-center button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .text-center button:hover {
            background-color: #0056b3;
        }

        .text-center a {
            color: #007bff;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        .header a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
        }
    </style>
</head>
<body>

<header>
    <div class="container-fluid">
        <div id="log">
            <a href="index.jsp"><img src="logo.png" alt="Logo"></a>
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
                        <h2 id="titulo"><b>Bienvenido</b></h2>
                        <br>
                        <div class="form-group mb-3">
                            <label for="correo" style="font-family: Roboto; font-size: 18px;">Correo electrónico</label>
                            <input type="email" style="font-family: Monserrat; font-size: 17px" class="form-control mb-3" id="correo" name="correo" required placeholder="ejemplo@gmail.com">
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