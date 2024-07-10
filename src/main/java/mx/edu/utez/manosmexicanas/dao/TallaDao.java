package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.Talla;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TallaDao {

    public List<Talla> tallasProducto(int id_producto) throws SQLException {
        List<Talla> tallas = new ArrayList<>();
        String query = "SELECT t.id_talla, t.nombre FROM talla t " +
                "JOIN prod_talla_color ptc ON t.id_talla = ptc.id_talla " +
                "WHERE ptc.id_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            // 2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Talla t = new Talla();
                t.setId_talla(rs.getInt("id_talla"));
                t.setNombre(rs.getString("nombre"));
                tallas.add(t);
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return tallas;
    }
}
