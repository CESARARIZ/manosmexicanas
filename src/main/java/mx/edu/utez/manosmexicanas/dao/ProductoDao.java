package mx.edu.utez.manosmexicanas.dao;



import mx.edu.utez.manosmexicanas.model.*;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductoDao {

    public List<Producto> obtenerTodosLosProductos() throws SQLException {
        List<Producto> productos = new ArrayList<>();
        String query =  "SELECT p.id_producto, p.nombre, c.id_categoria, c.nombre_categoria, p.descripcion, p.precio, p.stock " +
                "FROM Productos p " +
                "JOIN Categorias c ON p.id_categoria = c.id_categoria;";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet resultSet = ps.executeQuery()) {

            while (resultSet.next()) {
                Producto producto = new Producto();
                producto.setId_producto(resultSet.getInt("id_producto"));
                producto.setNombre_producto(resultSet.getString("nombre"));
                producto.setDescripcion(resultSet.getString("descripcion"));
                producto.setPrecio(resultSet.getDouble("precio"));
                producto.setStockDisponible(resultSet.getInt("stock"));

                // Crear y configurar el objeto Categoria
                Categoria categoria = new Categoria();
                categoria.setId_categoria(resultSet.getInt("id_categoria")); // Recupera el ID de la categoría
                categoria.setNombre_categoria(resultSet.getString("nombre_categoria")); // Recupera el nombre de la categoría

                // Asignar la categoria al producto
                producto.setCategoria(categoria);

                // Añadir el producto a la lista
                productos.add(producto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }


    public Producto getOne(int id_producto) {
        Producto p = new Producto();
        String query = "SELECT p.id_producto, p.nombre, c.id_categoria, c.nombre_categoria, p.descripcion, p.precio, p.stock " +
                "FROM Productos p " +
                "JOIN Categorias c ON p.id_categoria = c.id_categoria " +
                "WHERE p.id_producto = ?;";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id_producto);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p.setId_producto(rs.getInt("id_producto"));
                    p.setNombre_producto(rs.getString("nombre"));
                    p.setDescripcion(rs.getString("descripcion"));
                    p.setPrecio(rs.getDouble("precio"));
                    p.setStockDisponible(rs.getInt("stock"));

                    // Crear y configurar el objeto Categoria
                    Categoria categoria = new Categoria();
                    categoria.setId_categoria(rs.getInt("id_categoria")); // Recupera el ID de la categoría
                    categoria.setNombre_categoria(rs.getString("nombre_categoria")); // Recupera el nombre de la categoría

                    // Asignar la categoria al producto
                    p.setCategoria(categoria);

                    // Obtener tallas y colores asociados
                    List<Talla> tallas = TallasPorProducto(id_producto);
                    p.setTallas(tallas);

                    List<ColorProducto> colores = ColoressPorProducto(id_producto);
                    p.setColores(colores);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }


    private List<Talla> TallasPorProducto(int id_producto) throws SQLException {
        List<Talla> tallas = new ArrayList<>();
        String query = "SELECT t.id_talla, t.talla " +
                "FROM Tallas t " +
                "JOIN Producto_Tallas pt ON t.id_talla = pt.id_talla " +
                "WHERE pt.id_producto = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id_producto);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Talla t = new Talla();
                    t.setId_talla(rs.getInt("id_talla"));
                    t.setNombre(rs.getString("talla"));
                    tallas.add(t);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tallas;
    }

    private List<ColorProducto> ColoressPorProducto(int id_producto) throws SQLException {
        List<ColorProducto> colores = new ArrayList<>();
        String query = "SELECT c.id_color, c.color\n" +
                "FROM Colores c\n" +
                "JOIN Producto_Colores pc ON c.id_color = pc.id_color\n" +
                "WHERE pc.id_producto = ?;";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id_producto);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColorProducto c = new ColorProducto();
                    c.setId_color(rs.getInt("id_color"));
                    c.setNombre(rs.getString("color"));
                    colores.add(c);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return colores;
    }


}