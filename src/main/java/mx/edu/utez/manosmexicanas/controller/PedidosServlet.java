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

        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        PedidoDao pedidoDao = new PedidoDao();
        List<PedidoDetalle> detalles = pedidoDao.getPedidoDetalles(id_usuario);
        System.out.println("Número de detalles recuperados: " + (detalles != null ? detalles.size() : 0));
        if(detalles == null || detalles.isEmpty()){
            response.sendRedirect("ingresar.jsp");
        }else {
            request.setAttribute("pedidos", detalles);
            request.getRequestDispatcher("pedido.jsp").forward(request, response);
        }
    }
}
