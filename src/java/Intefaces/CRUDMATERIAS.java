/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Intefaces;

import Modelo.Materia;
import java.util.List;

/**
 *
 * @author cristian
 */
public interface CRUDMATERIAS {
    public List listar();
    public Materia list(int id);
    public boolean add(Materia mat);
    public boolean edit(Materia mat);
    public boolean eliminar(int id);
    
}
