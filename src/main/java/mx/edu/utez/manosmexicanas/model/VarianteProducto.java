package mx.edu.utez.manosmexicanas.model;

public class VarianteProducto {
    private int id_variante;
    private int id_producto;
    private int id_talla;
    private int id_color;
    private int stock;
    private String nombreTalla;
    private String nombreColor;

    public VarianteProducto() {}

    public VarianteProducto(int id_variante, int id_producto, int id_talla, int id_color, int stock, String nombreTalla, String nombreColor) {
        this.id_variante = id_variante;
        this.id_producto = id_producto;
        this.id_talla = id_talla;
        this.id_color = id_color;
        this.stock = stock;
        this.nombreTalla = nombreTalla;
        this.nombreColor = nombreColor;
    }

    public int getId_variante() {
        return id_variante;
    }

    public void setId_variante(int id_variante) {
        this.id_variante = id_variante;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
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

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getNombreTalla() {
        return nombreTalla;
    }

    public void setNombreTalla(String nombreTalla) {
        this.nombreTalla = nombreTalla;
    }

    public String getNombreColor() {
        return nombreColor;
    }

    public void setNombreColor(String nombreColor) {
        this.nombreColor = nombreColor;
    }
}
