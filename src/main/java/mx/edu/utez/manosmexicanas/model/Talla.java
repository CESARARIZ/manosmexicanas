package mx.edu.utez.manosmexicanas.model;

import java.io.Serializable;

public class Talla implements Serializable {
    private int id_talla;
    private String nombre;

    public Talla() {}

    public Talla(int id_talla, String nombre) {
        this.id_talla = id_talla;
        this.nombre = nombre;
    }

    public int getId_talla() {
        return id_talla;
    }

    public void setId_talla(int id_talla) {
        this.id_talla = id_talla;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
