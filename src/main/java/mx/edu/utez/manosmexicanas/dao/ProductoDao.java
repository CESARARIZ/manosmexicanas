package mx.edu.utez.manosmexicanas.dao;



import mx.edu.utez.manosmexicanas.model.*;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductoDao {

    public List<Producto> obtenerTodosLosProductos() throws SQLException {
        List<Producto> productos = new ArrayList<>();
        String query =  "SELECT p.id_producto, p.nombre, c.id_categoria, c.nombre_categoria, p.descripcion, p.precio, p.stock " +
                "FROM Productos p " +
                "JOIN Categorias c ON p.id_categoria = c.id_categoria;";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet resultSet = ps.executeQuery()) {

            while (resultSet.next()) {
                Producto producto = new Producto();
                producto.setId_producto(resultSet.getInt("id_producto"));
                producto.setNombre_producto(resultSet.getString("nombre"));
                producto.setDescripcion(resultSet.getString("descripcion"));
                producto.setPrecio(resultSet.getDouble("precio"));
                producto.setStockDisponible(resultSet.getInt("stock"));

                // Crear y configurar el objeto Categoria
                Categoria categoria = new Categoria();
                categoria.setId_categoria(resultSet.getInt("id_categoria")); // Recupera el ID de la categoría
                categoria.setNombre_categoria(resultSet.getString("nombre_categoria")); // Recupera el nombre de la categoría

                // Asignar la categoria al producto
                producto.setCategoria(categoria);

                // Añadir el producto a la lista
                productos.add(producto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }


    public Producto getOne(int id_producto) {
        Producto p = new Producto();
        String query = "SELECT p.id_producto, p.nombre, c.id_categoria, c.nombre_categoria, p.descripcion, p.precio, p.stock " +
                "FROM Productos p " +
                "JOIN Categorias c ON p.id_categoria = c.id_categoria " +
                "WHERE p.id_producto = ?;";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id_producto);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p.setId_producto(rs.getInt("id_producto"));
                    p.setNombre_producto(rs.getString("nombre"));
                    p.setDescripcion(rs.getString("descripcion"));
                    p.setPrecio(rs.getDouble("precio"));
                    p.setStockDisponible(rs.getInt("stock"));

                    // Crear y configurar el objeto Categoria
                    Categoria categoria = new Categoria();
                    categoria.setId_categoria(rs.getInt("id_categoria")); // Recupera el ID de la categoría
                    categoria.setNombre_categoria(rs.getString("nombre_categoria")); // Recupera el nombre de la categoría

                    // Asignar la categoria al producto
                    p.setCategoria(categoria);

                    // Obtener tallas y colores asociados
                    List<Talla> tallas = TallasPorProducto(id_producto);
                    p.setTallas(tallas);

                    List<ColorProducto> colores = ColoressPorProducto(id_producto);
                    p.setColores(colores);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }


    private List<Talla> TallasPorProducto(int id_producto) throws SQLException {
        List<Talla> tallas = new ArrayList<>();
        String query = "SELECT t.id_talla, t.talla " +
                "FROM Tallas t " +
                "JOIN Producto_Tallas pt ON t.id_talla = pt.id_talla " +
                "WHERE pt.id_producto = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id_producto);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Talla t = new Talla();
                    t.setId_talla(rs.getInt("id_talla"));
                    t.setNombre(rs.getString("talla"));
                    tallas.add(t);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tallas;
    }

    private List<ColorProducto> ColoressPorProducto(int id_producto) throws SQLException {
        List<ColorProducto> colores = new ArrayList<>();
        String query = "SELECT c.id_color, c.color\n" +
                "FROM Colores c\n" +
                "JOIN Producto_Colores pc ON c.id_color = pc.id_color\n" +
                "WHERE pc.id_producto = ?;";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id_producto);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColorProducto c = new ColorProducto();
                    c.setId_color(rs.getInt("id_color"));
                    c.setNombre(rs.getString("color"));
                    colores.add(c);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return colores;
    }


    //METODOS PARA PUBLICAR PRODUCTO

    //1 MOSTRAR LAS CATEGORIAS
    public ArrayList<Categoria> getCategorias() {
        Categoria c = new Categoria();
        String query = "SELECT id_categoria,nombre_categoria FROM CATEGORIAS";
        ArrayList<Categoria> categorias = new ArrayList<>();
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet resultSet = ps.executeQuery()) {

            while (resultSet.next()) {
                c.setId_categoria(resultSet.getInt("id_categoria"));
                c.setNombre_categoria(resultSet.getString("nombre_categoria"));
                categorias.add(c);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return categorias;
    }

    public Categoria getCategoria(String nombre_categoria) throws SQLException {
        Categoria c = new Categoria();
        String query = "SELECT * FROM CATEGORIAS WHERE nombre_categoria = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
        PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nombre_categoria);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c.setId_categoria(rs.getInt("id_categoria"));
                    c.setNombre_categoria(rs.getString("nombre_categoria"));
                    System.out.println("Categoria recuperada: "+c.getNombre_categoria());
                }
            }
        }
        return c;
    }

    //POR SI AGREGARA UNA CATEGORIA
    public boolean inserCategoria(Categoria c) {
        boolean flag = false;
        String sql="INSERT INTO categorias (nombre_categoria) VALUES (?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, c.getNombre_categoria());
            if(ps.executeUpdate() == 1){
                flag = true;
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    //2 INSSERTA EL PRODUCTO
    public boolean insert(Producto p) throws SQLException {
        boolean flag = false;
        String sql = "INSERT INTO Productos (nombre, descripcion, precio, stock, id_categoria) VALUES (?, ?, ?,?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre_producto());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setInt(4,p.getStockDisponible());
            ps.setInt(5,p.getCategoria().getId_categoria());
            if(ps.executeUpdate() == 1){
                flag = true;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    //INSERTA EL COLOR
    public boolean insertColores(String color_producto)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO colores (nombre) VALUES (?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, color_producto);
            if(ps.executeUpdate() == 1){
                flag = true;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    //INSERTA LA TALLA
    public boolean insertTallas(Talla t)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO tallas (nombre)VALUES (?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, t.getNombre());
            if(ps.executeUpdate() == 1){
                flag = true;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    //INSERTA EN LA TABLA SECUNDARIA COLORES
    public boolean insertProductoColor(int id_producto, int id_color)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO producto_colorres (id_producto, id_color)VALUES (?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id_producto);
            ps.setInt(2,id_color);
            if(ps.executeUpdate() == 1){
                flag = true;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean insertTalla(int id_producto, int id_talla)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO producto_tallas (id_producto, id_talla)VALUES (?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id_producto);
            ps.setInt(2,id_talla);
            if(ps.executeUpdate() == 1){
                flag = true;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    //INSERTA LA IMAGEN
    public boolean insertImg(Imagen img)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO imagen (id_usuario, imagen)VALUES (?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,img.getId_producto());

            if(ps.executeUpdate() == 1){
                flag = true;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean insertImagen(Imagen imagen)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO imagen (id_producto, img)VALUES (?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,imagen.getId_producto());
            ps.setBlob(2,imagen.getImagen());
            if(ps.executeUpdate() == 1){
                flag = true;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    public int getId_color(String color) {
        int id_color = 0;
        String sql = "SELECT id_color FROM colores WHERE color = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, color);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                id_color = rs.getInt("id_color"); // Obtener el ID del color
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id_color;
    }

    public int getId_talla(String talla) {
        int id_talla = 0;
        String sql = "SELECT id_talla FROM colores WHERE talla = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, talla);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                id_talla = rs.getInt("id_talla"); // Obtener el ID del color
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id_talla;
    }
}