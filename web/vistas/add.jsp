<%-- 
    Document   : add
    Created on : 18/09/2020, 19:58:16
    Author     : Cristian
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Materia"%>
<%@page import="ModeloDAO.MateriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Estudiante</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Usuario</h1>
                <form action="Controlador">
                    <a href="Controlador?accion=volver">Regresar</a><br>
                    <br>
                    Nombre:<br>
                    <input class="form-control" type="text" name="txtNombre"><br>
                    Correo: <br>
                    <input class="form-control" type="text" name="txtEmail"><br> 
                    Contraseña: <br>
                    <input class="form-control" type="password" name="txtPassword"><br>
                    
                                <table>
                <tr class="color">
                <td>
            
                </td>
                </tr> 
                                </table><br>
                    <input class="btn btn-primary" type="submit" name="accion" value="Registrar">
                   
                </form>
            </div>


        </div>
    </body>
</html>
