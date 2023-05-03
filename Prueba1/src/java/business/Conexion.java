package business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion 
{
    public Connection oCon;
    
    public Conexion(String usuario, String clave)
    {
        try
        {
           Class.forName("org.mariadb.jdbc.Driver") ;
           oCon = DriverManager.getConnection("jdbc:mariadb://localhost:3307/TareaEvaluadaP2", usuario, clave) ;
        }
        catch(SQLException | ClassNotFoundException e) 
            {
                //Exception report
                System.out.println(e.getMessage());
            }     
    }

}
