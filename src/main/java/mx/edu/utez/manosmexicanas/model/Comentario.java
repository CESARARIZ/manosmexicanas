package mx.edu.utez.manosmexicanas.model;

public class Comentario {
    private int id_calificacion;
    private int id_usuario;
    private String nombre_usuario;
    private int id_producto;
    private int calificacion;
    private String comentario;

    public Comentario() {}

    public Comentario(int id_calificacion, int id_usuario, String nombre_usuario, int id_producto, int calificacion, String comentario) {
        this.id_calificacion = id_calificacion;
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.id_producto = id_producto;
        this.calificacion = calificacion;
        this.comentario = comentario;
    }

    public int getId_calificacion() {
        return id_calificacion;
    }

    public void setId_calificacion(int id_calificacion) {
        this.id_calificacion = id_calificacion;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
