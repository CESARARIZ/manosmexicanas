<%@ page import="mx.edu.utez.manosmexicanas.dao.UsuarioDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.Categoria" %>
<%@ page import="mx.edu.utez.manosmexicanas.dao.ProductoDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manos Mexicanas</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <style>
        .sidebar{

            padding: 20px 0;
            position: relative; /* Fijar la barra de filtros */
            top: 20px; /* Ajustar la posición superior según sea necesario */
        }
        header {
            width: 100%;
            background-color: #061029;
            border-bottom: 1px solid #dee2e6;
            padding: 10px 0;
            max-height: 110px;
        }
        body {
            background-color: #F2F2F2;
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
        /* Nuevas clases */
        .navbar {
            padding: 5px 0;
        }

        #nave .dropdown-menu {
            background-color: #FFFFFF; /* Color oscuro */
        }
        #nave .dropdown-menu a {
            color: #061029; /* Color de los enlaces del dropdown */
        }

        #nave, #log{
            text-align: center;
        }
        .navbar-nav {
            align-items: center; /* Centramos verticalmente los enlaces */
        }
        img {
            max-width: 190px;
            border-radius: 10px;
            margin-bottom: 20px; /* Espacio debajo de la imagen */
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
        <div class="row align-items-center" style="vertical-align: middle">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-md-2" id="log"><a href="index.jsp">
                <img src="img/logoMM.png" alt="" width="100px" height="80px"></a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDAD-->
            <div class="col-md-6">
                <form class="mb-2 mb-lg-0">

                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-md-4 d-flex justify-content-center">
                <nav id="nave" class="navbar navbar-expand-md navbar-dark">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link me-3 py-1 text-decoration-none" style="color: #0d6efd" href="indexAdmin.jsp">Catalogo</a>
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle me-3 py-1 text-decoration-none" style="color: #0d6efd" href="perfil.jsp" id="perfilDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Gestiones
                            </a>
                            <div class="dropdown-menu" aria-labelledby="perfilDropdown">
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="gestionUsuarios.jsp">Clientes</a>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="gestionPedidos.jsp">Pedidos</a>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="gestionProductos.jsp">Productos</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item link-body-emphasis text-decoration-none" style="color: #000000" href="cerrarSesion">Cerrar sesión</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>

<div class="container-fluid">
    <div class="row mt-2">
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
                                <input type="text" class="form-control" name="talla1" id="validationTooltip01" placeholder="Ingrese la talla..." required>
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
                            <input type="number" class="form-control" id="validationTooltip01" name="cantidad" placeholder="Ingrese las unidades..." required>
                        </div>
                        <div class="mb-3">
                            <label for="validationCustom04" class="form-label">Categoría:</label>
                            <div class="input-group mb-3">
                                <%
                                    ProductoDao dao = new ProductoDao();
                                    List<Categoria> categorias = null;
                                    try {
                                        categorias = dao.getCategorias();
                                        System.out.println("Número de categorías: " + (categorias != null ? categorias.size() : 0));
                                        for (Categoria cat : categorias) {
                                            System.out.println("Categoría: " + cat.getNombre_categoria());
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }

                                    if (categorias != null && !categorias.isEmpty()) {
                                %>
                                <select class="form-select" id="validationCustom04" name="categoria" required>
                                    <option selected disabled value="">Selecciona...</option>
                                    <%
                                        for (Categoria categoria : categorias) {
                                    %>
                                    <option value="<%= categoria.getNombre_categoria() %>"><%= categoria.getNombre_categoria() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <%
                                } else {
                                %>
                                <p>Sin categorías</p>
                                <%
                                    }
                                %>
                                <button class="btn btn-outline-secondary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar</button>
                            </div>
                        </div>



                        <div class="mb-3">
                            <label for="validationTooltip01" class="form-label">Precio:</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="text" class="form-control" name="precio" id="validationTooltip01" placeholder="0.00" required>
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


            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar categoria</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="agregarCategoria" method="post">
                        <div class="modal-body">

                                <label class="form-label mb-2">Categoria nueva:</label>
                                <input type="text" class="form-control mt-2" name="" id="">


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <input type="submit" class="btn btn-primary" value="Agregar">

                        </div>
                        </form>
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
        input.setAttribute("name", "color"+i);
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
        input2.setAttribute("name", "talla"+j);
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>