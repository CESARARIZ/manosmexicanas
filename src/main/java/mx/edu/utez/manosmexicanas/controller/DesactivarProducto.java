package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;
import mx.edu.utez.manosmexicanas.dao.UsuarioDao;

import java.io.IOException;

@WebServlet(name="DesactivarProducto", value = "/desactivarProducto")
public class DesactivarProducto extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_producto = Integer.parseInt(req.getParameter("id_producto"));
        String estado_producto = req.getParameter("estado");

        if("Disponible".equals(estado_producto)){
            estado_producto = "No disponible";
        }else{
            estado_producto = "Disponible";
        }
        ProductoDao dao = new ProductoDao();
        boolean bloqueado = dao.uptEstado(id_producto, estado_producto);
        if(bloqueado){
            resp.sendRedirect("gestionProductos.jsp");
        }else{
            resp.sendRedirect("404.jsp");
        }
    }
}
