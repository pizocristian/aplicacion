/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;



import Config.Conexion;
import Intefaces.CRUDMATERIAS;
import Modelo.Materia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MateriaDAO implements CRUDMATERIAS{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Materia m=new Materia();

    @Override
    public List listar() {
        
        ArrayList<Materia>list=new ArrayList<>();
        String sql="select * from producto";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Materia mat=new Materia();
                mat.setId_producto(Integer. parseInt (rs.getString("id_producto")));                
                mat.setReferencia(rs.getString("referencia"));
                mat.setDescripcion(rs.getString("descripcion"));
                mat.setValor_unitario(Integer.parseInt(rs.getString("valor_unitario")));
                list.add(mat);
            }
    
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Materia list(int id) {
        String sql="select * from producto where id_producto="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                m.setId_producto(Integer.parseInt(rs.getString("id_producto")));                
                m.setReferencia(rs.getString("referencia"));
                m.setDescripcion(rs.getString("descripcion"));                       
                
            }
        } catch (Exception e) {
        }
        return m;
    }

    @Override
    public boolean add(Materia mat) {
        String sql="insert into producto(referencia, descripcion, valor_unitario)values('"+mat.getReferencia()+"','"+mat.getDescripcion()+"',"+mat.getValor_unitario()+")";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Materia mat) {
        
        String sql="update materia set nombre='"+mat.getReferencia()+"',peso='"+mat.getDescripcion()+"'where id="+mat.getId_producto();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql="delete from producto where id_producto="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
