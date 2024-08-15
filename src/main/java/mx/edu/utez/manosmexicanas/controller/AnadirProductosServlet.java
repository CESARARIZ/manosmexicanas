package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mx.edu.utez.manosmexicanas.dao.CategoriaDao;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;
import mx.edu.utez.manosmexicanas.model.Categoria;
import mx.edu.utez.manosmexicanas.model.ColorProducto;
import mx.edu.utez.manosmexicanas.model.Producto;
import mx.edu.utez.manosmexicanas.model.Talla;

import java.io.IOException;
import java.io.InputStream;
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
        System.out.println("Categoria recuperada: " + categoria);
        double precio = Double.parseDouble(req.getParameter("precio"));

        ProductoDao productoDAO = new ProductoDao();
        CategoriaDao catDao = new CategoriaDao();
        Categoria cat = catDao.getOne(categoria);
        if(cat.getId_categoria()!=0){

            // Crear el producto y asignar los valores
            Producto producto = new Producto();
            producto.setNombre_producto(nombre_producto);
            producto.setDescripcion(descripcion);
            producto.setStockDisponible(cantidad);
            producto.setPrecio(precio);
            producto.setCategoria(cat);

            // Obtener colores y tallas dinámicamente
            List<String> colores = new ArrayList<>();
            List<String> tallas = new ArrayList<>();

            int colorIndex = 1;
            while (req.getParameter("color" + colorIndex) != null) {
                colores.add(req.getParameter("color" + colorIndex));
                System.out.println("Color ingresado en form: " + colorIndex);
                colorIndex++;
            }

            int tallaIndex = 1;
            while (req.getParameter("talla" + tallaIndex) != null) {
                tallas.add(req.getParameter("talla" + tallaIndex));
                System.out.println("Talla ingresado en form: " + tallaIndex);
                tallaIndex++;
            }

            // Guardar producto y obtener el ID del producto guardado
            boolean inserProd = false;
            try {
                inserProd = productoDAO.insert(producto);
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }

            Producto pNuevo = null;
            if (inserProd) {
                try {
                    pNuevo = productoDAO.getId_producto(nombre_producto);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                int id_producto = pNuevo.getId_producto();
                System.out.println("Id producto nuevo: " + id_producto);

                // Guardar colores y sus imágenes asociadas
                for (int i = 0; i < colores.size(); i++) {
                    String color = colores.get(i);
                    System.out.println("Color en primer for: " + color);
                    try {
                        if (productoDAO.insertColores(color)) {
                            int colorId = productoDAO.getId_color(color);

                            // El índice de la imagen debe coincidir con el índice del color
                            String imageName = "img" + (i + 1);
                            Part filePart = req.getPart(imageName);
                            if (filePart != null && filePart.getSize() > 0) {
                                InputStream inputStream = filePart.getInputStream();

                                // Llama al método DAO para guardar la imagen
                                try {
                                    ProductoDao.insertProductoColor(id_producto, colorId, inputStream);
                                    System.out.println("Imagen asociada guardada para el color: " + color);
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            System.out.println("Color ya guardado en base: " + colorId);
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }


                // Guardar tallas y asociarlas al producto
                for (String talla : tallas) {
                    try {
                        if (productoDAO.insertTallas(talla)) {
                            int tallaId = productoDAO.getId_talla(talla);
                            productoDAO.insertTalla(id_producto, tallaId);
                            System.out.println("Talla ya guardada: " + tallaId);
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }

                resp.sendRedirect("indexAdmin.jsp");
            }
        }else{
            resp.sendRedirect("publicarProducto.jsp");
        }


    }

}
