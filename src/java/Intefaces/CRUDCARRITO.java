/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Intefaces;

import Modelo.Carrito;
import java.util.List;

/**
 *
 * @author cristian
 */
public interface CRUDCARRITO {
    public List listar();
    public Carrito list(int id);
    public boolean add(Carrito mat);
    public boolean edit(Carrito mat);
    public boolean eliminar(String id);
    
}
