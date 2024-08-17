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
        String ruta;

        if (pass1.equals(pass2)) {
            // Crear el usuario y llamar al DAO
            Usuario u = new Usuario();
            u.setNombre_usuario(nombre);
            u.setTelefono(telefono);
            u.setCorreo(correo);
            u.setContra(pass1);

            UsuarioDao dao = new UsuarioDao();
            String mensaje = dao.insert(u);

            // Manejar el mensaje recibido del DAO
            if ("Usuario registrado exitosamente.".equals(mensaje)) {
                // Redirigir a la página de inicio de sesión o a donde quieras
                ruta = "ingresar.jsp";
            } else {
                // Enviar el mensaje a la página de registro
                HttpSession sesion = req.getSession();
                sesion.setAttribute("mensaje2", mensaje);
                ruta = "registrarse.jsp";
            }

        } else {
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje2", "Las contraseñas no coinciden");
            ruta = "registrarse.jsp";
        }

        resp.sendRedirect(ruta);
    }

}
