package mx.edu.utez.manosmexicanas.model;

import java.io.Serializable;

public class ColorProducto implements Serializable {
    private int id_color;
    private String nombre;

    public ColorProducto() {}

    public ColorProducto(int id_color, String nombre) {
        this.id_color = id_color;
        this.nombre = nombre;
    }

    public int getId_color() {
        return id_color;
    }
    public void setId_color(int id_color) {
        this.id_color = id_color;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
