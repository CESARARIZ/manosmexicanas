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
        String query = "INSERT INTO carrito_producto (id_carrito, id_producto, id_talla, id_color, cantidad, total) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cd.getId_carrito());
            ps.setInt(2, cd.getId_producto());
            ps.setInt(3, cd.getId_talla());
            ps.setInt(4, cd.getId_color());
            ps.setInt(5, cd.getCantidad());
            ps.setDouble(6, cd.getTotal());
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public List<DetalleCarritoDTO> getDetallesCarrito(int id_carrito) {
        List<DetalleCarritoDTO> detallesCarrito = new ArrayList<DetalleCarritoDTO>();
        String sql = "SELECT " +
                "cp.id_carrito_producto, " +
                "p.nombre AS nombre_producto, " +
                "i.url AS imagen, " +
                "t.nombre AS nombre_talla, " +
                "c.nombre AS nombre_color, " +
                "cp.cantidad, " +
                "cp.total " +
                "FROM carrito_producto cp " +
                "JOIN productos p ON cp.id_producto = p.id_producto " +
                "JOIN tallas t ON cp.id_talla = t.id_talla " +
                "JOIN colores c ON cp.id_color = c.id_color " +
                "JOIN imagenes i ON p.id_producto = i.id_producto " +
                "WHERE cp.id_carrito = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_carrito);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DetalleCarritoDTO dto = new DetalleCarritoDTO();
                dto.setId_carrito(rs.getInt("id_carrito"));
                dto.setNombre_producto(rs.getString("nombre_producto"));
                dto.setNombre_talla(rs.getString("nombre_talla"));
                dto.setNombre_color(rs.getString("nombre_color"));
                dto.setCantidad(rs.getInt("cantidad"));
                dto.setTotal(rs.getDouble("total"));
                detallesCarrito.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detallesCarrito;
    }
}
