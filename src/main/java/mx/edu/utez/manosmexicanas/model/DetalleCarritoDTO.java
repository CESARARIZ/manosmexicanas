package mx.edu.utez.manosmexicanas.model;

public class DetalleCarritoDTO {
    private int id_detalle_carrito;
    private int id_carrito;
    private String nombre_producto;
    private String nombre_talla;
    private String nombre_color;
    private int cantidad;
    private double total;

    public DetalleCarritoDTO() {}

    public DetalleCarritoDTO(int id_detalle_carrito, int id_carrito, String nombre_producto, String nombre_talla, String nombre_color, int cantidad, double total) {
        this.id_detalle_carrito = id_detalle_carrito;
        this.id_carrito = id_carrito;
        this.nombre_producto = nombre_producto;
        this.nombre_talla = nombre_talla;
        this.nombre_color = nombre_color;
        this.cantidad = cantidad;
        this.total = total;
    }

    public int getId_detalle_carrito() {
        return id_detalle_carrito;
    }

    public void setId_detalle_carrito(int id_detalle_carrito) {
        this.id_detalle_carrito = id_detalle_carrito;
    }

    public int getId_carrito() {
        return id_carrito;
    }

    public void setId_carrito(int id_carrito) {
        this.id_carrito = id_carrito;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
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
}
