<%-- 
    Document   : actualizarprenda
    Created on : 27-feb-2019, 20:55:49
    Author     : samuel
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/CRUD", "root", "");
          Statement s = conexion.createStatement();
          String actualizacion = "UPDATE prenda SET nombre='";
          actualizacion += request.getParameter("nombre");
          actualizacion += "', precio='";
          actualizacion += request.getParameter("precio");
          actualizacion += "', fecha='";
          actualizacion += request.getParameter("fecha");
          actualizacion += "', enlace='";
          actualizacion += request.getParameter("enlace");
          actualizacion += "' WHERE id =";
          actualizacion += request.getParameter("id");
          
          s.execute(actualizacion);
          conexion.close();
          
        %>
        
        <script>
            //Redirecciona a la página principal
            location.replace("index.jsp#prenda");
        </script>
    </body>
</html>