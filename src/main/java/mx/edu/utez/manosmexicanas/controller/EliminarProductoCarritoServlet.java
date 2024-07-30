package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.CarritoDetalleDao;

import java.io.IOException;

@WebServlet(name="EliminarProductoCarritoServlet", value="/eliminarProductoCarrito")
public class EliminarProductoCarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_carrito_producto = Integer.parseInt(req.getParameter("id_carrito_producto"));

        CarritoDetalleDao dao = new CarritoDetalleDao();

        boolean eliminado = dao.deleteProducto(id_carrito_producto);
        if (eliminado) {
            resp.sendRedirect("verCarrito");
        }
    }
}
