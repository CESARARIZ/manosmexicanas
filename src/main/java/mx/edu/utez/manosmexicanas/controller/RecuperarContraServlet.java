package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.manosmexicanas.dao.UsuarioDao;
import mx.edu.utez.manosmexicanas.model.Usuario;
import mx.edu.utez.manosmexicanas.utils.SimpleRandomStringGenerator;
import mx.edu.utez.manosmexicanas.utils.SimpleRandomStringGenerator.*;
//import mx.edu.utez.manosmexicanas.utils.GmailSender;

import java.io.IOException;
//EL VALUE ES LA ACTION QUE SE PONE EN EL FORMULARIO
@WebServlet(name="RecuperarContraServlet", value="/recuperarContra")
public class RecuperarContraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String correo = req.getParameter("correo");
        String codigo;

        //SE CREA COMO LONGITUD DEL CODIGO
        int lenght = 10;

        UsuarioDao dao = new UsuarioDao();
        //PARA VERIFICAR SI EXISTE O NO.
        Usuario u = dao.getCorreo(correo);
        int id = u.getId();
        if (u.getCorreo()==null){
            HttpSession sesion = req.getSession();
            sesion.setAttribute("mensajeCorreo","El correo no existe.");
            //SI NO EXISTE SE REDIRIGE AL MISMO LOGIN PARA MOSTRAR EL ERROR
            resp.sendRedirect("recuperarCuenta.jsp");
        }else{
            codigo = SimpleRandomStringGenerator.generateRandomString(lenght);

            if (dao.updateCodigo(correo, codigo)){
                String asunto= "Recuperar contraseña";
                String mensaje = "<a href=\"http://localhost:8080/manosMexicanas_war_exploded/recuperarContra?codigo="+codigo+"&id=" + id +"\"> Haz click aqui para recuperar tu contraseña </a> ";

            /*
                try {
                    GmailSender msj = new GmailSender();
                    msj.sendMail(correo, asunto, mensaje);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                } */
            }


        }
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String codigo = req.getParameter("codigo");

        UsuarioDao dao = new UsuarioDao();


        if (dao.getCodigo(codigo)){

            Usuario u = new Usuario();
            u.setId(id);
            u.setCodigo(codigo);
            String rutaa = "newContraseña.jsp?codigo=" + codigo + "&id=" + id;
            resp.sendRedirect(rutaa);
        }
    }
}

