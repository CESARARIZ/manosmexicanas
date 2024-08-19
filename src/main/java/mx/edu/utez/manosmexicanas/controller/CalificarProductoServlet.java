package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.ComentarioDao;
import mx.edu.utez.manosmexicanas.dao.ProductoDao;
import mx.edu.utez.manosmexicanas.model.Comentario;
import mx.edu.utez.manosmexicanas.model.Producto;
import mx.edu.utez.manosmexicanas.model.Usuario;

import java.io.IOException;

@WebServlet(name="CalificarProductoServlet", value = "/calificar")
public class CalificarProductoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        int id_pedido_producto = Integer.parseInt(request.getParameter("id_pedido_producto"));
        String nombre_producto = request.getParameter("nombre_producto");
        int calificacion = Integer.parseInt(request.getParameter("calificacion"));
        String comentario = request.getParameter("comentario");


        ComentarioDao comentarioDao = new ComentarioDao();

        Producto p = new Producto();
        p = comentarioDao.getOne(nombre_producto);

        int id_producto = p.getId_producto();

        String comenta = "Comentado";

        if(id_producto != 0){
            Comentario com = new Comentario();
            com.setId_usuario(id_usuario);
            com.setId_producto(id_producto);
            com.setCalificacion(calificacion);
            com.setComentario(comentario);

            boolean insert = comentarioDao.insertarCalificacion(com);
            if(insert){
                boolean uptComentario = comentarioDao.uptComentario(comenta, id_pedido_producto);
                if(uptComentario){
                    response.sendRedirect("pedido?id_usuario="+id_usuario);
                }else{
                    response.sendRedirect("404.jsp");
                }
            }else{
                response.sendRedirect("404.jsp");
            }

        }else{
            response.sendRedirect("404.jsp");
        }
    }

}
