package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.CarritoDetalleDao;
import mx.edu.utez.manosmexicanas.model.Carrito;
import mx.edu.utez.manosmexicanas.model.CarritoDetalle;

import java.io.IOException;
import java.util.Date;

@WebServlet(name="CarritoServlet", value = "/carrito")
public class CarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_usuario = Integer.parseInt(req.getParameter("id_usuario"));
        int id_producto = Integer.parseInt(req.getParameter("id_producto"));
        int id_categoria = Integer.parseInt(req.getParameter("id_categoria"));
        int id_talla = Integer.parseInt(req.getParameter("id_talla"));
        int id_color = Integer.parseInt(req.getParameter("id_color"));
        int cantidad = Integer.parseInt(req.getParameter("cantidad"));
        double precio = Double.parseDouble(req.getParameter("precio"));
        double total = Double.parseDouble(req.getParameter("total"));
        String ruta = "indexCliente.jsp";

        CarritoDetalleDao dao = new CarritoDetalleDao();
        Carrito carrito = new Carrito();
        carrito.setId_usuario(id_usuario);
        carrito.setFecha(new Date());

        // Insertar carrito y obtener el ID generado
        int id_carrito = dao.inserCarrito(carrito);

        if (id_carrito != -1) {
            // Insertar detalle del carrito
            CarritoDetalle carritoDetalle = new CarritoDetalle();
            carritoDetalle.setId_carrito(id_carrito);
            carritoDetalle.setId_producto(id_producto);
            carritoDetalle.setId_categoria(id_categoria);
            carritoDetalle.setId_talla(id_talla);
            carritoDetalle.setId_color(id_color);
            carritoDetalle.setCantidad(cantidad);
            carritoDetalle.setTotal(total);
            carritoDetalle.setPrecio(precio);

            boolean insertDetalleCarrito = dao.insertDetalleCarrito(carritoDetalle);
            if (insertDetalleCarrito) {
                resp.sendRedirect(ruta);  // Redirigir a la ruta especificada si la inserción fue exitosa
            }else{
                resp.sendRedirect("404.jsp");
            }
        }else{
            resp.sendRedirect("404.jsp");
        }

    }
}
