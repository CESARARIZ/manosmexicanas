package mx.edu.utez.manosmexicanas.model;

import java.util.ArrayList;
import java.util.List;

public class Producto {
    private int id_producto;
    private String nombre;
    private String descripcion;
    private double precio;
    private int stock;
    private String categoria;
    private ArrayList<Talla> tallasDisponibles;
    private ArrayList<ColorProducto> coloresDisponibles;
    private ArrayList<String> imagenes;


    public Producto() {}

    public Producto(int id_producto, String nombre, String descripcion, double precio, int stock, String categoria, ArrayList<Talla> tallasDisponibles, ArrayList<ColorProducto> coloresDisponibles, ArrayList<String> imagenes) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        this.categoria = categoria;
        this.tallasDisponibles = tallasDisponibles;
        this.coloresDisponibles = coloresDisponibles;
        this.imagenes = imagenes;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public ArrayList<Talla> getTallasDisponibles() {
        return tallasDisponibles;
    }

    public void setTallasDisponibles(ArrayList<Talla> tallasDisponibles) {
        this.tallasDisponibles = tallasDisponibles;
    }

    public ArrayList<ColorProducto> getColoresDisponibles() {
        return coloresDisponibles;
    }

    public void setColoresDisponibles(ArrayList<ColorProducto> coloresDisponibles) {
        this.coloresDisponibles = coloresDisponibles;
    }

    public ArrayList<String> getImagenes() {
        return imagenes;
    }

    public void setImagenes(ArrayList<String> imagenes) {
        this.imagenes = imagenes;
    }
}
