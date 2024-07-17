package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;
import mx.edu.utez.manosmexicanas.model.Producto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ProductosServlet extends HttpServlet {
    ProductoDao dao = new ProductoDao();
    List<Producto> productos = new ArrayList<Producto>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        productos=dao.obtenerProductos();
        switch(nombre){
            case "products":
                break;
            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);

        }
    }
}
