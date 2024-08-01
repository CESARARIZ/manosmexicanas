package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.Pedido;
import mx.edu.utez.manosmexicanas.model.PedidoDetalle;
import mx.edu.utez.manosmexicanas.model.PedidoProducto;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PedidoDao {
    public int insertPedido(Pedido pedido) {
        int idPedido = -1;
        String query = "INSERT INTO pedido(id_usuario, fecha_pedido) values (?,?);";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, pedido.getId_usuario());
            ps.setTimestamp(2, new java.sql.Timestamp(pedido.getFecha_pedido().getTime()));
            if(ps.executeUpdate() > 0){
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next()){
                    idPedido = rs.getInt(1);

                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return idPedido;
    }

    public boolean insertDetallePedido(PedidoProducto pedidoProducto){
        boolean flag = false;
        String query = "INSERT INTO pedido_producto(id_pedido, id_producto, id_categoria, id_talla, id_color, cantidad, precio_unitario, total) values (?,?,?,?,?,?,?,?);";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pedidoProducto.getId_pedido());
            ps.setInt(2, pedidoProducto.getId_producto());
            ps.setInt(3, pedidoProducto.getId_categoria());
            ps.setInt(4, pedidoProducto.getId_talla());
            ps.setInt(5, pedidoProducto.getId_color());
            ps.setDouble(6, pedidoProducto.getCantidad());
            ps.setDouble(7, pedidoProducto.getPrecio_unitario());
            ps.setDouble(8, pedidoProducto.getTotal());
            if(ps.executeUpdate() > 0){
                flag = true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public List<PedidoDetalle> getPedidoDetalles(int id_usuario){
        List<PedidoDetalle> pedidoDetalles = new ArrayList<PedidoDetalle>();
        String query = "SELECT pp.id_pedido_producto, pp.id_pedido, p.nombre AS nombre_producto, cat.nombre_categoria AS nombre_categoria, " +
                "t.talla AS nombre_talla, co.color AS nombre_color, pp.cantidad, pp.total, pe.estatus " +
                "FROM pedido_producto pp " +
                "JOIN pedido pe ON pp.id_pedido = pe.id_pedido " +
                "JOIN productos p ON pp.id_producto = p.id_producto " +
                "JOIN categorias cat ON pp.id_categoria = cat.id_categoria " +
                "JOIN tallas t ON pp.id_talla = t.id_talla " +
                "JOIN colores co ON pp.id_color = co.id_color " +
                "WHERE pe.id_usuario = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_usuario);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                PedidoDetalle det = new PedidoDetalle();
                det.setId_pedido_detalle(rs.getInt("id_pedido_producto"));
                det.setId_pedido(rs.getInt("id_pedido"));
                det.setNombre_producto(rs.getString("nombre_producto"));
                det.setNombre_categoria(rs.getString("nombre_categoria"));
                det.setNombre_talla(rs.getString("nombre_talla"));
                det.setNombre_color(rs.getString("nombre_color"));
                det.setCantidad(rs.getInt("cantidad"));
                det.setTotal(rs.getDouble("total"));
                det.setEstado(rs.getString("estatus"));
                pedidoDetalles.add(det);

            }
            rs.close();
            ps.close();
            con.close();
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("Error en la consulta SQL: " + e.getMessage());
        }
        return pedidoDetalles;
    }

    public boolean updateEstado(int id_pedido_producto, String estado){
        boolean flag = false;
        String sql = "UPDATE pedido_producto SET estado = ? WHERE id_pedido_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, estado);
            ps.setInt(2, id_pedido_producto);
            if(ps.executeUpdate() > 0){
                flag = true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public List<PedidoDetalle> getPedidoDetallesParaAdministrador() {
        List<PedidoDetalle> pedidoDetalles = new ArrayList<>();
        String query = "SELECT pp.id_pedido_producto, pp.id_pedido, u.nombre_usuario, p.nombre AS nombre_producto, " +
                "cat.nombre_categoria AS nombre_categoria, t.talla AS nombre_talla, co.color AS nombre_color, " +
                "pp.cantidad, pp.total, pe.estatus " +
                "FROM pedido_producto pp " +
                "JOIN pedido pe ON pp.id_pedido = pe.id_pedido " +
                "JOIN usuario u ON pe.id_usuario = u.id_usuario " +
                "JOIN productos p ON pp.id_producto = p.id_producto " +
                "JOIN categorias cat ON p.id_categoria = cat.id_categoria " +
                "JOIN tallas t ON pp.id_talla = t.id_talla " +
                "JOIN colores co ON pp.id_color = co.id_color " +
                "ORDER BY pp.id_pedido_producto ASC";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PedidoDetalle det = new PedidoDetalle();
                det.setId_pedido_detalle(rs.getInt("id_pedido_producto"));
                det.setId_pedido(rs.getInt("id_pedido"));
                det.setNombre_cliente(rs.getString("nombre_usuario"));
                det.setNombre_producto(rs.getString("nombre_producto"));
                det.setNombre_categoria(rs.getString("nombre_categoria"));
                det.setNombre_talla(rs.getString("nombre_talla"));
                det.setNombre_color(rs.getString("nombre_color"));
                det.setCantidad(rs.getInt("cantidad"));
                det.setTotal(rs.getDouble("total"));
                det.setEstado(rs.getString("estatus"));
                pedidoDetalles.add(det);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error en la consulta SQL: " + e.getMessage());
        }
        return pedidoDetalles;
    }

}
