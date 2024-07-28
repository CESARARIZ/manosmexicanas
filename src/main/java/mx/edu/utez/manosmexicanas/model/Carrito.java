package mx.edu.utez.manosmexicanas.model;

import java.util.Date;

public class Carrito {
    private int id_carrito;
    private int id_usuario;
    private Date fecha;

    public Carrito(){};

    public Carrito(int id_carrito, int id_usuario, Date fecha) {
        this.id_carrito = id_carrito;
        this.id_usuario = id_usuario;
        this.fecha = fecha;
    }

    public int getId_carrito() {
        return id_carrito;
    }

    public void setId_carrito(int id_carrito) {
        this.id_carrito = id_carrito;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}
