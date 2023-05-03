<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="business.Conexion"%>
<%@page import="business.Estudiante"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar informacion</title>
    </head>
    <body>
        <%
          try
          {
            //Eecibir los datos desde el cliente
            String nombre= request.getParameter("txtNombre");
            String apellido= request.getParameter("txtApellido");
            String genero= request.getParameter("txtGenero");
            String fechaNacimiento= request.getParameter("txtFechaNacimiento");
            String edad= request.getParameter("txtEdad");
            String direccion= request.getParameter("txtDireccion");
            String telefono= request.getParameter("txtTelefono");
            String email= request.getParameter("txtEmail");
            String carnet= request.getParameter("txtCarnet");
            String promedio= request.getParameter("txtPromedio");
            
            //Conversion a datos de tipo numerico
            int dGenero;
            if(genero.isEmpty())
            {
                dGenero= 1;
            }
            else
            {
                dGenero= Integer.parseInt(genero);
            }
            
            int dEdad;
            if(edad.isEmpty())
            {
                dEdad= 0;
            }
            else
            {
                dEdad= Integer.parseInt(edad);
            }
            
            int dTelefono;
            if(telefono.isEmpty())
            {
                dTelefono= 0;
            }
            else
            {
                dTelefono= Integer.parseInt(telefono);
            }
            
            double dPromedio;
            
            if(promedio.isEmpty())
            {
                dPromedio= 0;
            }
            else
            {
                dPromedio= Double.parseDouble(promedio);
            }
            
            
            // inicializar la conexion
            Conexion oCon = new Conexion("diego","12345"); 
            Estudiante oEst = new Estudiante(nombre,apellido,dGenero,fechaNacimiento,
            direccion,dEdad,dTelefono,email,carnet,dPromedio,oCon);
            
            String respuesta="<h1>Registro guardado correctamente.</h1><p>";
            
            if(oEst.Validation(nombre, apellido, dGenero, fechaNacimiento, dEdad, direccion, dTelefono, email, carnet, dPromedio)==false)
               {
                   respuesta=oEst.getRespuestaError(); //Recoge la respuesta en caso de error en la validacion
                   out.print(respuesta);
                   out.print("<a href='formulario.jsp'>Regresar al formulario</a>");
               }
            else
               {
               //guardar la informacion en la BD
                    oEst.guardar();   
            
               //alertar al usuario
                 out.print(respuesta); 
                 out.print("<a href='listar.jsp'>Consultar todos los registros</a>");
                }
          }
          catch(Exception ee)
          {
             out.print("Ha ocurrido un error. Contacte al Administrador.");
             out.print("<a href='formulario.jsp'>Regresar al formulario</a>");
          }
        %>
    </body>
</html>
