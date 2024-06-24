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

//SE PONE /LOGIN PORQUE ES LA ACTION QUE SE PUSO EN EL FORMULARIO DE LOGIN
@WebServlet(name="UsuarioServlet", value="/login")
public class UsuarioServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1) Obtener la información del formulario
        String correo = req.getParameter("correo");
        String contra = req.getParameter("contra");
        String ruta = "ingresar.jsp";

        //2) conectarme a la base de datos y buscar al usuario segun
        // las credenciales del form
        UsuarioDao dao = new UsuarioDao();
        Usuario u = dao.getOne(correo,contra);

        if(u.getCorreo() == null){
            //No existe el usuario en la base de datos
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensaje","El usuario no existe en la BD");
            //SI NO EXISTE SE REDIRIGE AL MISMO LOGIN PARA MOSTRAR EL ERROR
            resp.sendRedirect(ruta);
        }else{
            //SI EXISTE EL USUARIO SE REDIRIGE AL INDEX CORRESPONDIENTE
            ruta="indexCliente.jsp";
            HttpSession sesion = req.getSession();
            sesion.setAttribute("usuario",u);
            resp.sendRedirect(ruta);
        }
    }
}
