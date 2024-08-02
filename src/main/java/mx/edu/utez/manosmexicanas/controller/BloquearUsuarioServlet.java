package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="BloquearUsuarioServlet", value = "/eliminar")
public class BloquearUsuarioServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        String estado_usuario = request.getParameter("estado_usuario");



    }
}
