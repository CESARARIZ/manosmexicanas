package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;
import mx.edu.utez.manosmexicanas.model.Categoria;
import mx.edu.utez.manosmexicanas.model.ColorProducto;
import mx.edu.utez.manosmexicanas.model.Producto;
import mx.edu.utez.manosmexicanas.model.Talla;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="AnadirProductosServlet", value = "/addProducto")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class AnadirProductosServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre_producto = req.getParameter("nombre_producto");
        String descripcion = req.getParameter("descripcion");
        int cantidad = Integer.parseInt(req.getParameter("cantidad"));
        String categoria = req.getParameter("categoria");
        double precio = Double.parseDouble(req.getParameter("precio"));
        ProductoDao productoDAO = new ProductoDao();
        Categoria cat = new Categoria();
        try {
            cat=productoDAO.getCategoria(categoria);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Obtener colores y tallas dinámicamente
        List<String> colores = new ArrayList<>();
        List<String> tallas = new ArrayList<>();

        int colorIndex = 1;
        while (req.getParameter("color" + colorIndex) != null) {
            colores.add(req.getParameter("color" + colorIndex));
            colorIndex++;
        }

        int tallaIndex = 1;
        while (req.getParameter("talla" + tallaIndex) != null) {
            tallas.add(req.getParameter("talla" + tallaIndex));
            tallaIndex++;
        }

        // Aquí puedes proceder a guardar el producto, los colores y las tallas en la base de datos

        Producto producto = new Producto();
        producto.setNombre_producto(nombre_producto);
        producto.setDescripcion(descripcion);
        producto.setStockDisponible(cantidad);
        producto.setCategoria(cat);
        producto.setPrecio(precio);

        try {
            // Guardar producto y obtener el ID del producto guardado
            boolean productoId = productoDAO.insert(producto);
            if (productoId) {
                Producto p = new Producto();
                int id_producto = p.getId_producto();

                // Guardar colores y asociarlos al producto
                for (String color : colores) {
                    if (productoDAO.insertColores(color)) {
                        int colorId = productoDAO.getId_color(color); // Método para obtener el ID del color
                        productoDAO.insertProductoColor(id_producto, colorId);
                    }
                }

                // Guardar tallas y asociarlas al producto
                for (String talla : tallas) {
                    Talla t = new Talla();
                    t.setNombre(talla);
                    if (productoDAO.insertTallas(t)) {
                        int tallaId = productoDAO.getId_talla(talla); // Método para obtener el ID de la talla
                        productoDAO.insertTalla(id_producto, tallaId);
                    }
                }

                // Redireccionar o mostrar un mensaje de éxito
                resp.sendRedirect("indexAdmin.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("404.jsp");
        }
    }

    }
}
