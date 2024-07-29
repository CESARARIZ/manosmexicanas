package mx.edu.utez.manosmexicanas.model;

import java.util.ArrayList;
import java.util.List;

public class Producto {
    private int id_producto;
    private String nombre_producto;
    private String descripcion;
    private Categoria categoria; // Cambiar de String a Categoria
    private double precio;
    private int stockDisponible;
    private List<Talla> tallas;
    private List<ColorProducto> colores;

    public Producto() {}

    public Producto(int id_producto, String nombre_producto, String descripcion, Categoria categoria, double precio, int stockDisponible, List<Talla> tallas, List<ColorProducto> colores) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion = descripcion;
        this.categoria = categoria;
        this.precio = precio;
        this.stockDisponible = stockDisponible;
        this.tallas = tallas;
        this.colores = colores;
    }

    // Getters y Setters
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

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
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

    public List<Talla> getTallas() {
        return tallas;
    }

    public void setTallas(List<Talla> tallas) {
        this.tallas = tallas;
    }

    public List<ColorProducto> getColores() {
        return colores;
    }

    public void setColores(List<ColorProducto> colores) {
        this.colores = colores;
    }
}

