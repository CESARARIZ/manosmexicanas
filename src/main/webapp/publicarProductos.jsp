<%@ page import="mx.edu.utez.manosmexicanas.dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manos Mexicanas</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <style>
        .sidebar {
            padding: 20px 0;
            position: relative;
            top: 20px;
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
        }
        .filter-box {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
        }
        .filter-box h5 {
            margin-bottom: 10px;
        }
        .filter-box label {
            display: block;
        }
        #log {
            text-align: left;
        }
        .navbar {
            padding: 5px 0;
        }
        .filter-box {
            margin: 0 20px;
            margin-top: 20px;
        }
        #nave, #log {
            text-align: center;
        }
        img {
            max-width: 190px;
            border-radius: 10px;
            margin-bottom: 20px; /* Espacio debajo de la imagen */
        }
        .item {
            border-radius: 10px;
            border: 1px solid black;
            margin-right: 10px;
            margin-top: 20px;
        }
        .item:hover {
            box-shadow: 0 10px 20px rgb(0, 0, 0);
        }
        .info-producto {
            padding: 1px 20px;
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        .form-color-rouse {
            background-color: #f5eaf1;
            text-align: left;
            display: inline-block;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            width: 100%; /* Para ocupar todo el ancho del contenedor */
            box-sizing: border-box; /* Para incluir el padding dentro del ancho */
            text-align: center; /* Para centrar el contenido */
        }
        .form-color-rouse p {
            text-align: left; /* Para alinear el texto a la izquierda */
        }
        .info-producto button {
            border: none;
            background: none;
            background-color: #000;
            color: #fff;
            padding: 15px 10px;
            cursor: pointer;
            border-radius: 10px;
            margin: 7px;
        }
    </style>
</head>
<body>
<header>
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-lg-2" id="log">
                <a href="indexCliente.jsp">
                    <img src="img/logoMM.png" alt="" width="100px" height="80px">
                </a>
            </div>
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0"></form>
            </div>
            <div class="col-lg-4">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="indexAdmin.jsp">Catálogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionPedidos.jsp">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="publicarProductos.jsp">Publicar</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" href="gestionUsuarios.jsp">Clientes</a>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 sidebar">
            <form class="form-color-rouse">
                <img src="img/icono_de_perfil.png" alt="Usuario Administrador">
                <h2>Usuario Administrador</h2>
                <p>Nombre: administrador</p>
                <p>Correo Electrónico: administrador@utez.edu.mx</p>
                <p>Teléfono: 7771234567</p>
            </form>
        </div>

        <div class="col-md-9">
            <form action="addProducto" class="needs-validation" method="post" enctype="multipart/form-data" novalidate>
                <div class="row">
                    <div class="row mb-2 mt-3 ms-2">
                        <h1 style="font-family: Sansita">Publicar producto</h1>
                    </div>
                    <div class="col-md-4 m-3 ms-4">
                        <div class="mb-3">
                            <label for="validationTooltip01" class="form-label">Nombre del producto:</label>
                            <input type="text" class="form-control" name="nombre_producto" id="validationTooltip01" placeholder="Ingrese el nombre..." required>
                        </div>
                        <div class="mb-3">
                            <label for="validationTooltip01" class="form-label">Descripcion:</label>
                            <textarea type="text" class="form-control" name="descripcion" id="validationTooltip01" rows="3" placeholder="Ingrese la descripción.." required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="validationTooltip01" class="form-label">Color:</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="color1" id="validationTooltip01" placeholder="Ingrese el color..." required>
                                <button type="button" id="nuevoColor" class="btn btn-success">+</button>

                            </div>
                            <div class="mb-3" id="coloresNuevos">

                            </div>

                        </div>

                        <div class="mb-3">

                            <label for="validationTooltip01" class="form-label">Talla:</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="validationTooltip01" placeholder="Ingrese la talla..." required>
                                <button type="button" id="nuevaTalla" class="btn btn-success">+</button>
                            </div>
                            <div class="mb-3" id="tallasNuevas">

                            </div>
                        </div>


                    </div>
                    <div class="col-md-1">

                    </div>

                    <div class="col-md-4 m-3">
                        <div class="mb-3">
                            <label for="validationTooltip01" class="form-label">Unidades disponibles:</label>
                            <input type="number" class="form-control" id="validationTooltip01" placeholder="Ingrese las unidades..." required>
                        </div>
                        <div class="mb-3">
                            <label for="validationCustom04" class="form-label">Categoria:</label>
                            <div class="input-group mb-3">
                            <select class="form-select" id="validationCustom04" required>
                                <option selected disabled value="">Selecciona...</option>
                                <option value="1">Ropa mujer</option>
                                <option value="2">Ropa hombre</option>
                                <option value="3">Accesorios</option>
                            </select>
                                <button class="btn btn-outline-secondary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar</button>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="validationTooltip01" class="form-label">Precio:</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="text" class="form-control" id="validationTooltip01" placeholder="0.00" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="validationTooltip01" class="form-label">Adjuntar imagen del producto:</label>
                            <div class="input-group">
                                <input class="form-control" name="img1" type="file" id="validationTooltip01"  accept="image/*" required>
                                <button type="button" id="nuevaImg"  class="btn btn-success">+</button>
                            </div>
                            <div class="mb-3" id="imgNuevas">

                            </div>
                        </div>



                    </div>
                </div>
                <div class="col-10 text-center">
                    <button class="btn btn-primary" type="submit">Publicar</button>
                </div>
            </form>

            <!-- Button trigger modal -->


            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar categoria</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="agregarCategoria" method="post">
                                <label class="form-label mb-2">Categoria nueva:</label>
                                <input type="text" class="form-control mt-2" name="" id="">


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <input type="submit" class="btn btn-primary" value="Agregar">
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
<script>
    (() => {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
<script>
    //divs
    let nuevoDivColor = document.getElementById("coloresNuevos");
    let nuevoDivTalla = document.getElementById("tallasNuevas");
    let nuevoDivImg = document.getElementById("imgNuevas");

    let i=2;
    let j=2;
    let k=2;

    //botones
    let nuevoColor = document.getElementById("nuevoColor");
    let nuevaTalla = document.getElementById("nuevaTalla");
    let nuevaImg = document.getElementById("nuevaImg");

    nuevoColor.addEventListener("click", () =>{
        let div = document.createElement("div");
        let label = document.createElement("label");
        let input = document.createElement("input");

        //elementos del label
        label.innerText = "Color " + i + ":";
        label.setAttribute("for", "validationTooltip01");
        label.setAttribute("class", "form-label mt-2");
        //elementos del input
        input.setAttribute("type", "text");
        input.setAttribute("name", "color "+i);
        input.setAttribute("class", "form-control mb-2");
        input.setAttribute("id", "validationTooltip01");
        input.setAttribute("placeholder", "Ingresa el color "+i);

        div.appendChild(label);
        div.appendChild(input);
        nuevoDivColor.appendChild(div);

        i++;
        event.preventDefault();
    })

    nuevaTalla.addEventListener("click", () =>{
        let div2 = document.createElement("div");
        let label2 = document.createElement("label");
        let input2 = document.createElement("input");

        //elementos del label
        label2.innerText = "Talla " + j + ":";
        label2.setAttribute("for", "validationTooltip01");
        label2.setAttribute("class", "form-label mt-2");
        //elementos del input
        input2.setAttribute("type", "text");
        input2.setAttribute("name", "talla "+j);
        input2.setAttribute("class", "form-control mb-2");
        input2.setAttribute("id", "validationTooltip01");
        input2.setAttribute("placeholder", "Ingresa la talla "+j);

        div2.appendChild(label2);
        div2.appendChild(input2);
        nuevoDivTalla.appendChild(div2);

        j++;
        event.preventDefault();
    })

    nuevaImg.addEventListener("click", (qualifiedName, value) =>{
        let div3 = document.createElement("div");
        let label3 = document.createElement("label");
        let input3 = document.createElement("input");

        //elementos del label
        label3.innerText = "Imagen " + k + ":";
        label3.setAttribute("for", "validationTooltip01");
        label3.setAttribute("class", "form-label mt-2");
        //elementos del input
        input3.setAttribute("type", "file");
        input3.setAttribute("name", "img "+k);
        input3.setAttribute("class", "form-control mb-2");
        input3.setAttribute("accept", "image/*")
        input3.setAttribute("id", "validationTooltip01");
        input3.setAttribute("required", value)

        div3.appendChild(label3);
        div3.appendChild(input3);
        nuevoDivImg.appendChild(div3);

        j++;
        event.preventDefault();
    })

</script>
<script>
    const myModal = document.getElementById('myModal')
    const myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', () => {
        myInput.focus()
    })
</script>
<script src="js/bootstrap.js"></script>
</body>
</html>