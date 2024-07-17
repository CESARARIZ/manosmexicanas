package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.ColorProducto;
import mx.edu.utez.manosmexicanas.model.Imagen;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImagenDao {
    public List<Imagen> ImagenProducto(int id_producto) throws SQLException {
        List<Imagen> imagenes = new ArrayList<>();
        String query = "SELECT i.id_imagen, i.id_producto ,i.url FROM imagen i " +
                "JOIN producto p ON i.id_producto = p.id_producto " +
                "WHERE p.id_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            // 2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Imagen i = new Imagen();
                i.setId_imagen(rs.getInt("id_imagen"));
                i.setId_producto(rs.getInt("id_producto"));
                i.setUrl(rs.getString("url"));
                imagenes.add(i);
            }


        }catch (SQLException e){
            e.printStackTrace();
        }
        return imagenes;
    }
}
