package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.UsuarioDao;
import mx.edu.utez.manosmexicanas.model.Usuario;

import java.io.IOException;

@WebServlet (name="IngresarDireccionServlet",value = "/addDireccion")
public class IngresarDireccionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String direccion = request.getParameter("direccion");
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        System.out.println("Usuario a upt direccion"+id_usuario);
        System.out.println("Direccion nueva: "+direccion);

        UsuarioDao dao = new UsuarioDao();

        boolean uptDire = dao.uptDireccion(id_usuario, direccion);
        if(uptDire){
            response.sendRedirect("verCarrito");
        }

    }

}
