package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.UsuarioDao;

import java.io.IOException;

@WebServlet(name="BloquearUsuarioServlet", value = "/eliminar")
public class BloquearUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        String estado_usuario = request.getParameter("estado");

        if("Activo".equals(estado_usuario)){
            estado_usuario = "Bloqueado";
        }else{
            estado_usuario = "Activo";
        }
        UsuarioDao dao = new UsuarioDao();
        boolean bloqueado = dao.updateEstado(id_usuario, estado_usuario);
        if(bloqueado){
            response.sendRedirect("gestionUsuarios.jsp");
        }else{
            response.sendRedirect("404.jsp");
        }


    }
}
