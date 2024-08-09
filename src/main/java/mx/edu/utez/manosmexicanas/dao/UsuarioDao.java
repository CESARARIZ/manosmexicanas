package mx.edu.utez.manosmexicanas.dao;

import mx.edu.utez.manosmexicanas.model.Usuario;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDao {
    // Programar una función R (lectura) para obtener un usuario
    // con el fin de hacer el inicio de sesión
    public Usuario getOne(String correo, String contra) {
        Usuario u = new Usuario();
        String query = "select * from usuario where correo = ? and contra = sha2(?,256)";

        try {
            // 1) Conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            // 2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, correo);
            ps.setString(2, contra);
            ResultSet rs = ps.executeQuery();
            // 3) Obtener la información
            if (rs.next()) {
                // Entonces llenamos la información del usuario
                u.setId(rs.getInt("id_usuario"));
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setTelefono(rs.getString("telefono"));
                u.setCorreo(rs.getString("correo"));
                u.setDireccion(rs.getString("direccion"));
                u.setContra(rs.getString("contra"));
                u.setEstado(rs.getString("estado"));
                u.setTipo_usuario(rs.getString("tipo_usuario"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean insert(Usuario u) {
        boolean flag = false;
        String query = "insert into usuario(nombre_usuario,telefono,correo,contra) values(?,?,?,sha2(?,256))";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getNombre_usuario());
            ps.setString(2, u.getTelefono());
            ps.setString(3, u.getCorreo());
            ps.setString(4, u.getContra());
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public ArrayList<Usuario> getAll() {
        ArrayList<Usuario> lista = new ArrayList<>();
        String tipo = "usuario";
        String query = "select * from usuario where tipo_usuario = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, tipo);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getString("telefono"));
                u.setDireccion(rs.getString("direccion"));
                u.setEstado(rs.getString("estado"));
                lista.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    //OBTENER CORREO
    public  Usuario getCorreo(String correo) {
        Usuario u = new Usuario();
        String query = "select * from usuario where correo = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,correo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                u.setId(rs.getInt("id_usuario"));
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setCorreo(rs.getString("correo"));
                u.setTelefono(rs.getString("telefono"));
                u.setContra(rs.getString("contra"));
                u.setEstado(rs.getString("estado"));
                u.setTipo_usuario(rs.getString("tipo_usuario"));
                u.setCodigo(rs.getString("codigo"));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return u;
    }


    //ACTUALIZAR CODIGO
    public boolean updateCodigo(String correo, String codigo) {
        boolean flag = false;
        String query = "update usuario set codigo = ? where correo = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,codigo);
            ps.setString(2,correo);
            if (ps.executeUpdate()>0){
                flag = true;
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    //OBTENER CODIGO
    public boolean getCodigo(String codigo) {
        boolean flag = false;
        String query = "select * from usuario where codigo = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,codigo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    //ACTUALIZAR CONTRASEÑA Y CODIGO
    public boolean updateContra (int id, String contra){
        boolean flag = false;
        String query = "update usuario set contra = sha2(?,256), codigo = NULL where id = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,contra);
            ps.setInt(2,id);
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

    public boolean updateEstado (int id_usuario, String estado_usuario){
        boolean flag = false;
        String query = "update usuario set estado = ? where id_usuario = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, estado_usuario);
            ps.setInt(2, id_usuario);
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
            ps.close();
            con.close();
        }catch (SQLException e){
            e.printStackTrace();
        }

        return flag;
    }

    public Usuario getCorreo(int id_usuario) {
        Usuario u = new Usuario();
        String query = "select * from usuario where id_usuario = ? ";

        try {
            // 1) Conectarnos a la BD
            Connection con = DatabaseConnectionManager.getConnection();
            // 2) Configurar el query y ejecutarlo
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_usuario);
            ResultSet rs = ps.executeQuery();
            // 3) Obtener la información
            if (rs.next()) {
                // Entonces llenamos la información del usuario
                u.setId(rs.getInt("id_usuario"));
                u.setNombre_usuario(rs.getString("nombre_usuario"));
                u.setTelefono(rs.getString("telefono"));
                u.setCorreo(rs.getString("correo"));
                u.setDireccion(rs.getString("direccion"));
                u.setContra(rs.getString("contra"));
                u.setEstado(rs.getString("estado"));
                u.setTipo_usuario(rs.getString("tipo_usuario"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }


}
