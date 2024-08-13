package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.utils.DatabaseConnectionManager;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet(name = "MostrarImagenServlet", value = "/mostrarImagen")
public class MostrarImagenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id_pc = Integer.parseInt(req.getParameter("id_pc"));
        String query = "SELECT img FROM producto_colores WHERE id_pc = ?";
        try (Connection connection = DatabaseConnectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id_pc);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                byte[] imgBytes = resultSet.getBytes("img");
                resp.setContentType("image/jpeg");
                try (OutputStream outputStream = resp.getOutputStream()) {
                    outputStream.write(imgBytes);
                    outputStream.flush();
                }
            } else {
                // Si no se encuentran imágenes, se podría retornar una imagen por defecto o un mensaje de error.
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontraron imágenes para este producto.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al acceder a la base de datos.");
        }
    }
}

