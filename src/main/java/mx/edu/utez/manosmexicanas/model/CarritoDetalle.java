package mx.edu.utez.manosmexicanas.model;

import java.io.InputStream;

public class CarritoDetalle {
    private int id_detalle_carrito;
    private int id_carrito;
    private InputStream img;
    private int id_producto;
    private int id_categoria;
    private int id_talla;
    private int id_color;
    private int cantidad;
    private double precio;
    private double total;

    public CarritoDetalle() {};

    public CarritoDetalle(int id_detalle_carrito, int id_carrito, InputStream img, int id_producto, int id_categoria, int id_talla, int id_color, int cantidad, double precio, double total) {
        this.id_detalle_carrito = id_detalle_carrito;
        this.id_carrito = id_carrito;
        this.img = img;
        this.id_producto = id_producto;
        this.id_categoria = id_categoria;
        this.id_talla = id_talla;
        this.id_color = id_color;
        this.cantidad = cantidad;
        this.precio = precio;
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

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
