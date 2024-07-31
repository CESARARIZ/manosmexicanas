package mx.edu.utez.manosmexicanas.model;

import java.io.Serializable;

public class Imagen implements Serializable {
    private int id_imagen;
    private int id_producto;
    private Byte[] img;

    public Imagen() {}

    public Imagen(int id_imagen, int id_producto, Byte[] img) {
        this.id_imagen = id_imagen;
        this.id_producto = id_producto;
        this.img = img;
    }

    public int getId_imagen() {
        return id_imagen;
    }

    public void setId_imagen(int id_imagen) {
        this.id_imagen = id_imagen;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public Byte[] getImg() {
        return img;
    }

    public void setImg(Byte[] img) {
        this.img = img;
    }
}
