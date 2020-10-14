
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
              CarritoDAO madao=new CarritoDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              Carrito carri=(Carrito)madao.list(id);
              %>
            <h1>Agregar cantidad del producto</h1>
            <form action="Controlador">
               
                Referencia: <br>
                <input class="form-control" type="text"  readonly="readonly" name="txtReferencia" value="<%= carri.getReferencia()%>"><br>
                Descripcion: <br>
                <input class="form-control" type="text"  readonly="readonly" name="txtDescripcion" value="<%= carri.getDescripcion()%>"><br>
                Precio: <br>
                <input class="form-control" type="text"  readonly="readonly" name="txtDescripcion" value="<%= carri.getValor_unitario()%>"><br>
                <input class="form-control" type="hidden" name="txtId_carrito" value="<%= carri.getId_carrito()%>">
                Cantidad: <br>
                <input class="form-control" type="number" name="txtCantidad" value="<%= carri.getCantidad()%>"><br>

                <input class="btn btn-success" type="submit" name="accion" value="Actualizar"> 
                
            </form>
          </div>
          
        </div>
    </body>
</html>
