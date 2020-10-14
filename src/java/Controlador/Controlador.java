
package Controlador;

import Modelo.Carrito;
import Modelo.Materia;
import Modelo.Persona;
import ModeloDAO.CarritoDAO;
import ModeloDAO.MateriaDAO;
import ModeloDAO.PersonaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class Controlador extends HttpServlet {
    
    String inicio="index.jsp";
    String listar="vistas/listar.jsp";
    String listarMaterias="vistas/listarMateria.jsp";
    String add="vistas/add.jsp";
    String addmateria="vistas/addMateria.jsp";
    String edit="vistas/edit.jsp";
    String editMateria="vistas/editMateria.jsp";
    String buscar="vistas/buscar.jsp";
    String iniciar="vistas/inicio.jsp";
    String carrito="vistas/carrito.jsp";
    String cantidad="vistas/cantidad.jsp";
   
    Persona p=new Persona();
    Materia m=new Materia();
    Carrito c=new Carrito();
    PersonaDAO dao=new PersonaDAO();
    MateriaDAO madao=new MateriaDAO();
    CarritoDAO carridao=new CarritoDAO();
    int id;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;            
        }else if(action.equalsIgnoreCase("volver")){
            System.out.println ("cantidad");
            acceso=inicio;
        }else if(action.equalsIgnoreCase("volvere")){
            acceso=iniciar;
        }else if(action.equalsIgnoreCase("listarMaterias")){
            acceso=listarMaterias;
        }else if(action.equalsIgnoreCase("buscar")){
            acceso=buscar;
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("addMateria")){
            acceso=addmateria;            
        }else if(action.equalsIgnoreCase("carrito")){
            acceso=carrito;
        }else if(action.equalsIgnoreCase("producto")){
            acceso=cantidad;
        }
        else if(action.equalsIgnoreCase("Filtrar")){
          String materia=request.getParameter("txtMateria");
          
           //m.setNom(materia);
           dao.listar(materia);
           acceso=buscar;
           
        }else if(action.equalsIgnoreCase("AgregarProducto")){
            
            String referencia=request.getParameter("txtReferencia");
            String descripcion=request.getParameter("txtDescripcion");            
            int valor_Unidad=Integer.parseInt(request.getParameter("txtValorUnidad"));
            m.setReferencia(referencia);
            m.setDescripcion(descripcion);
            m.setValor_unitario(valor_Unidad);
            madao.add(m);
            acceso=addmateria;
        }
        else if(action.equalsIgnoreCase("Registrar")){
            String nombre=request.getParameter("txtNombre");
            String email=request.getParameter("txtEmail");
            String password=request.getParameter("txtPassword");
            
            p.setNombre(nombre);
            p.setCorreo(email);
            p.setPassword(password);
            dao.add(p);
            acceso=iniciar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idper",request.getParameter("id"));
            acceso=edit;
        }else if(action.equalsIgnoreCase("AgregarCantidad")){ 
            request.setAttribute("idper",request.getParameter("id"));
            //String cantidad=request.getParameter("txtCantidad");
            //System.out.println (cantidad);
            //int id_producto= Integer.parseInt(request.getParameter("id")); 
            //acceso=listarMaterias;
            acceso=cantidad;
        }
        else if(action.equalsIgnoreCase("AgregarCarrito")){            
            int id_producto=Integer.parseInt(request.getParameter("txtId"));
            System.out.println (id_producto);
            int cantidad=Integer.parseInt(request.getParameter("txtCantidad"));
            System.out.println (cantidad);
            //int id_producto= Integer.parseInt(request.getParameter("id")); 
            //System.out.println (id);
            c.setId_producto(id_producto);
            c.setId_usuario(1);
            c.setCantidad(cantidad);
            carridao.add(c);
            //acceso=listarMaterias;
            acceso=listarMaterias;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            int cantidad=Integer.parseInt(request.getParameter("txtCantidad"));
            int id_carrito=Integer.parseInt(request.getParameter("txtId_carrito")); 
            c.setId_carrito(id_carrito);
            c.setCantidad(cantidad);
            carridao.edit(c);
            acceso=listar;
        }else if(action.equalsIgnoreCase("ActualizarMateria")){
            int id_producto=Integer.parseInt(request.getParameter("txtId"));
            String referencia=request.getParameter("txtNom");
            String descripcion=request.getParameter("txtPeso");
            int valor_unidad=Integer.parseInt(request.getParameter("txtPeso"));
            m.setId_producto(id_producto);
            m.setReferencia(referencia);
            m.setDescripcion(descripcion);  
            m.setValor_unitario(valor_unidad);
            madao.edit(m);
            acceso=listarMaterias;
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            c.setId_carrito(id);
            carridao.eliminar(id);
            acceso=listar;
        }else if(action.equalsIgnoreCase("eliminarMaterias")){
           // JOptionPane.showMessageDialog(null, "Hello World");
            id=Integer.parseInt(request.getParameter("id"));
            m.setId_producto(id);
            madao.eliminar(id);
            acceso=listarMaterias;
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
