/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author cristian
 */
public class Materia {
     int id_producto;
     String referencia;
     String descripcion;
     int valor_unitario;
    
     public Materia() {
    }
     
     public Materia( int id_producto, String referencia, String descripcion, int valor_unitario) {
        this.id_producto = id_producto;
        this.referencia = referencia;
        this.descripcion = descripcion;
        this.valor_unitario = valor_unitario;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getValor_unitario() {
        return valor_unitario;
    }

    public void setValor_unitario(int valor_unitario) {
        this.valor_unitario = valor_unitario;
    }

    
 

    
}
