
<%@page import="Modelo.Materia"%>
<%@page import="ModeloDAO.MateriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Editar Materia</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
              <%
              MateriaDAO madao=new MateriaDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              Materia m=(Materia)madao.list(id);
          %>
            <h1>Modificar Materia</h1>
            <form action="Controlador">
                <a href="Controlador?accion=listarMaterias">Regresar</a><br>
                <br>
                Nombre:<br>
                <input class="form-control" type="text" name="txtNom" value="<%= m.getNom()%>"><br>
                Peso: <br>
                <input class="form-control" type="text" name="txtPeso" value="<%= m.getPeso()%>"><br>
                
                <input type="hidden" name="txtId" value="<%= m.getId()%>">
                <input class="btn btn-success" type="submit" name="accion" value="ActualizarMateria"> 
            </form>
          </div>
          
        </div>
    </body>
</html>
