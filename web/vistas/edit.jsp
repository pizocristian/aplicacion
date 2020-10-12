
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Materia"%>
<%@page import="ModeloDAO.MateriaDAO"%>
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
              PersonaDAO dao=new PersonaDAO();
              int id=Integer.parseInt((String)request.getAttribute("idper"));
              Persona p=(Persona)dao.list(id);
          %>
            <h1>Modificar Persona</h1>
            <form action="Controlador">
                <a href="Controlador?accion=listar">Regresar</a><br>
                
                <input type="hidden" name="txtIdentificacion" value="<%= p.getIdentificacion()%>"><br>
                
                Nombre: <br>
                <input class="form-control" type="text" name="txtNom" value="<%= p.getNom()%>"><br>
                Materias:<br>
                <select class="form-control" name="txtMateria">
                                        <%
                    MateriaDAO madao=new MateriaDAO();
                    List<Materia>list=madao.listar();
                    Iterator<Materia>iter=list.iterator();
                    Materia mat=null;
                    while(iter.hasNext()){
                        mat=iter.next();
                    
                %>
                    <option value=" <%= mat.getNom()%>"> <%= mat.getNom()%></option>
                        <%}%>
                </select> <br>
                <input class="btn btn-success" type="submit" name="accion" value="Actualizar"> 
                
            </form>
          </div>
          
        </div>
    </body>
</html>
