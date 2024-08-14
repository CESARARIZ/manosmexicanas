package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet(name = "MostrarImagenServlet", value = "/mostrarImagen")
public class MostrarImagenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_pc = Integer.parseInt(req.getParameter("id_pc"));
        System.out.println("ID DE LA IMG "+id_pc);
        String query = "SELECT img FROM producto_colores WHERE id_pc = ?";
        try (Connection connection = DatabaseConnectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id_pc);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                byte[] imgBytes = resultSet.getBytes("img");
                // Detectar automáticamente el tipo MIME
                InputStream inputStream = new ByteArrayInputStream(imgBytes);
                String mimeType = URLConnection.guessContentTypeFromStream(inputStream);

                if (mimeType == null) {
                    mimeType = "application/octet-stream"; // Tipo por defecto si no se puede detectar
                }

                // Establecer el tipo de contenido
                resp.setContentType(mimeType);
                OutputStream outputStream = resp.getOutputStream();
                outputStream.write(imgBytes);
                outputStream.flush();
            }
            System.out.println("IMAGE ENCONTRADA");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR ENCONTRADA");
        }
    }
}

