package mx.edu.utez.manosmexicanas.model;

import java.io.InputStream;

public class ProductoColor {
    private int id_producto;
    private int id_producto_color;
    private InputStream img;
    public ProductoColor() {}
    public ProductoColor(int id_producto, int id_producto_color, InputStream img) {
        this.id_producto = id_producto;
        this.id_producto_color = id_producto_color;
        this.img = img;
    }
    public int getId_producto() {
        return id_producto;
    }
    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_producto_color() {
        return id_producto_color;
    }
    public void setId_producto_color(int id_producto_color) {
        this.id_producto_color = id_producto_color;
    }
    public InputStream getImg() {
        return img;
    }
    public void setImg(InputStream img) {
        this.img = img;
    }
}
