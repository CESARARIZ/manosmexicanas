package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;
import mx.edu.utez.manosmexicanas.model.Producto;
import mx.edu.utez.manosmexicanas.model.Talla;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="ViewProductoServlet", value = "/mostrarProducto")
public class ViewProductoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ProductoDao dao = new ProductoDao();
        dao.getOne(id);
        Producto p = dao.getOne(id);

        HttpSession session = request.getSession();
        session.setAttribute("producto", p);
        request.getRequestDispatcher("mostrarProducto.jsp").forward(request, response);

    }
}
