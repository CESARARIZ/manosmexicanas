package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.Carrito;
import mx.edu.utez.manosmexicanas.model.CarritoDetalle;
import mx.edu.utez.manosmexicanas.model.DetalleCarritoDTO;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class CarritoDetalleDao {

    public int inserCarrito(Carrito carrito) {
        int idCarrito = -1;
        String query = "INSERT INTO carrito_compra(id_usuario, fecha_creacion) VALUES (?,?)";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, carrito.getId_usuario());
            ps.setTimestamp(2, new java.sql.Timestamp(carrito.getFecha().getTime()));
            if (ps.executeUpdate() > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    idCarrito = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idCarrito;
    }

    public boolean insertDetalleCarrito(CarritoDetalle cd) {
        boolean flag = false;
        String query = "INSERT INTO carrito_producto (id_carrito, id_producto, id_categoria,id_talla, id_color, cantidad, total) VALUES (?, ?,?, ?, ?, ?, ?)";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cd.getId_carrito());
            ps.setInt(2, cd.getId_producto());
            ps.setInt(3, cd.getId_categoria());
            ps.setInt(4, cd.getId_talla());
            ps.setInt(5, cd.getId_color());
            ps.setInt(6, cd.getCantidad());
            ps.setDouble(7, cd.getTotal());
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


        public List<DetalleCarritoDTO> getDetallesCarrito(int id_usuario) {
            List<DetalleCarritoDTO> detalles = new ArrayList<>();
            String sql = "SELECT cp.id_carrito_producto, p.nombre AS nombre_producto, c.nombre_categoria AS nombre_categoria, " +
                    "t.talla AS nombre_talla, co.color AS nombre_color, cp.cantidad, cp.total " +
                    "FROM carrito_producto cp " +
                    "JOIN carrito_compra cc ON cp.id_carrito = cc.id_carrito " +
                    "JOIN productos p ON cp.id_producto = p.id_producto " +
                    "JOIN categorias c ON cp.id_categoria = c.id_categoria " +
                    "JOIN tallas t ON cp.id_talla = t.id_talla " +
                    "JOIN colores co ON cp.id_color = co.id_color " +
                    "WHERE cc.id_usuario = ?";
            try {
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id_usuario);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    DetalleCarritoDTO detalle = new DetalleCarritoDTO();
                    detalle.setId_detalle_carrito(rs.getInt("id_carrito_producto"));
                    detalle.setNombre_producto(rs.getString("nombre_producto"));
                    detalle.setNombre_categoria(rs.getString("nombre_categoria"));
                    detalle.setNombre_talla(rs.getString("nombre_talla"));
                    detalle.setNombre_color(rs.getString("nombre_color"));
                    detalle.setCantidad(rs.getInt("cantidad"));
                    detalle.setTotal(rs.getDouble("total"));
                    detalles.add(detalle);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return detalles;
        }

        public Boolean deleteProducto(int id_carrito_producto) {
        boolean flag = false;
        String sql = "DELETE FROM carrito_producto WHERE id_carrito_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_carrito_producto);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return flag;
        }


}
