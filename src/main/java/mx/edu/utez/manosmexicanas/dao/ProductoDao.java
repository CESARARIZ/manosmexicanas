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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao {


    public List<Producto> obtenerTodosLosProductos() throws SQLException {
        List<Producto> productos = new ArrayList<>();
        String query = "SELECT * FROM productos";


        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Producto producto = new Producto();
                producto.setId_producto(resultSet.getInt("id_producto"));
                producto.setNombre_producto(resultSet.getString("nombre"));
                producto.setDescripcion(resultSet.getString("descripcion"));
                producto.setId_categoria(resultSet.getInt("id_categoria"));
                producto.setPrecio(resultSet.getDouble("precio"));
                producto.setStockDisponible(resultSet.getInt("stock_disponible"));

                producto.setVariantes(obtenerVariantesDelProducto(producto.getId_producto()));

                productos.add(producto);
            }

            System.out.println("Productos obtenidos: " + productos.size()); // Mensaje de depuración


        }catch(SQLException e){
            e.printStackTrace();
        }
        return productos;
    }

    private List<VarianteProducto> obtenerVariantesDelProducto(int id_producto) throws SQLException {
        List<VarianteProducto> variantes = new ArrayList<>();
        String query = "SELECT vp.id_variante, vp.id_producto, vp.id_talla, vp.id_color, vp.stock, " +
                "t.nombre_talla, c.nombre_color " +
                "FROM variantes_producto vp " +
                "JOIN tallas t ON vp.id_talla = t.id_talla " +
                "JOIN colores c ON vp.id_color = c.id_color " +
                "WHERE vp.id_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_producto);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {
                VarianteProducto variante = new VarianteProducto();
                variante.setId_variante(resultSet.getInt("id_variante"));
                variante.setId_producto(resultSet.getInt("id_producto"));
                variante.setId_talla(resultSet.getInt("id_talla"));
                variante.setId_color(resultSet.getInt("id_color"));
                variante.setStock(resultSet.getInt("stock"));
                variante.setNombreTalla(resultSet.getString("nombre_talla"));
                variante.setNombreColor(resultSet.getString("nombre_color"));

                variantes.add(variante);
            }

            System.out.println("Variantes obtenidas para el producto " + id_producto + ": " + variantes.size()); // Mensaje de depuración

        }catch (SQLException e){
            e.printStackTrace();
        }
        return variantes;
    }
}