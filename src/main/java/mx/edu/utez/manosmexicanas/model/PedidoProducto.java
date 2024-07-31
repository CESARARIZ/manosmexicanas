package mx.edu.utez.manosmexicanas.model;

public class PedidoProducto {
    private int id_pedido_producto;
    private int id_pedido;
    private int id_producto;
    private int id_categoria;
    private int id_talla;
    private int id_color;
    private int cantidad;
    private double precio_unitario;
    private double total;
    public PedidoProducto() {}

    public PedidoProducto(int id_pedido_producto, int id_pedido, int id_producto, int id_categoria, int id_talla, int id_color, int cantidad, double precio_unitario, double total) {
        this.id_pedido_producto = id_pedido_producto;
        this.id_pedido = id_pedido;
        this.id_producto = id_producto;
        this.id_categoria = id_categoria;
        this.id_talla = id_talla;
        this.id_color = id_color;
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
        this.total = total;
    }

    public int getId_pedido_producto() {
        return id_pedido_producto;
    }

    public void setId_pedido_producto(int id_pedido_producto) {
        this.id_pedido_producto = id_pedido_producto;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public int getId_talla() {
        return id_talla;
    }

    public void setId_talla(int id_talla) {
        this.id_talla = id_talla;
    }

    public int getId_color() {
        return id_color;
    }

    public void setId_color(int id_color) {
        this.id_color = id_color;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(double precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
