package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.*;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComentarioDao {

    public boolean insertarCalificacion(Comentario comentario) {
        boolean flag = false;
        String sql = "INSERT INTO calificaciones_comentarios (id_usuario, id_producto, calificacion, comentario) VALUES (?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, comentario.getId_usuario());
                ps.setInt(2, comentario.getId_producto());
                ps.setInt(3, comentario.getCalificacion());
                ps.setString(4, comentario.getComentario());
                if (ps.executeUpdate() > 0) {
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Producto getOne(String nombre) {
        Producto p = new Producto();
        String query = "SELECT p.id_producto, p.nombre, c.id_categoria, c.nombre_categoria, p.descripcion, p.precio, p.stock, p.estatus " +
                "FROM productos p " +
                "JOIN categorias c ON p.id_categoria = c.id_categoria " +
                "WHERE p.nombre = ?;";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, nombre);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p.setId_producto(rs.getInt("id_producto"));
                    p.setNombre_producto(rs.getString("nombre"));
                    p.setDescripcion(rs.getString("descripcion"));
                    p.setPrecio(rs.getDouble("precio"));
                    p.setStockDisponible(rs.getInt("stock"));
                    p.setEstado(rs.getString("estatus"));

                    // Crear y configurar el objeto Categoria
                    Categoria categoria = new Categoria();
                    categoria.setId_categoria(rs.getInt("id_categoria")); // Recupera el ID de la categoría
                    categoria.setNombre_categoria(rs.getString("nombre_categoria")); // Recupera el nombre de la categoría

                    // Asignar la categoria al producto
                    p.setCategoria(categoria);


                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public boolean uptComentario(String comentario, int id_pedido_producto){
        boolean flag = false;
        String sql = "update pedido_producto set comentario = ? where id_pedido_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, comentario);
            ps.setInt(2, id_pedido_producto);
            if (ps.executeUpdate()>0){
                flag = true;
            }
            ps.close();
            con.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public List<Comentario> getComentarios(int id_producto){
        List<Comentario> comentarios = new ArrayList<Comentario>();
        String sql =    "SELECT c.id_calificacion, us.nombre_usuario AS usuario, c.calificacion, c.comentario " +
                        "FROM calificaciones_comentarios c " +
                        "JOIN usuario us ON c.id_usuario = us.id_usuario " +
                        "WHERE c.id_producto = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, id_producto);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Comentario comentario = new Comentario();
                    comentario.setId_calificacion(rs.getInt("id_calificacion"));
                    comentario.setNombre_usuario(rs.getString("usuario"));
                    comentario.setCalificacion(rs.getInt("calificacion"));
                    comentario.setComentario(rs.getString("comentario"));
                    comentarios.add(comentario);
                }
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return comentarios;

    }
}
