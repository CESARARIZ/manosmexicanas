package mx.edu.utez.manosmexicanas.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.manosmexicanas.dao.UsuarioDao;
import mx.edu.utez.manosmexicanas.model.Usuario;

import java.io.IOException;

@WebServlet(name="RegistrarUsuarioServlet", value="/sign_in")
public class RegistrarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String telefono = req.getParameter("telefono");
        String correo = req.getParameter("email");
        String pass1 = req.getParameter("pass1");
        String pass2 = req.getParameter("pass2");
        String ruta = "index.jsp";
        if (pass1.equals(pass2)) {
            pass1 = pass2;
            //3) utilizar el dao con la función insert para insertar una persona en la BD
            UsuarioDao dao = new UsuarioDao();
            Usuario u = new Usuario();
            {
                u.setNombre_usuario(nombre);
                u.setTelefono(telefono);
                u.setCorreo(correo);
                u.setContra(pass1);
            };
            boolean insert = dao.insert(u);
            //4) una vez insertada la persona redirigir el usuario hacia el index.jsp
            if (insert) {
                resp.sendRedirect(ruta);
            }
        }else{
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje2","Las contraseñas no coinciden");
            resp.sendRedirect("registrarse.jsp");
        }


    }
}
