<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de estudiante</title>
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
            form {
                max-width: 500px;
                margin: 0 auto;
                background-color: #f6f0dd;
                padding: 30px;
                border-radius: 10px;
            }
            label {
                display: block;
                margin-bottom: 10px;
                color: #333;
                font-weight: bold;
            }
            input[type="text"] {
                padding: 8px;
                border-radius: 5px;
                border: none;
                width: 100%;
                margin-bottom: 20px;
                font-size: 16px;
                background-color: #f8ba05  ;
            }
            input[type="submit"] {
                background-color: #800000 ;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #0092d6;
            }
            a {
                display: block;
                margin-top: 20px;
                text-align: center;
                color: #333;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        
        <h1>Ingrese datos del estudiante</h1>
        <form action="guardar.jsp" method="POST">
            <a href='listar.jsp' style='color: #a44c4c; text-decoration: underline;'>⇦ Volver a Listado de Datos</a>
            Nombre: <input type="text" id="txtNombre" name="txtNombre"><br><br> 
            Apellido: <input type="text" id="txtApellido" name="txtApellido"><br><br> 
            Género  (1= Mujer 2=Hombre): <input type="text" id="txtGenero" name="txtGenero"><br><br> 
            Fecha de Namiciento  (Formato yyyy-MM-dd o yyyy/MM/dd): <input type="text" id="txtFechaNacimiento" name="txtFechaNacimiento"><br><br> 
            Edad (El estudiante debe ser mayor de 5 años): <input type="text" id="txtEdad" name="txtEdad"><br><br> 
            Dirección: <input type="text" id="txtDireccion" name="txtDireccion"><br><br> 
            Teléfono  (8 dígitos): <input type="text" id="txtTelefono" name="txtTelefono"><br><br> 
            Email: <input type="text" id="txtEmail" name="txtEmail"><br><br> 
            Carnet (9 digitos): <input type="text" id="txtCarnet" name="txtCarnet"><br><br> 
            Promedio (Valores entre 0.0 y 10.00): <input type="text" id="txtPromedio" name="txtPromedio"><br><br> 
            <input type="submit" value="Aceptar"><p>
            <a href='listar.jsp' style='color: #a44c4c; text-decoration: underline;'>⇦ Volver a Listado de Datos</a>
        </form>  
    </body>
</html>
