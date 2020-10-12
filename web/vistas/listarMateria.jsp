<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Materia"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.MateriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Productos</title>
                <style>
            .fa-2x {
font-size: 2em;
}
.fa {
position: relative;
display: table-cell;
width: 60px;
height: 36px;
text-align: center;
vertical-align: middle;
font-size:20px;
}


.main-menu:hover,nav.main-menu.expanded {
width:250px;
overflow:visible;
}

.main-menu {
background:#212121;
border-right:1px solid #e5e5e5;
position:absolute;
top:0;
bottom:0;
height:100%;
left:0;
width:60px;
overflow:hidden;
-webkit-transition:width .05s linear;
transition:width .05s linear;
-webkit-transform:translateZ(0) scale(1,1);
z-index:1000;
}

.main-menu>ul {
margin:7px 0;
}

.main-menu li {
position:relative;
display:block;
width:250px;
}

.main-menu li>a {
position:relative;
display:table;
border-collapse:collapse;
border-spacing:0;
color:#999;
 font-family: arial;
font-size: 14px;
text-decoration:none;
-webkit-transform:translateZ(0) scale(1,1);
-webkit-transition:all .1s linear;
transition:all .1s linear;
  
}

.main-menu .nav-icon {
position:relative;
display:table-cell;
width:60px;
height:36px;
text-align:center;
vertical-align:middle;
font-size:18px;
}

.main-menu .nav-text {
position:relative;
display:table-cell;
vertical-align:middle;
width:190px;
  font-family: 'Titillium Web', sans-serif;
}

.main-menu>ul.logout {
position:absolute;
left:0;
bottom:0;
}

.no-touch .scrollable.hover {
overflow-y:hidden;
}

.no-touch .scrollable.hover:hover {
overflow-y:auto;
overflow:visible;
}

a:hover,a:focus {
text-decoration:none;
}

nav {
-webkit-user-select:none;
-moz-user-select:none;
-ms-user-select:none;
-o-user-select:none;
user-select:none;
}

nav ul,nav li {
outline:0;
margin:0;
padding:0;
}
.main-menu li:hover>a,nav.main-menu li.active>a,.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus,.no-touch .dashboard-page nav.dashboard-menu ul li:hover a,.dashboard-page nav.dashboard-menu ul li.active a {
color:#fff;
background-color:#5fa2db;
}
.area {
float: left;
background: #e2e2e2;
width: 100%;
height: 100%;
}
@font-face {
  font-family: 'Titillium Web';
  font-style: normal;
  font-weight: 300;
  src: local('Titillium WebLight'), local('TitilliumWeb-Light'), url(http://themes.googleusercontent.com/static/fonts/titilliumweb/v2/anMUvcNT0H1YN4FII8wpr24bNCNEoFTpS2BTjF6FB5E.woff) format('woff');
}

        </style>
    </head>
    <body>
          <div class="area"></div><nav class="main-menu">
            <ul>
                <li>
                    <a href="Controlador?accion=addMateria">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            Crear producto
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="Controlador?accion=listarMaterias">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            Productos
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="Controlador?accion=listar">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Ver carrito
                        </span>
                    </a>
                    
                </li>
            </ul>

            <ul class="logout">
                <li>
                   <a href="Controlador?accion=volvere">
                         <i class="fa fa-power-off fa-2x"></i>
                        <span class="nav-text">
                            Cerrar sesión
                        </span>
                    </a>
                </li>  
            </ul>
        </nav>
        <div class="container">
            <h1>Productos</h1>
            <input class="form-control" type="text" name="txtCantidad" id="txtCantidad"><br>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Referencia</th>
                        <th class="text-center">Descripción</th>
                        <th class="text-center">Valor Unitario</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    MateriaDAO madao=new MateriaDAO();
                    List<Materia>list=madao.listar();
                    Iterator<Materia>iter=list.iterator();
                    Materia mat=null;
                    while(iter.hasNext()){
                        mat=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= mat.getId()%></td>
                        <td class="text-center"><%= mat.getNom()%></td>
                        <td><%= mat.getPeso()%></td>
                        <td class="text-center">
                            <a class="btn btn-primary" onclick="alerta()" href="Controlador?accion=AgregarCarrito&id=<%= mat.getId()%>">Agregrar al carrito</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminarMaterias&id=<%= mat.getId()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
        <script>
            function alerta(){
                var mensaje;
                var opcion = prompt("Introduzca la cantidad del producto:");
 
                if (opcion == null || opcion == "") {
                    mensaje = "Has cancelado o introducido el nombre vacío";
                } else {
                    mensaje = "Hola " + opcion;
                    document.txtCantidad=opcion;
                  }
            }
        </script>
    </body>
</html>
