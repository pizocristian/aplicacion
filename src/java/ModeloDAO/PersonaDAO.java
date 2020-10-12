
package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUD;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CRUD{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Persona p=new Persona();
    
    @Override
    public List listar(String materia) {
        ArrayList<Persona>list=new ArrayList<>();
        if(materia==null){
        String sql="SELECT * FROM `usuario`";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Persona per=new Persona();
                per.setId(Integer. parseInt(rs.getString("id_usuario")));
                per.setNombre(rs.getString("nombre"));
                per.setCorreo(rs.getString("email"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        }else if(materia!=null){
            String sql="SELECT * FROM `usuario` WHERE `producto` LIKE '%"+materia+"%'";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Persona per=new Persona();
                per.setId(Integer. parseInt(rs.getString("id_usuario")));
                per.setNombre(rs.getString("nombre"));
                per.setCorreo(rs.getString("email"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        }
        return list;
    }

    @Override
    public Persona list(int id) {
        String sql="select * from usuario where id_usuario="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setId(Integer. parseInt(rs.getString("id_usuario")));
                p.setNombre(rs.getString("nombre"));
                p.setCorreo(rs.getString("email"));
                
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Persona per) {
       String sql="insert into usuario(nombre, email, password)values('"+per.getNombre()+"','"+per.getCorreo()+"','"+per.getPassword()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Persona per) {
        String sql="update estudiante set nombre='"+per.getNombre()+"'where identificacion="+per.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int identificacion) {
        String sql="delete from estudiante where Identificacion="+identificacion;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
