package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="AnadirProductosServlet", value = "/addProducto")
public class AnadirProductosServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre_producto = req.getParameter("nombre_producto");
        String descripcion = req.getParameter("descripcion");

        ArrayList<String> colores = new ArrayList<>();
        ArrayList<String> tallas = new ArrayList<>();

        int cantidad = Integer.parseInt(req.getParameter("cantidad"));
        String categoria = req.getParameter("categoria");
        double precio = Double.parseDouble(req.getParameter("precio"));


        ProductoDao daoProducto = new ProductoDao();



    }
}
