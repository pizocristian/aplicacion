<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Materia"%>
<%@page import="Modelo.Carrito"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.CarritoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Listado de estudiantes</title>
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
                    <a href="Controlador?accion=addProducto">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            Crear producto
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="Controlador?accion=listarProductos">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            Productos
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="Controlador?accion=listarCarrito">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            Ver carrito
                        </span>
                    </a>
                    
                </li>
            </ul>

            <ul class="logout">
                <li>
                   <a href="Controlador?accion=inicio">
                         <i class="fa fa-power-off fa-2x"></i>
                        <span class="nav-text">
                            Cerrar sesión
                        </span>
                    </a>
                </li>  
            </ul>
        </nav>
        <div class="container">
            <h1>Detalles del Carrito</h1>
            <br>
            <a class="btn btn-danger" href="Controlador?accion=eliminarTodo">Limpiar Carrito</a>
            <a class="btn btn-success" onclick='alert("Gracias por tu compra")'href="Controlador?accion=eliminarTodo">Realizar Compra</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">REFERENCIA</th>
                        <th class="text-center">DESCRICION</th>
                        <th class="text-center">CANTIDAD</th>
                        
                        <th class="text-center">VALOR TOTAL</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    CarritoDAO dao=new CarritoDAO();
                    List<Carrito>list=dao.listar();
                    Iterator<Carrito>iter=list.iterator();
                    Carrito carri=null;
                    while(iter.hasNext()){
                        carri=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= carri.getReferencia()%></td>
                        <td class="text-center"><%= carri.getDescripcion()%></td>
                        
                        <td><%= carri.getCantidad()%></td>
                        <td><%= carri.getTotal()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= carri.getId_carrito()%>">Editar</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= carri.getId_carrito()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>
