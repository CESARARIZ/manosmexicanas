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


@WebServlet(name="MostrarImgCarritoServlet", value = "/mostrarImg")
public class MostrarImgCarritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_producto = Integer.parseInt(request.getParameter("nombre_producto"));
        int id_color = Integer.parseInt(request.getParameter("nombre_color"));
        System.out.println("ID COLOR REC EN SERVLET: " + id_color);
        String query = "SELECT img FROM producto_colores WHERE id_producto = ? AND id_color = ?";

        try (Connection connection = DatabaseConnectionManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id_producto);
            preparedStatement.setInt(2, id_color);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                byte[] imgBytes = resultSet.getBytes("img");
                response.setContentType("image/jpeg");
                OutputStream outputStream = response.getOutputStream();
                outputStream.write(imgBytes);
                outputStream.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
