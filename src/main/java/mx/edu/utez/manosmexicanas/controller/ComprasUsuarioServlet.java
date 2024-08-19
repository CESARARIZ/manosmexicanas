package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.PedidoDao;
import mx.edu.utez.manosmexicanas.model.PedidoDetalle;

import java.io.IOException;
import java.util.List;

@WebServlet(name="ComprasUsuarioServlet", value = "/compras")
public class ComprasUsuarioServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));

        PedidoDao dao = new PedidoDao();

        List<PedidoDetalle> detalles = dao.getCompras(id_usuario);
        System.out.println("Número de detalles recuperados: " + (detalles != null ? detalles.size() : 0));
        if(detalles == null || detalles.isEmpty()){
            response.sendRedirect("pedido.jsp");
        }else {
            request.setAttribute("pedidos", detalles);
            request.getRequestDispatcher("compras.jsp").forward(request, response);
        }

    }
}
