/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUDCARRITO;
import Modelo.Carrito;
import Modelo.Materia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class CarritoDAO implements CRUDCARRITO{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Carrito m=new Carrito();

    @Override
    public List listar() {
        ArrayList<Materia>list=new ArrayList<>();
        String sql="SELECT producto.id_producto AS id_producto, producto.referencia AS referencia, producto.descripcion AS descripcion, producto.valor_unitario AS valor_unitario FROM `producto` INNER JOIN carrito ON producto.id_producto = carrito.id_producto1";
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
    public Carrito list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Carrito mat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(Carrito mat) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
