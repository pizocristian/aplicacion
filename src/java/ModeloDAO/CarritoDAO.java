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
    Carrito carri=new Carrito();
    @Override
    public List listar() {
        ArrayList<Carrito>list=new ArrayList<>();
        //String sql="SELECT producto.id_producto AS id_producto, producto.referencia AS referencia, producto.descripcion AS descripcion, producto.valor_unitario AS valor_unitario FROM `producto` INNER JOIN carrito ON producto.id_producto = carrito.id_producto1";
        String sql="SELECT producto.id_producto AS id_producto, producto.referencia AS referencia, producto.descripcion AS descripcion, producto.valor_unitario AS valor_unitario, cantidad, id_carrito, cantidad*valor_unitario AS total FROM `carrito` INNER JOIN producto ON carrito.id_producto1 = producto.id_producto ";
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Carrito carri=new Carrito();              
                carri.setId_producto(Integer. parseInt (rs.getString("id_producto")));                
                carri.setReferencia(rs.getString("referencia"));
                carri.setDescripcion(rs.getString("descripcion"));
                carri.setValor_unitario(Integer.parseInt(rs.getString("valor_unitario")));
                carri.setCantidad(Integer.parseInt(rs.getString("cantidad")));
                carri.setId_carrito(Integer.parseInt(rs.getString("id_carrito")));
                carri.setTotal(Integer.parseInt(rs.getString("total")));
                list.add(carri);
            }
    
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Carrito list(int id) {
        String sql="SELECT producto.id_producto AS id_producto, producto.referencia AS referencia, producto.descripcion AS descripcion, producto.valor_unitario AS valor_unitario, cantidad, id_carrito FROM `carrito` INNER JOIN producto ON carrito.id_producto1 = producto.id_producto where id_carrito="+id;
        
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                carri.setId_carrito(Integer.parseInt(rs.getString("id_carrito")));
                carri.setReferencia(rs.getString("referencia"));
                carri.setDescripcion(rs.getString("descripcion"));
                carri.setValor_unitario(Integer.parseInt(rs.getString("valor_unitario")));
                carri.setCantidad(Integer.parseInt(rs.getString("cantidad")));                  
                
            }
        } catch (Exception e) {
        }
        return carri;
    }

    @Override
    public boolean add(Carrito carri) {
        String sql="INSERT INTO `carrito` (`id_usuario1`, `id_producto1`, `cantidad`) VALUES ("+carri.getId_usuario()+", "+carri.getId_producto()+", "+carri.getCantidad()+")";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Carrito carri) {
   String sql="UPDATE `carrito` SET `cantidad`='"+carri.getCantidad()+"' WHERE `carrito`.`id_carrito`="+carri.getId_carrito();
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
        String sql="delete from carrito where id_carrito="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
