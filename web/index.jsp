<%-- 
    Document   : index
    Created on : 04-may-2019, 19:36:58
    Author     : samuel
--%>
<%@page session="true" %>
<%@page import="DAO.Operaciones"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Expositor de ropa</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="shortcut icon" href="img/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
    body {
		font-family: 'Varela Round', sans-serif;
	}
        nav {background-color: rgb(233, 236, 239);
        }
	.modal-login {
		width: 320px;
	}
	.modal-login .modal-content {
		border-radius: 1px;
		border: none;
	}
	.modal-login .modal-header {
        position: relative;
		justify-content: center;
        background: #f2f2f2;
	}
    .modal-login .modal-body {
        padding: 30px;
    }
    .modal-login .modal-footer {
        background: #f2f2f2;
    }
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
	}
    .modal-login label {
        font-weight: normal;
        font-size: 13px;
    }
	.modal-login .form-control, .modal-login .btn {
		min-height: 38px;
		border-radius: 2px; 
	}
	.modal-login .hint-text {
		text-align: center;
	}
	.modal-login .close {
        position: absolute;
		top: 15px;
		right: 15px;
	}
    .modal-login .checkbox-inline {
        margin-top: 12px;
    }
    .modal-login input[type="checkbox"]{
        margin-top: 2px;
    }
	.modal-login .btn {
        min-width: 100px;
		background: #3498db;
		border: none;
		line-height: normal;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #248bd0;
	}
	.modal-login .hint-text a {
		color: #999;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
        .text-center {
                font-size: 30px;
        }
</style>
</head>
<body>
    
    <%
          request.setCharacterEncoding("UTF-8");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD", "root", "");
          Statement s = conexion.createStatement(); 
    %>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
            <a class="navbar-brand" href="#"><b>Exposición de ropa</b></a>
                <span class="navbar-toggler-icon"></span>
    </nav>
    <div class="text-center">
            <!-- Button HTML (to Trigger Modal) -->
            <a href="#myModal" class="trigger-btn" data-toggle="modal">Entrar a la página</a>
    </div>

    <!-- Modal HTML -->
    <div id="myModal" class="modal fade">
            <div class="modal-dialog modal-login">
                    <div class="modal-content">
                            <form action="index.jsp" method="post">
                                    <div class="modal-header">				
                                            <h4 class="modal-title">Iniciar sesión</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">				
                                            <div class="form-group">
                                                    <label>Usuario</label>
                                                    <input type="text" name="txtUsuario" class="form-control" required="required">
                                            </div>
                                            <div class="form-group">
                                                    <div class="clearfix">
                                                            <label>Contraseña</label>
                                                    </div>
                                                    <input type="password" name="txtContra" class="form-control" required="required">
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                            <a href="registrar.jsp" class="pull-left text-muted"><small>Regístrate</small></a>
                                            <input type="submit" name="btnIngresar" class="btn btn-primary pull-right" value="Login">
                                    </div>
                            </form>
                        <% 
                            Operaciones op = new Operaciones();
                            if(request.getParameter("btnIngresar")!=null) {
                              String nombre = request.getParameter("txtUsuario");
                              String contra = request.getParameter("txtContra");
                              HttpSession sesion = request.getSession();

                              switch(op.logear(nombre, contra)) {
                                case 1:
                                  session.setAttribute("user", nombre);
                                  session.setAttribute("nivel", "1");
                                  response.sendRedirect("indexmain.jsp");
                                 break;
                                 case 2:
                                  session.setAttribute("user", nombre);
                                  session.setAttribute("nivel", "2");
                                  response.sendRedirect("indexuser.jsp");
                                 break;
                                 default:
                                   out.write("Usuario no existe o contraseña inválida");
                                 break;
                              }
                            }
                            %>
                    </div>
            </div>
    </div>
</body>                             		                            