package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.ColorProducto;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ColorDao {
    public List<ColorProducto> ColorProducto(int id_producto) throws SQLException {
        List<ColorProducto> colores = new ArrayList<>();
        String query = "SELECT c.id_color, c.nombre FROM color c " +
                "JOIN prod_talla_color ptc ON c.id_color = ptc.id_color " +
                "WHERE ptc.id_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            // 2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ColorProducto c = new ColorProducto();
                c.setId_color(rs.getInt("id_color"));
                c.setNombre(rs.getString("nombre"));
                colores.add(c);
            }


        }catch (SQLException e){
            e.printStackTrace();
        }
        return colores;

    }
}
