package mx.edu.utez.manosmexicanas.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.manosmexicanas.dao.PedidoDao;
import mx.edu.utez.manosmexicanas.model.Pedido;
import mx.edu.utez.manosmexicanas.model.PedidoProducto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@WebServlet(name="ProductosPedidoServlet", value = "/addPedido")
public class ProductosPedidoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String[] idsProducto = req.getParameterValues("id_producto");
        String[] idsCategoria = req.getParameterValues("id_categoria");
        String[] idsTalla = req.getParameterValues("id_talla");
        String[] idsColor = req.getParameterValues("id_color");
        String[] cantidad = req.getParameterValues("cantidad");
        String[] precio = req.getParameterValues("precio_unitario");
        String[] totales = req.getParameterValues("total");

        System.out.println("id_usuario: " + req.getParameter("id_usuario"));
        System.out.println("idsProducto: " + Arrays.toString(idsProducto));
        System.out.println("idsCategoria: " + Arrays.toString(idsCategoria));
        System.out.println("idsTalla: " + Arrays.toString(idsTalla));
        System.out.println("idsColor: " + Arrays.toString(idsColor));
        System.out.println("cantidad: " + Arrays.toString(cantidad));
        System.out.println("precio: " + Arrays.toString(precio));
        System.out.println("totales: " + Arrays.toString(totales));

        if (idsProducto == null || idsCategoria == null || idsTalla == null || idsColor == null || cantidad == null || precio == null || totales == null) {
            throw new ServletException("Faltan parámetros en la solicitud.");
        }

        int id_usuario = Integer.parseInt(req.getParameter("id_usuario"));
        Date fecha_pedido = new Date();

        Pedido pedido = new Pedido();

        pedido.setId_usuario(id_usuario);
        pedido.setFecha_pedido(fecha_pedido);

        PedidoDao dao = new PedidoDao();
        int id_pedido = dao.insertPedido(pedido);

        if (id_pedido != -1) {
            List<PedidoProducto> pdp = new ArrayList<>();
            for (int i = 0; i < idsProducto.length; i++) {
                PedidoProducto pp = new PedidoProducto();
                pp.setId_pedido(id_pedido);
                pp.setId_producto(Integer.parseInt(idsProducto[i]));
                pp.setId_categoria(Integer.parseInt(idsCategoria[i]));
                pp.setId_talla(Integer.parseInt(idsTalla[i]));
                pp.setId_color(Integer.parseInt(idsColor[i]));
                pp.setCantidad(Integer.parseInt(cantidad[i]));
                pp.setPrecio_unitario(Double.parseDouble(precio[i]));
                pp.setTotal(Double.parseDouble(totales[i]));
                pdp.add(pp);
            }
            for (PedidoProducto detalle : pdp) {
                dao.insertDetallePedido(detalle);
            }
            res.sendRedirect("pedido.jsp");
        }else{
            res.sendRedirect("404.jsp");
        }

    }

}