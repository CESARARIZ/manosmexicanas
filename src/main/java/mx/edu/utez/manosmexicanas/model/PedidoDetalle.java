package mx.edu.utez.manosmexicanas.model;

public class PedidoDetalle {
    private int id_pedido_detalle;
    private int id_pedido;
    private String nombre_producto;
    private String nombre_categoria;
    private String nombre_talla;
    private String nombre_color;
    private int cantidad;
    private double total;
    private String estado;

    public PedidoDetalle() {}

    public PedidoDetalle(int id_pedido_detalle, int id_pedido, String nombre_producto, String nombre_categoria, String nombre_talla, String nombre_color, int cantidad, double total, String estado) {
        this.id_pedido_detalle = id_pedido_detalle;
        this.id_pedido = id_pedido;
        this.nombre_producto = nombre_producto;
        this.nombre_categoria = nombre_categoria;
        this.nombre_talla = nombre_talla;
        this.nombre_color = nombre_color;
        this.cantidad = cantidad;
        this.total = total;
        this.estado = estado;
    }

    public int getId_pedido_detalle() {
        return id_pedido_detalle;
    }

    public void setId_pedido_detalle(int id_pedido_detalle) {
        this.id_pedido_detalle = id_pedido_detalle;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }

    public String getNombre_talla() {
        return nombre_talla;
    }

    public void setNombre_talla(String nombre_talla) {
        this.nombre_talla = nombre_talla;
    }

    public String getNombre_color() {
        return nombre_color;
    }

    public void setNombre_color(String nombre_color) {
        this.nombre_color = nombre_color;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
