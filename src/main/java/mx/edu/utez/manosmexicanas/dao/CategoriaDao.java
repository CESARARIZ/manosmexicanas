package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.Categoria;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
        String query = "insert into categorias(nombre_categoria) values(?)";
        try (Connection con=DatabaseConnectionManager.getConnection()) {
            try (PreparedStatement stmt = con.prepareStatement(query)) {
                stmt.setString(1, categoria.getNombre_categoria());

                if(stmt.executeUpdate()>0){
                    flag = true;
                }
            }
        }catch (SQLException e){
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
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cat;
    }
}
