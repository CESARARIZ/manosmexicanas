package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;

import java.io.IOException;

@WebServlet(name="DesactivarProductoServlet", value = "/desactivarProducto")
public class DesactivarProductoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_producto = Integer.parseInt(req.getParameter("id_producto"));
        System.out.println("Producto a desactivar : "+id_producto);

        String estado_producto = req.getParameter("estado");
        System.out.println("Estado producto: "+estado_producto);

        int stock = Integer.parseInt(req.getParameter("stock"));



        if("Disponible".equals(estado_producto)){
            estado_producto = "No Disponible";
        }else{
            estado_producto = "Disponible";
        }
        ProductoDao dao = new ProductoDao();
        boolean bloqueado = dao.uptEstado(id_producto, estado_producto, stock);
        if(bloqueado){
            System.out.println("Estado bloqueado");
            resp.sendRedirect("gestionProductos.jsp");
        }else{
            resp.sendRedirect("404.jsp");
        }
    }
}
