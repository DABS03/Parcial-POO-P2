<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="business.Conexion"%>
<%@page import="business.Estudiante"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Registros</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #800000;
            }
            h1 {
                text-align: center;
                color: #f8ba05;
                margin-top: 30px;
            }
            table {
                max-width: 800px;
                margin: 0 auto;
                background-color: #f6f0dd;
                padding: 30px;
                border-radius: 10px;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #800000;
                padding: 8px;
                text-align: left;
                font-size: 16px;
            }
            td {
                background-color: #b46464;
                color: #fff;
                font-weight: bold;
            }
            a {
                display: block;
                margin-top: 20px;
                text-align: center;
                color: #333;
                text-decoration: none;
                font-weight: bold;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Listado de Estudiantes</h1>
        <%
          try
          {
            Conexion oCon = new Conexion("diego","12345");
            Estudiante oEst = new Estudiante(oCon);
            ResultSet rs= oEst.getTodos();
            out.print("<a href='formulario.jsp' style='color: #f6f0dd; ; text-decoration: underline;'>Insertar nuevo registro ⇨</a>");
            out.print(" <br>");
            out.print("<table>");
            out.print("<tr><td>ID</td>"
            + "<td>NOMBRES</td>"
            + "<td>APELLIDOS</td>"
            + "<td>GENERO</th>"
            + "<td>FECHA NACIMIENTO</td>"
            + "<td>EDAD</td>"
            + "<td>DIRECCION</td>"
            + "<td>TELEFONO</td>"
            + "<td>EMAIL</td>"
            + "<td>CARNET</td>"
            + "<td>PROMEDIO</td></tr>");
            while(rs.next())
            {
               out.print("<tr><th>"+
                 rs.getObject(1).toString()+
                 "</th><th>"+
                 rs.getObject(2).toString()+
                 "</th><th>"+
                 rs.getObject(3).toString()+
                 "</th><th>"+
                 rs.getObject(4).toString()+
                 "</th><th>"+
                 rs.getObject(5).toString()+
                 "</th><th>"+
                 rs.getObject(6).toString()+
                 "</th><th>"+
                 rs.getObject(7).toString()+
                 "</th><th>"+
                 rs.getObject(8).toString()+
                 "</th><th>"+
                 rs.getObject(9).toString()+
                 "</th><th>"+
                 rs.getObject(10).toString()+
                 "</th><th>"+
                 rs.getObject(11).toString()+
                 "</th></th>");    
            }
            out.print("</table>");
          }
          catch(Exception ee){}
        %>
    </body>
</html>