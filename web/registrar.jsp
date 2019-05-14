<%-- 
    Document   : registrar
    Created on : 06-may-2019, 22:01:19
    Author     : samuel
--%>

<%@page import="DAO.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="shortcut icon" href="img/favicon.ico">
        <title>Regístrate</title>
        <style>
            nav {background-color: rgb(233, 236, 239)}
        </style>
    </head>
    
        <%
          request.setCharacterEncoding("UTF-8");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD", "root", "");
          Statement s = conexion.createStatement();

          String estado = (request.getParameter("id") == null) ? "listado" : "edicion";

        %>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
            <a class="navbar-brand" href="#"><b>Exposición de ropa</b></a>
        </nav>

        <main class="my-form">
            <div class="cotainer">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">Registrar nuevo usuario</div>
                                <div class="card-body">
                                    <form name="my-form" action="registrar.jsp" method="">
                                        <div class="form-group row">
                                            <label for="username" class="col-md-4 col-form-label text-md-right">Nombre de usuario</label>
                                            <div class="col-md-6">
                                                <input type="text" id="usuario" class="form-control" name="username">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="password" class="col-md-4 col-form-label text-md-right">Contraseña</label>
                                            <div class="col-md-6">
                                                <input type="password" id="contra" class="form-control" name="password">
                                            </div>
                                        </div>
                                        <div class="col-md-6 offset-md-4">
                                            <button type="submit" name="btnRegistrar" class="btn btn-primary">
                                                Registrar
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <%
                Operaciones op = new Operaciones();
                if(request.getParameter("btnRegistar")!=null) {
                String nombre = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                HttpSession sesion = request.getSession();
                op.registrar(nombre, contra);
                response.sendRedirect("index.jsp");
                }
                %>
        </main>