package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.UsuarioDao;
import mx.edu.utez.manosmexicanas.model.Usuario;

import java.io.IOException;

@WebServlet(name="UpdateContraServlet", value="/updateContra")
public class UpdateContraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        String contra = req.getParameter("contra");
        String codigo = req.getParameter("codigo");
        // Crear instancia del DAO y del usuario
        UsuarioDao dao = new UsuarioDao();

        // Llamar al método de actualización del DAO
        boolean actualizado = dao.updateContra(id, contra);

        // Redirigir según el resultado de la actualización
        if (actualizado) {
            resp.sendRedirect("index.jsp");
        } else {
            resp.sendRedirect("recuperacion.jsp?codigo="+codigo+"&id="+id);
        }

    }
}
