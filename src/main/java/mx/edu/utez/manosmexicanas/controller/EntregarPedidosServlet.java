package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.PedidoDao;
import mx.edu.utez.manosmexicanas.model.PedidoProducto;

import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "EntregarPedidosServlet", value = "/entregarPedido")
public class EntregarPedidosServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_pedido_detalle = Integer.parseInt(request.getParameter("id_pedido_detalle"));
        String estado = request.getParameter("estado");

        if("Pendiente".equals(estado)){
            estado="Entregado";
        }

        PedidoDao dao = new PedidoDao();

        boolean producto = dao.updateEstado(id_pedido_detalle,estado);
        if(producto){
            response.sendRedirect("gestionPedidos.jsp");
        }else{
            response.sendRedirect("404.jsp");
        }

    }

}
