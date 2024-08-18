package mx.edu.utez.manosmexicanas.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.CategoriaDao;
import mx.edu.utez.manosmexicanas.model.Categoria;

import java.io.IOException;
import java.util.List;

@WebServlet(name="NuevaCategoriaServlet", value = "/newCategoria")
public class NuevaCategoriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoriaDao dao = new CategoriaDao();
        List<Categoria> lista = dao.findAll();
        Gson gson = new Gson();
        String json = gson.toJson(lista);

        resp.setContentType("text/json");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre_categoria = req.getParameter("nombre_categoria");

        CategoriaDao dao = new CategoriaDao();

        // Verificar si la categoría ya existe
        Categoria categoriaExistente = dao.getOne(nombre_categoria);

        resp.setContentType("text/plain");

        if (categoriaExistente != null) {
            // Si ya existe, enviar un mensaje específico
            resp.getWriter().write("EXISTE");
        } else {
            Categoria cat = new Categoria();
            cat.setNombre_categoria(nombre_categoria);

            if (dao.insert(cat)) {
                resp.getWriter().write("Listo");
            } else {
                resp.getWriter().write("Error");
            }
        }
    }


}
