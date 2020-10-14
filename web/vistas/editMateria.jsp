
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Materia"%>
<%@page import="Modelo.Carrito"%>
<%@page import="ModeloDAO.CarritoDAO"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Esitar estudiante</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
              <%
              CarritoDAO carri=new CarritoDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              Carrito carr=(Carrito)carri.list(id);
              %>
            <h1>Agregar cantidad del producto</h1>
            <form action="Controlador">
               
                Referencia: <br>
                <input class="form-control" type="text"  readonly="readonly" name="txtReferencia" value="<%= carr.getReferencia()%>"><br>
                Descripcion: <br>
                <input class="form-control" type="text"  readonly="readonly" name="txtDescripcion" value="<%= carr.getDescripcion()%>"><br>
                <input class="form-control" type="hidden" name="txtId" value="<%= carr.getId_producto()%>">
                Cantidad: <br>
                <input class="form-control" type="number" name="txtCantidad"><br>

                <input class="btn btn-success" type="submit" name="accion" value="AgregarCarrito"> 
                
            </form>
          </div>
          
        </div>
    </body>
</html>
