package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.manosmexicanas.dao.CarritoDetalleDao;
import mx.edu.utez.manosmexicanas.model.CarritoDetalle;
import mx.edu.utez.manosmexicanas.model.DetalleCarritoDTO;
import mx.edu.utez.manosmexicanas.model.Usuario;

import java.io.IOException;
import java.util.List;

@WebServlet(name="ProductosCarritoServlet", value = "/verCarrito")
public class ProductosCarritoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null) {
            int id_usuario = usuario.getId();
            CarritoDetalleDao dao = new CarritoDetalleDao();
            System.out.println("USUARIO EN SERVLET: "+id_usuario);
            List<DetalleCarritoDTO> cd = dao.getDetallesCarrito(id_usuario);
            List<CarritoDetalle> car = dao.getIdsDetalleCarrito(id_usuario);

            req.setAttribute("carritoDetalle", car);
            req.setAttribute("carrito", cd);
            req.setAttribute("usuario", usuario);
            req.getRequestDispatcher("carrito.jsp").forward(req, res);

        } else {
            res.sendRedirect("ingresar.jsp"); // Redirigir al login si el usuario no está autenticado
        }
    }
}