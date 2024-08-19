package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.Categoria;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDao {
    public List<Categoria> findAll(){
        List<Categoria> categorias = new ArrayList<Categoria>();
        String sql = "select * from categorias";
        try (Connection con= DatabaseConnectionManager.getConnection()) {
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                try (ResultSet res = stmt.executeQuery()) {
                    while (res.next()) {
                        Categoria cate = new Categoria();
                        cate.setId_categoria(res.getInt("id_categoria"));
                        cate.setNombre_categoria(res.getString("nombre_categoria"));
                        categorias.add(cate);
                    }
                }
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categorias;
    }

    public boolean insert(Categoria categoria) {
        boolean flag = false;
        String query = "INSERT INTO categorias(nombre_categoria) values (?)"; // Cambiar a procedimiento almacenado
        try (Connection con = DatabaseConnectionManager.getConnection()) {
            try (PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1, categoria.getNombre_categoria());
                if (ps.executeUpdate() > 0) {
                    flag = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    public Categoria getOne(String categoria) {
        Categoria cat = null;
        String sql = "select * from categorias where nombre_categoria = ?";
        try{
            Connection con=DatabaseConnectionManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, categoria);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                cat = new Categoria();
                cat.setId_categoria(rs.getInt("id_categoria"));
                cat.setNombre_categoria(rs.getString("nombre_categoria"));
            }
            stmt.close();
            con.close();
            rs.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cat;
    }
}
