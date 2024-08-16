package mx.edu.utez.manosmexicanas.dao;



import mx.edu.utez.manosmexicanas.model.*;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.awt.*;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductoDao {

    public List<Producto> obtenerTodosLosProductos() throws SQLException {
        List<Producto> productos = new ArrayList<>();
        String query =  "SELECT * FROM productos_info ";

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
                producto.setEstado(resultSet.getString("estatus"));

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
        String query = "SELECT p.id_producto, p.nombre, c.id_categoria, c.nombre_categoria, p.descripcion, p.precio, p.stock, p.estatus " +
                "FROM productos p " +
                "JOIN categorias c ON p.id_categoria = c.id_categoria " +
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
                    p.setEstado(rs.getString("estatus"));

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

                    List<Integer> img = obtenerIdsImagenesPorProducto(id_producto);
                    p.setImagenes(img);
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
                "FROM tallas t " +
                "JOIN producto_Tallas pt ON t.id_talla = pt.id_talla " +
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
                "FROM colores c\n" +
                "JOIN producto_Colores pc ON c.id_color = pc.id_color\n" +
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
    public List<Categoria> getCategorias() {

        String query = "SELECT * FROM categorias";
        ArrayList<Categoria> categorias = new ArrayList<>();
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet resultSet = ps.executeQuery()) {

            while (resultSet.next()) {
                Categoria c = new Categoria();
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
        String query = "SELECT * FROM categorias WHERE nombre_categoria = ?"; // Asegúrate de que la consulta sea correcta
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nombre_categoria); // Configura el parámetro correctamente
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    c.setId_categoria(rs.getInt("id_categoria"));
                    c.setNombre_categoria(rs.getString("nombre_categoria"));
                    System.out.println("Categoria recuperada: " + c.getNombre_categoria());
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
        String sql = "INSERT INTO productos (nombre, descripcion, precio, stock, id_categoria) VALUES (?, ?, ?,?,?)";
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
            ps.close();
            con.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Producto getId_producto(String nombre_producto) throws SQLException {
        Producto p = new Producto();
        String query = "SELECT * FROM productos WHERE nombre = ?";;
        try (Connection con = DatabaseConnectionManager.getConnection();
        PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nombre_producto);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p.setId_producto(rs.getInt("id_producto"));
                    p.setNombre_producto(rs.getString("nombre"));
                    p.setDescripcion(rs.getString("descripcion"));
                    p.setPrecio(rs.getDouble("precio"));
                    p.setStockDisponible(rs.getInt("stock"));
                    p.setCategoria(getCategoria(rs.getString("id_categoria")));
                } ps.close();
                con.close();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return p;
    }


    //INSERTA EL COLOR
    public boolean insertColores(String color_producto)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO colores (color) VALUES (?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, color_producto);
            if(ps.executeUpdate() == 1){
                flag = true;
            } ps.close();
            con.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    //INSERTA LA TALLA
    public boolean insertTallas(String talla_producto)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO tallas (talla)VALUES (?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, talla_producto);
            if(ps.executeUpdate() == 1){
                flag = true;
            } ps.close();
            con.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    //INSERTA EN LA TABLA SECUNDARIA COLORES
    public static boolean insertProductoColor(int id_producto, int id_color, InputStream img)throws SQLException{
        boolean flag = false;
        String sql = "INSERT INTO producto_colores (id_producto, id_color, img)VALUES (?,?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id_producto);
            ps.setInt(2,id_color);
            ps.setBlob(3,img);
            if(ps.executeUpdate() == 1){
                flag = true;
            } ps.close();
            con.close();
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
            } ps.close();
            con.close();
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
        String sql = "SELECT id_talla FROM tallas WHERE talla = ?";
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

    public List<ProductoColor> getImagenesPorProducto(int id_producto, int id_color) throws SQLException {
        List<ProductoColor> listaImagenes = new ArrayList<>();
        String sql = "SELECT id_producto, id_color, img FROM producto_colores WHERE id_producto = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductoColor productoColor = new ProductoColor();
                productoColor.setId_producto(id_producto);  // Asignar el id_producto al objeto Producto
                productoColor.setId_producto_color(rs.getInt("id_color"));
                productoColor.setImg(rs.getBlob("img").getBinaryStream());  // Obtener el InputStream de la imagen

                listaImagenes.add(productoColor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al obtener las imágenes del producto", e);
        }

        return listaImagenes;
    }

    public int getIdProducto(String nombre_producto) throws SQLException {
        int id_producto = 0;
        String sql = "SELECT id_producto FROM productos WHERE nombre_producto = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nombre_producto);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id_producto = rs.getInt("id_producto");
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return id_producto;
    }

    public boolean uptEstado (int id_producto, String estado_producto){
        boolean flag = false;
        String query = "update productos set estatus = ? where id_producto = ?";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, estado_producto);
            ps.setInt(2, id_producto);
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

    private List<Integer> obtenerIdsImagenesPorProducto(int idProducto) {
        List<Integer> idsImagenes = new ArrayList<>();
        String query = "SELECT id_pc FROM producto_colores WHERE id_producto = ?";

        try (Connection connection = DatabaseConnectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, idProducto);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                idsImagenes.add(resultSet.getInt("id_pc"));
                System.out.println("idsImagenes: " + idsImagenes);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return idsImagenes;
    }


    public List<Integer> idsImagenes(int id_producto){
        List<Integer> idsImagenes = new ArrayList<>();
        String sql = "SELECT id_pc FROM producto_colores WHERE id_producto = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_producto);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                idsImagenes.add(rs.getInt("id_pc"));
                System.out.println("idsImagenes: " + idsImagenes);
            }
            ps.close();
            con.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return idsImagenes;
    }

}