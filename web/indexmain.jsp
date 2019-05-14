<%-- 
    Document   : lista
    Created on : 27-feb-2019, 19:40:32
    Author     : samuel
--%>

<%@page session="true" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="shortcut icon" href="img/favicon.ico">
        <title>Expositor de ropa - admin</title>
    </head>
    
        <%
            request.setCharacterEncoding("UTF-8");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD", "root", "");
            Statement s = conexion.createStatement();

            String estado = (request.getParameter("id") == null) ? "listado" : "edicion";
          
            HttpSession sesion = request.getSession();
            String usuario;
            String contra;
            if (sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null) {
              usuario=sesion.getAttribute("user").toString();
              contra= sesion.getAttribute("nivel").toString();
            %>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
            <a class="navbar-brand" href="#"><b>Exposición de ropa</b></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-brand" style="float:right">
                <% 
                    out.print("Logeado como " + usuario+ ", <a href='index.jsp?cerrar=true'>cerrar sesión</a>"); 
                    } else {
                        out.print("<script>location.replace('index.jsp');</script>");
                    }
                    
                    %>
            </div>
        </nav>
        
        <section>
            <div class="jumbotron jumbotron-fluid" id="expo">
                <div class="container">
                    <div class="accordion" id="accordionExample">
                        <%                          ResultSet aux = s.executeQuery("SELECT MAX(id) FROM genero");
                          aux.next();
                          int aux1 = aux.getInt(1);
                          for (int i = 1; i <= aux1; i++) {
                            ResultSet exposiciones = s.executeQuery("SELECT * FROM genero WHERE id='" + i + "'");
                            while (exposiciones.next()) {

                        %>
                        <div class="card">
                            <div class="card-header" id="heading<%=i%>">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse<%=i%>" <%=Integer.parseInt(exposiciones.getString("id")) == 1 ? "aria-expanded=\"true\"" : "aria-expanded=\"false\""%> aria-controls="collapse<%=i%>">
                                        <%=exposiciones.getString("sexo")%>
                                    </button>
                                </h2>
                            </div>

                            <div id="collapse<%=i%>" class="collapse <%=Integer.parseInt(exposiciones.getString("id")) == 1 ? "show" : ""%>" aria-labelledby="heading<%=i%>" data-parent="#accordionExample">
                                <div class="card-body">
                                    <table class="table">
                                        <tr><th></th><th>Nombre</th><th>Precio</th><th>Fecha</th><th>Enlace</th><th></th><th></th></tr>
                                        <form action="<%= estado.equals("listado") ? "nuevaprenda.jsp" : "actualizarprenda.jsp"%>"method="GET">
                                            <tr>
                                                <td>
                                                    <%
                                                      if (estado.equals("edicion")) {
                                                    %>
                                                    <div class="form-group">
                                                        <input
                                                            size="3"
                                                            value="<%= estado.equals("edicion") ? request.getParameter("id") : ""%>"
                                                            hidden
                                                            class="form-control">

                                                    </div>
                                                    <input
                                                        value="<%= estado.equals("edicion") ? request.getParameter("id") : ""%>"
                                                        name="id" 
                                                        type="hidden">

                                                    <%
                                                      }
                                                    %>
                                                </td>
                                                <td>
                                                    <input
                                                        size="3"
                                                        name="gero"
                                                        value="<%= Integer.parseInt(exposiciones.getString("id"))%>"
                                                        hidden
                                                        class="form-control">
                                                    <div class="form-group">
                                                        <input
                                                            value="<%= estado.equals("edicion") ? request.getParameter("nombre") : ""%>"
                                                            name="nombre" 
                                                            type="text" 
                                                            class="form-control"
                                                            required>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <input
                                                            value="<%= estado.equals("edicion") ? request.getParameter("precio") : ""%>"
                                                            name="precio" 
                                                            type="text" 
                                                            class="form-control"
                                                            required>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <input
                                                            value="<%= estado.equals("edicion") ? request.getParameter("fecha") : ""%>"
                                                            name="fecha" 
                                                            type="text" 
                                                            class="form-control"
                                                            required>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <input
                                                            value="<%= estado.equals("edicion") ? request.getParameter("enlace") : ""%>"
                                                            name="enlace" 
                                                            type="text" 
                                                            class="form-control"
                                                            required>
                                                    </div>
                                                </td>
                                                <td>
                                                    <% if (estado.equals("listado")) {
                                                    %>
                                                    <button type="submit" class="btn btn-primary">Añadir</button>
                                                    <%
                                                      }
                                                      if (estado.equals("edicion")) {
                                                    %>
                                                    <a href="actualizarprenda.jsp?id=<%= request.getParameter("id")%>&nombre=<%= request.getParameter("nombre")%>&precio=<%= request.getParameter("precio")%>&fecha=<%= request.getParameter("fecha")%>&enlace=<%= request.getParameter("enlace")%>"><button type="submit" class="btn btn-success">Guardar</button></a></td>
                                                <td><a href="index.jsp#prenda"><button type="button" class="btn btn-dark">Cancelar</button></a>
                                                    <%}%></td>
                                            </tr>
                                        </form>
                                        <%}%>
                                        <%
                                          ResultSet listado = s.executeQuery("SELECT * FROM prenda");
                                          while (listado.next()) {
                                            if (Integer.parseInt(listado.getString("gero")) == i) {
                                        %>
                                        <tr>
                                            <td></td>
                                            <td><%= listado.getString("nombre")%></td>
                                            <td><%= listado.getString("precio")%></td>
                                            <td><%= listado.getString("fecha")%></td>
                                            <td><%= listado.getString("enlace")%></td>
                                            <td><a class="btn btn-warning" href="index.jsp?id=<%= listado.getString("id")%>&gero=<%= listado.getString("gero")%>&nombre=<%= listado.getString("nombre")%>&precio=<%= listado.getString("precio")%>&fecha=<%= listado.getString("fecha")%>&enlace=<%= listado.getString("enlace")%>#prenda" role="button">Modificar</a></td>
                                            <td><a class="btn btn-danger" href="borrarprenda.jsp?id=<%= listado.getString("id")%>" role="button">Eliminar</a></td>
                                        </tr>
                                        <%}
                                          }%>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </section>
        <footer class="page-footer font-small blue">
            <div class="footer-copyright text-center py-3">Realizado por:
                <a href="https://github.com/samuelcardoso21/expositor-de-ropa/"> Samuel Cardoso</a>
            </div>
        </footer>  
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
