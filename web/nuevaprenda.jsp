<%-- 
    Document   : nuevaprenda
    Created on : 27-feb-2019, 20:26:21
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
          String insercion = "INSERT INTO prenda (gero, nombre, precio, fecha, enlace) "; 
          insercion += "VALUES ('";
          insercion += request.getParameter("gero") + "', '";
          insercion += request.getParameter("nombre") + "', '";
          insercion += request.getParameter("precio") + "', '";
          insercion += request.getParameter("fecha") + "', '";
          insercion += request.getParameter("enlace") + "')";
          
          
          s.execute(insercion);
          conexion.close();
          
        %>
        <script>
            //Redirecciona a la página principal
            location.replace("index.jsp#prenda");
        </script>
    </body>
</html>