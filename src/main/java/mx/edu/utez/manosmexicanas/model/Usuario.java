package mx.edu.utez.manosmexicanas.model;

import java.io.Serializable;

public class Usuario implements Serializable {
    private int id_usuario;
    private String nombre_usuario;
    private String correo;
    private String telefono;
    private String direccion;
    private String contra;
    private String estado;
    private String tipo_usuario;
    private String codigo;

    public Usuario() {
    }

    public Usuario (int id_usuario, String nombre_usuario, String correo, String telefono, String direccion, String contra, String estado, String tipo_usuario, String codigo) {
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.contra = contra;
        this.estado = estado;
        this.tipo_usuario = tipo_usuario;
        this.codigo = codigo;
    }

    public int getId() {
        return id_usuario;
    }

    public void setId(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
}
