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

@WebServlet(name="UpdateContraServlet", value="/updateContra")
public class UpdateContraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        String codigo = req.getParameter("codigo");

        String pass1 = req.getParameter("contra1");
        String pass2 = req.getParameter("contra2");
        HttpSession sesion = req.getSession();
        // Crear instancia del DAO y del usuario
        UsuarioDao dao = new UsuarioDao();
        if (pass1.equals(pass2)) {
            pass1 = pass2;

            // Llamar al método de actualización del DAO
            boolean actualizado = dao.updateContra(id, pass1);

            // Redirigir según el resultado de la actualización
            if (actualizado) {
                resp.sendRedirect("ingresar.jsp");
                sesion.setAttribute("mensajeContraNueva","Tu contraseña se actualizo.");
            } else {
                resp.sendRedirect("newContraseña.jsp?codigo=" + codigo + "&id=" + id);
            }
        }else{

            sesion.setAttribute("mensajeContra","Las contraseñas no coinciden");
            resp.sendRedirect("newContraseña.jsp?codigo=" + codigo + "&id=" + id);
        }

    }
}
