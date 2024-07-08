
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }
        .logo {
            width: 150px;
            margin-bottom: 20px;
        }
        .title {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .subtitle {
            font-size: 16px;
            margin-bottom: 20px;
            color: #777;
        }
        .input-group {
            margin-bottom: 20px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .link {
            display: block;
            margin-bottom: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .link:hover {
            text-decoration: underline;
        }
        .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .header {
            background-color: #2c3e50;
            color: #fff;
            padding: 10px;
            text-align: right;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .header a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <a href="#">Catálogo</a>
        <a href="#">Crea tu cuenta</a>
    </div>
    <img src="logoMM.png" alt="Manos Mexicanas" class="logo">
    <div class="title">Recuperar Contraseña</div>
    <div class="subtitle">Ingresa tu nueva contraseña</div>
    <div class="input-group">
        <input type="password" placeholder="Ingresa tu nueva contraseña...">
    </div>
    <div class="input-group">
        <input type="password" placeholder="Ingresa de nuevo tu contraseña...">
    </div>
    <button class="btn">Recuperar contraseña</button>
</div>
</body>
</html>

