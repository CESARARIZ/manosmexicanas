package mx.edu.utez.manosmexicanas.model;

import java.util.ArrayList;
import java.util.List;

public class Producto {
    private int id_producto;
    private String nombre;
    private String descripcion;
    private double precio;
    private int calificacion;
    private List<Talla> tallasDisponibles;
    private List<ColorProducto> coloresDisponibles;
    private List<Imagen> imagenes;
    private int stockTotal;

    public Producto() {}

    public Producto(int id_producto, String nombre, String descripcion, double precio, int calificacion, ArrayList<Talla> tallasDisponibles, ArrayList<ColorProducto> coloresDisponibles, ArrayList <Imagen> imagenes,int stockTotal) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.calificacion = calificacion;
        this.tallasDisponibles = tallasDisponibles;
        this.coloresDisponibles = coloresDisponibles;
        this.imagenes = imagenes;
        this.stockTotal = stockTotal;
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

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public List<Talla> getTallasDisponibles() {
        return tallasDisponibles;
    }

    public void setTallasDisponibles(List<Talla> tallasDisponibles) {
        this.tallasDisponibles = tallasDisponibles;
    }

    public List<ColorProducto> getColoresDisponibles() {
        return coloresDisponibles;
    }

    public void setColoresDisponibles(List<ColorProducto> coloresDisponibles) {
        this.coloresDisponibles = coloresDisponibles;
    }

    public List<Imagen> getImagenes() {
        return imagenes;
    }

    public void setImagenes(List<Imagen> imagenes) {
        this.imagenes = imagenes;
    }

    public int getStockTotal() {
        return stockTotal;
    }

    public void setStockTotal(int stockTotal) {
        this.stockTotal = stockTotal;
    }
}
