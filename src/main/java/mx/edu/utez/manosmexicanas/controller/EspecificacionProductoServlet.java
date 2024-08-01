package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;
import mx.edu.utez.manosmexicanas.model.Producto;

import java.io.IOException;


@WebServlet(name="EspecificacionProductoServlet", value = "/especificarProducto")
public class EspecificacionProductoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductoDao dao = new ProductoDao();
        dao.getOne(id);
        Producto p = dao.getOne(id);

        HttpSession session = request.getSession();
        session.setAttribute("producto", p);
        response.sendRedirect("especificacion.jsp");

    }
}