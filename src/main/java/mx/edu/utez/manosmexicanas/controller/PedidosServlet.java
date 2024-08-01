package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.manosmexicanas.dao.CarritoDetalleDao;
import mx.edu.utez.manosmexicanas.dao.PedidoDao;
import mx.edu.utez.manosmexicanas.model.PedidoDetalle;
import mx.edu.utez.manosmexicanas.model.Usuario;

import java.io.IOException;
import java.util.List;

@WebServlet(name="PedidosServlet", value = "/pedido")
public class PedidosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null) {
            int id_usuario = usuario.getId();
            PedidoDao pedidoDao = new PedidoDao();
            List<PedidoDetalle> det = pedidoDao.getPedidoDetalles(id_usuario);

            request.setAttribute("det", det);
            request.setAttribute("usuario", usuario);


        }else {
            response.sendRedirect("ingresar.jsp"); // Redirigir al login si el usuario no está autenticado
        }
    }
}
