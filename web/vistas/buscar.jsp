<%@page import="Modelo.Materia"%>
<%@page import="ModeloDAO.MateriaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Persona"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Listado de estudiantes</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-4">
            <h1>Estudiantes</h1>
            <form action="Controlador">
            <a class="btn btn-primary" href="Controlador?accion=volver">Volver</a><br>
            Materias:<br>
            <select class="form-control col-lg-2 " name="txtMateria">
                                        <%
                   MateriaDAO madao=new MateriaDAO();
                    List<Materia>lista=madao.listar();
                    Iterator<Materia>itera=lista.iterator();
                    Materia mat=null;
                    while(itera.hasNext()){
                        mat=itera.next();
                    
                %>
                    <option value=" <%= mat.getNom()%>"> <%= mat.getNom()%></option>
                        <%}%>
                    <input class="btn btn-primary" type="submit" name="accion" value="Filtrar">
                </select>
                        
                        <br>
                        </form>
                </div>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center"># IDENTIFICACION</th>
                        <th class="text-center">NOMBRE</th>
                        <th class="text-center">MATERIA</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    PersonaDAO dao=new PersonaDAO();
                    String materia=request.getParameter("txtMateria");
                    List<Persona>list=dao.listar(materia);
                    Iterator<Persona>iter=list.iterator();
                    Persona per=null;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= per.getIdentificacion()%></td>
                        <td class="text-center"><%= per.getNom()%></td>
                        <td><%= per.getDni()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= per.getIdentificacion()%>">Editar</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= per.getIdentificacion()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
