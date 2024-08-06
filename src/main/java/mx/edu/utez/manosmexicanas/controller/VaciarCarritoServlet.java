package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.CarritoDetalleDao;

import java.io.IOException;

@WebServlet(name="VaciarCarritoServlet", value="/vaciarCarrito")
public class VaciarCarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_usuario=Integer.parseInt(req.getParameter("id_usuario"));

        CarritoDetalleDao dao=new CarritoDetalleDao();

        boolean eliminado = dao.deleteProductos(id_usuario);
        if (!eliminado) {
            System.out.println("Error al eliminar productos del carrito.");
            resp.sendRedirect("carrito.jsp");
        }else{
            resp.sendRedirect("carrito.jsp");
        }

    }
}
