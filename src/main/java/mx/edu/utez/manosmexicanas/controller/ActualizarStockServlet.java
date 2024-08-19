package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name="ActualizarStockServlet", value = "/actualizarStock")
public class ActualizarStockServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        System.out.println("ID PRODUCTO A ACTUALIZAR: "+id_producto);
        int nuevoStock = Integer.parseInt(request.getParameter("stock"));
        System.out.println("NUEVO STOCK: "+nuevoStock);

        ProductoDao dao = new ProductoDao();
        try {
            boolean uptStock = dao.actualizarStock(id_producto,nuevoStock);
            if (uptStock){
                response.sendRedirect("indexAdmin.jsp");
            }else{
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }
}
