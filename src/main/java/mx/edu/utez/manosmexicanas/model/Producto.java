package mx.edu.utez.manosmexicanas.model;

import java.util.ArrayList;
import java.util.List;

public class Producto {
    private int id_producto;
    private String nombre_producto;
    private String descripcion;
    private int id_categoria;
    private double precio;
    private int stockDisponible;
    private List<VarianteProducto> variantes;


    public Producto() {}

    public Producto(int id_producto, String nombre_producto, String descripcion, int id_categoria, double precio, int stockDisponible, List<VarianteProducto> variantes) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion = descripcion;
        this.id_categoria = id_categoria;
        this.precio = precio;
        this.stockDisponible = stockDisponible;
        this.variantes = variantes;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStockDisponible() {
        return stockDisponible;
    }

    public void setStockDisponible(int stockDisponible) {
        this.stockDisponible = stockDisponible;
    }

    public List<VarianteProducto> getVariantes() {
        return variantes;
    }

    public void setVariantes(List<VarianteProducto> variantes) {
        this.variantes = variantes;
    }
}
