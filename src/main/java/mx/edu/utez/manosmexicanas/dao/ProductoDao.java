package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.ColorProducto;
import mx.edu.utez.manosmexicanas.model.Imagen;
import mx.edu.utez.manosmexicanas.model.Producto;
import mx.edu.utez.manosmexicanas.model.Talla;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao {

    public ArrayList<Producto> obtenerProductos() {
        ArrayList<Producto> productos = new ArrayList<Producto>();
        String query = "select * from producto";

        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Producto p = new Producto();
                p.setId_producto(rs.getInt("id_producto"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripción"));
                p.setPrecio(rs.getFloat("precio"));
                p.setStock(rs.getInt("stock"));
                p.setId_categoria(rs.getInt("id_categoria"));
                productos.add(p);

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return productos;
    }

    private List<Talla> obtenerTallasProducto(int id_producto) throws SQLException {
        List<Talla> tallas = new ArrayList<Talla>();
        String sql = "SELECT t.* FROM talla t INNER JOIN prod_talla_color ptc ON t.id_talla = ptc.id_talla WHERE ptc.id_producto = ?";

        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id_talla = rs.getInt("id_talla");
                String nombre = rs.getString("nombre");
                tallas.add(new Talla(id_talla, nombre));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return tallas;
    }

    private List<ColorProducto> obtenerColoresProducto(int id_producto) throws SQLException {
        List<ColorProducto> colores = new ArrayList<ColorProducto>();
        String sql = "SELECT c.* FROM color c INNER JOIN prod_talla_color ptc ON c.id_color = ptc.id_color WHERE ptc.id_producto = ?";

        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id_color = rs.getInt("id_color");
                String nombre = rs.getString("nombre");
                colores.add(new ColorProducto(id_color, nombre));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return colores;
    }

    private List<String> obtenerImagenesProducto(int id_producto) throws SQLException {
        List<String> imagenes = new ArrayList<>();
        String sql = "SELECT url FROM img WHERE id_producto = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String url = rs.getString("url");
                imagenes.add(url);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return imagenes;

    }


}
