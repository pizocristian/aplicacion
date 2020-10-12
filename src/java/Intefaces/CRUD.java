
package Intefaces;
import Modelo.Materia;
import Modelo.Persona;
import java.util.List;


public interface CRUD {
    public List listar(String materia);
    public Persona list(int id);
    public boolean add(Persona per);
    public boolean edit(Persona per);
    public boolean eliminar(int id);
    
}
