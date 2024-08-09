<%@ page import="mx.edu.utez.manosmexicanas.model.Usuario" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.CarritoDetalle" %>
<%@ page import="mx.edu.utez.manosmexicanas.dao.CarritoDetalleDao" %>
<%@ page import="mx.edu.utez.manosmexicanas.model.DetalleCarritoDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession(false);
    Usuario usuario = null;
    int id_usuario=0;
    List<DetalleCarritoDTO> lista = null;
    List<CarritoDetalle> lista2 = null;
    if (session1 != null) {
        usuario = (Usuario) session1.getAttribute("usuario");
        lista = (List<DetalleCarritoDTO>) request.getAttribute("carrito");
        lista2 = (List<CarritoDetalle>) request.getAttribute("carritoDetalle");
        if (usuario != null) {
            id_usuario = usuario.getId();
            System.out.println("ID del usuario recuperado: " + id_usuario);
        } else {
            // Redirigir a la página de inicio de sesión si el usuario no está en la sesión
            response.sendRedirect("ingresar.jsp");
        }
    }else{
        response.sendRedirect("ingresar.jsp");
    }


%>

<html>
<head>
    <title>Carrito</title>
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <style>
        #nave, #log{
            text-align: center;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #F2F2F2;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #061029;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        header .logo img {
            width: 50px;
        }

        header nav a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
        }



        .carrito, .resumen {
            background-color: #ffe4e1;
            padding: 20px;
            border-radius: 5px;
            width: 45%;
        }

        .carrito h2, .resumen h2 {
            margin-top: 0;
        }

        .producto {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .producto img {
            width: 40px;
            height: 40px;
        }

        .producto .detalles {
            flex: 1;
        }

        .producto .cantidad {
            display: flex;
            align-items: center;
            margin-right: 10px;
        }

        .info-producto button{
            border: none;
            background: none;
            background-color: #FE7DCC;
            color: #fff;
            padding: 10px 15px; /* Espacio interno del botón */
            cursor: pointer;
            border-radius: 10px;
            margin: 2px;
            font-size: 15px;
        }

        .producto .cantidad input {
            width: 40px;
            text-align: center;
            margin: 0 5px;
        }

        .producto .precio {
            width: 100px;
        }

        .producto .btn-eliminar {
            color: white;
            border: none;
            cursor: pointer;
        }

        .btn-agregar{
            background-color: #f06292;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            display: block;
            border-radius: 5px;
            margin: 10px auto;
            width: 60%;
            border-bottom-color: #0a0a0a;
            text-align: center;
        }

        .btn-realizar, .btn-vaciar {
            background-color: #f06292;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            display: block;
            border-radius: 5px;
            margin: 10px auto;
            width: 30%;
            border-bottom-color: #0a0a0a;
            text-align: center;
            align-items: center;
        }

        hr {
            border: none;
            height: 2px;
            background-color: #333;
        }
        .cart-item-total {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .cart-actions {
            display: flex;
            align-items: center;
        }
        .cart-actions button,
        .cart-actions input {
            width: 40px;
            height: 40px;
            text-align: center;
            line-height: 38px; /* Ajustar para centrar el texto verticalmente */
            border: 1px solid black;
            background-color: #f8e8f0;
            font-size: 20px;
        }
        .cart-actions input {
            max-width: 40px;
        }
        .btn-increase,
        .btn-decrease {
            border: none;
            background-color: #f8e8f0;
        }
        .btn-increase, .btn-decrease {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            padding: 5px 10px;
            cursor: pointer;
        }
        .btn-increase:hover, .btn-decrease:hover {
            background-color: #e9ecef;
        }
        .quantity {
            max-width: 60px;
        }
        .rounded-left {
            border-top-left-radius: 0.25rem;
            border-bottom-left-radius: 0.25rem;
        }
        .rounded-right {
            border-top-right-radius: 0.25rem;
            border-bottom-right-radius: 0.25rem;
        }

        .carrito-total {
            height: 350px;
            position: sticky;
            top: 0;
        }
        .col-md-8 {
             /* Ajusta la altura según sea necesario */
            overflow-y: auto;
        }

    </style>
</head>
<body>

<header class="">
    <div class="container-fluid">
        <div class="row align-items-center">
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA EL LOGO-->
            <div class="col-lg-2" id="log"><a href="indexCliente.jsp">
                <img src="img/logoMM.png" alt="" width="100px" height="80px"></a>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LA BARRA DE BUSQUEDAD-->
            <div class="col-lg-6">
                <form class="mb-2 mb-lg-0">

                </form>
            </div>
            <!--SE CREAN COLUMNAS CON TAMAÑOS PARA LOS ENLACES-->
            <div class="col-lg-4">
                <nav id="nave">
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" style="color: #0d6efd" href="indexCliente.jsp">Catalogo</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" style="color: #0d6efd"  href="pedido?id_usuario=<%=id_usuario%>">Pedidos</a>
                    <a class="me-5 py-2 link-body-emphasis text-decoration-none" style="color: #0d6efd" href="perfil.jsp">Perfil</a>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="container mt-4 mb-4">
    <div class="row">
        <div class="col-md-8" style="background-color: #FFFFFF">
            <table class="table table-bordered">
                <thead class="thead-light">
                <tr>
                    <th colspan="8" class="text-start bg-light mb-2 align-middle">
                        <br>
                        <h2>Carrito de compras</h2>
                        <br>
                    </th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (lista != null && !lista.isEmpty()) {
                        int contador = 1;
                        for (DetalleCarritoDTO dc : lista) {
                            if (lista2 != null && !lista2.isEmpty()) {
                                int totalProductos = 0;
                                double totalPagar = 0.0;
                                for (CarritoDetalle dc2 : lista2) {
                                    int id_producto = dc2.getId_producto();
                                    int id_color = dc2.getId_color();

                %>
                <tr>
                    <td class="text-center align-middle"><%= contador %></td>
                    <td>
                        <img src="mostrarImg?nombre_producto=<%=id_producto%>?nombre_color=<%=id_color%>" alt="">
                    </td>
                    <td class="align-middle">
                        <h3><%= dc.getNombre_producto() %></h3>
                        <p>
                            <strong>Categoría:</strong> <%= dc.getNombre_categoria() %><br>
                            <strong>Talla:</strong> <%= dc.getNombre_talla() %><br>
                            <strong>Color:</strong> <%= dc.getNombre_color() %><br>
                            <strong>Precio:</strong> $<%= dc.getPrecio_uni() %>
                        </p>
                    </td>
                    <td class="text-center align-middle">
                        <div class="input-group cart-actions d-flex justify-content-center align-items-center">
                            <input type="button" class="btn btn-increase rounded-left text-center" value="+">
                            <input type="text" class="form-control text-center quantity" value="<%= dc.getCantidad() %>" readonly>
                            <input type="button" class="btn btn-decrease rounded-right text-center" value="-">
                        </div>
                    </td>
                    <td class="text-center align-middle">$<%= dc.getTotal() %></td>
                    <td class="text-center align-middle">
                        <form action="eliminarProductoCarrito" method="post">
                            <input type="hidden" name="id_carrito_producto" value="<%= dc.getId_detalle_carrito() %>">
                            <button type="submit" class="btn btn-danger" style="border: none;">
                                <img src="img/bote.png" alt="Eliminar" style="width: 25px; height: 25px;">
                            </button>
                        </form>
                    </td>
                </tr>
                <%          }
                        }
                        contador++;
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" class="text-center align-middle">No hay productos en el carrito.</td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <% if (lista != null && !lista.isEmpty()) { %>
        <div class="col-md-3 ms-5 carrito-total" style="background-color: #FFFFFF">
            <table class="table table-bordered">
                <thead class="thead-light">
                <tr>
                    <th colspan="8" class="text-start bg-light mb-2 align-middle">
                        <br>
                        <h3>Resumen de compra</h3>
                        <br>
                    </th>
                </tr>
                </thead>
            </table>
            <form action="addPedido" method="post">

                <%
                    if (lista2 != null && !lista2.isEmpty()) {
                    int totalProductos = 0;
                    double totalPagar = 0.0;
                    for (CarritoDetalle dc : lista2) {
                        totalProductos += dc.getCantidad();
                        totalPagar += dc.getTotal();
                %>
                <input type="hidden" name="id_producto" value="<%= dc.getId_producto()%>">
                <input type="hidden" name="id_categoria" value="<%= dc.getId_categoria() %>">
                <input type="hidden" name="id_talla" value="<%= dc.getId_talla() %>">
                <input type="hidden" name="id_color" value="<%= dc.getId_color() %>">
                <input type="hidden" name="cantidad" value="<%= dc.getCantidad() %>">
                <input type="hidden" name="precio_unitario" value="<%= dc.getPrecio() %>">
                <input type="hidden" name="total" value="<%= dc.getTotal() %>">
                    <% } %>
                <h6>Total de productos: <%= totalProductos %></h6>
                <br>
                <h4>Total a pagar: $<%= totalPagar %></h4>
                <br>
                <div class="text-center">
                    <input type="hidden" name="id_usuario" value="<%=id_usuario%>">
                    <button type="submit" class="btn btn-outline-success">Confirmar pedido</button>

                </div>
                <% } %>
            </form>
           <div class="text-center">
               <form action="vaciarCarrito" method="post">
                   <input type="hidden" name="id_usuario" value="<%=id_usuario%>">
                   <button type="submit" class="btn btn-outline-danger" >Vaciar carrito</button>
               </form>

           </div>
        </div>
        <% } %>
    </div>
</div>








<script src="js/bootstrap.js"></script>
<script>
    document.querySelectorAll('.btn-increase').forEach(button => {
        button.addEventListener('click', function() {
            let input = this.parentNode.querySelector('.quantity');
            let currentValue = parseInt(input.value);
            input.value = currentValue + 1;
        });
    });

    document.querySelectorAll('.btn-decrease').forEach(button => {
        button.addEventListener('click', function() {
            let input = this.parentNode.querySelector('.quantity');
            let currentValue = parseInt(input.value);
            if (currentValue > 1) {
                input.value = currentValue - 1;
            }
        });
    });

    function updateQuantity(productId, change) {
        const quantityElement = document.getElementById('quantity-' + productId);
        let quantity = parseInt(quantityElement.value);

        if (quantity + change >= 1) {
            quantity += change;
            quantityElement.value = quantity;

            // Llama a una función para actualizar el total en el backend y obtener el nuevo total
            updateTotal(productId, quantity);
        }
    }

</script>
</body>
</html>

