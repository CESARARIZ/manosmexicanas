package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet(name="AnadirProductosServlet", value = "/addProducto")
public class AnadirProductosServlet extends HttpServlet {
    /*
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Obtener parámetros del formulario
        String sku = getPartValue(request.getPart("sku"));
        String nombre = getPartValue(request.getPart("nombre"));
        String descripcion = getPartValue(request.getPart("descripcion"));
        int id_categoria = Integer.parseInt(getPartValue(request.getPart("categorias")));
        int id_marca = Integer.parseInt(getPartValue(request.getPart("marcas")));
        double precio = Double.parseDouble(getPartValue(request.getPart("precio")));
        int cantidad = Integer.parseInt(getPartValue(request.getPart("cantidad")));
        boolean estatus = true;

        byte[] imagen = null;
        try {
            Part filePart = request.getPart("imagen_producto");
            imagen = getBytesFromPart(filePart);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Crear objetos Marca y Categoria
        Marca marca = new Marca();
        marca.setId_marca(id_marca);

        Categoria categoria = new Categoria();
        categoria.setId_categoria(id_categoria);

        // Crear objeto Producto y establecer sus atributos
        Producto producto = new Producto();
        producto.setSku(sku);
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setCategoria(categoria);
        producto.setMarca(marca);
        producto.setImagen(imagen);
        producto.setPrecio(precio);
        producto.setCantidad(cantidad);
        producto.setEstatus(estatus);

        // Llamar al DAO para guardar el producto
        ProductoDao productoDao = new ProductoDao();
        boolean isSaved = productoDao.insert(producto, categoria, marca);

        if (isSaved) {
            // Redirigir a la página de administración con un mensaje de éxito
            request.getSession().setAttribute("mensaje2", "El producto: "+nombre+" ,se registró correctamente.");
            response.sendRedirect("productosAdmin.jsp");
        } else {
            // Manejar el error mostrando un mensaje de error en la misma página
            request.getSession().setAttribute("mensaje2", "Error al guardar el producto: " + sku);
            response.sendRedirect("productosAdmin.jsp");
        }
    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        String[] elements = header.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(
                        element.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return "";
    }

    private String getPartValue(Part part) throws IOException {
        if (part == null) {
            return null;
        }
        InputStream inputStream = part.getInputStream();
        byte[] bytes = new byte[inputStream.available()];
        inputStream.read(bytes);
        return new String(bytes);
    }

    private byte[] getBytesFromPart(Part part) throws IOException {
        try (InputStream inputStream = part.getInputStream();
             ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            return byteArrayOutputStream.toByteArray();
        }
    }*/
}
