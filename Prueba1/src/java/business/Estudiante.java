package business;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Estudiante 
{
    private int id;
    private String names;
    private String lastnames;
    private int genre;
    private String birth_date;
    private int age;
    private String adress;
    private int phone;
    private String carnet;
    private double average_score;
    private String email;
    private String respuestaError;
    
    private Conexion oConex;

    //GETTER SETTER
    //ID
    public int getId() 
    {
        return id;
    }

    public void setId(int id) 
    {
        this.id = id;
    }
    //NAMES
    public String getNames() 
    {
        return names;
    }

    public void setNames(String names) 
    {
        this.names = names;
    }
    //LASTNAMES
    public String getLastnames() 
    {
        return lastnames;
    }

    public void setLastnames(String lastnames) 
    {
        this.lastnames = lastnames;
    }
    //GENRE
    public int getGenre() 
    {
        return genre;
    }

    public void setGenre(int genre) 
    {
        this.genre = genre;
    }
    //BIRTH DATE
    public String getBirth_date() 
    {
        return birth_date;
    }

    public void setBirth_date(String birth_date) 
    {
        this.birth_date = birth_date;
    }
    //AGE
    public int getAge() 
    {
        return age;
    }

    public void setAge(int age) 
    {
        this.age = age;
    }
    //ADRESS
    public String getAdress() 
    {
        return adress;
    }

    public void setAdress(String adress) 
    {
        this.adress = adress;
    }
    //PHONE
    public int getPhone() 
    {
        return phone;
    }

    public void setPhone(int phone) 
    {
        this.phone = phone;
    }
    //CARNET
    public String getCarnet() 
    {
        return carnet;
    }

    public void setCarnet(String carnet) 
    {
        this.carnet = carnet;
    }
    //AVERAGE SCORE
    public double getAverage_score() 
    {
        return average_score;
    }

    public void setAverage_score(double average_score) 
    {
        this.average_score = average_score;
    }
    //EMAIL
    public String getEmail() 
    {
        return email;
    }
    
    public void setEmail(String email) 
    {
        this.email = email;
    }
    //CODIGO RESPUESTA
    public String getRespuestaError() 
    {
        return respuestaError;
    }

    public void setRespuestaError(String cError) 
    {
        this.respuestaError = cError;
    }
    
   //Constructor sin parámetros
   public Estudiante (){}
    
    //Sin ID (para Crear)
    public Estudiante( String pNames, String pLastnames, int pGenre,String pBirth_date,
            String pAdress, int pAge, int pPhone, String pEmail, String pCarnet, double pAverage_score,Conexion pCon) 
    {
        this.names = pNames;
        this.lastnames = pLastnames;
        this.genre = pGenre;
        this.age = pAge;
        this.adress = pAdress;
        this.birth_date= pBirth_date;
        this.phone = pPhone;
        this.email=pEmail;
        this.carnet = pCarnet;
        this.average_score = pAverage_score;
        this.oConex=pCon;
    }
    
    //Constructor without NULLABLES
    //NO USADO
    public Estudiante( int pId,String pNames, String pLastnames, int pGenre,  String pBirth_date, int pAge, String pAdress,Conexion pCon) 
    {
        this.id = pId;
        this.names = pNames;
        this.lastnames = pLastnames;
        this.genre = pGenre;
        this.age = pAge;
        this.adress = pAdress;
        this.birth_date= pBirth_date;
        this.oConex=pCon;
    }
    
    public Estudiante(Conexion pCon)
    {
        this.oConex=pCon;
    }
    
    //CREATE
    public void guardar() 
    {  
        try 
        {
            if (Validation(this.names, this.lastnames, this.genre, 
                    this.birth_date, this.age, this.adress, this.phone, 
                    this.email, this.carnet, this.average_score)==true) 
               {
                   String orden = "INSERT INTO student (names, lastnames, genre, birth_date, age, adress,"
                   + "phone, email, carnet, average_score) VALUES(?,?,?,?,?,?,?,?,?,?)";
                   
                   PreparedStatement pst = this.oConex.oCon.prepareStatement(orden);
                   pst.setString(1, this.names);
                   pst.setString(2, this.lastnames);
                   pst.setInt(3, this.genre);
                   pst.setString(4, this.birth_date);
                   pst.setInt(5, this.age);
                   pst.setString(6, this.adress);
                   pst.setInt(7, this.phone);
                   pst.setString(8, this.email);
                   pst.setString(9, this.carnet);
                   pst.setDouble(10, this.average_score);
                   
             // execute the preparedstatement
                   pst.execute();
                   pst.close();
               }
        } 
        catch (Exception ee){}
       
        
    }
    //READ
    public ResultSet getTodos() 
    {
        try 
        {
            String orden = "SELECT * FROM student;";
            Statement stmt = this.oConex.oCon.createStatement();
            ResultSet rs= stmt.executeQuery(orden);
            stmt.close();
            return rs;
        } 
        catch (Exception ee) 
        {
            return null;
        }
    }  
    
    //Validacion de Datos
    public boolean Validation(String names, String lastnames, int genre, 
            String b_date, int age, String adress, int phone, String email, 
            String carnet, double average_score)
    {
        if(names.isEmpty())
        {
            this.names="n.e";
        }
        if(lastnames.isEmpty())
        {
            this.lastnames="n.e";
        }
        if(genre!=1&&genre!=2)
        {
            this.respuestaError="Introduzca 1 para Mujer o 2 para Hombre.";
            return false;
        }
        if(age<5)//Es menor de 5 años
        {
            this.respuestaError="La edad del estudiante no es la suficiente.";
            return false;
        }
        if(b_date.isEmpty())
        {
            this.respuestaError="Ingrese una fecha de nacimiento con el formato 'yyyy-MM-dd'.";
            return false;
        }
        if(adress.isEmpty())
        {
            this.adress="n.e";
        }
       if(String.valueOf(phone).length()!=8)//El Telefono introducido debe tener 8 dígitos, debi hacerlo char 
        {
            this.respuestaError="Numero de telefono no valido.";
            return false;
        }
        if(carnet.length()>9||carnet.isEmpty()||carnet.length()<9)
        {
            this.respuestaError="Carnet no valido.";
            return false;
        }
        if(email.isEmpty()||email.length()<=11)//b@gmail.com
        {
            this.respuestaError="Correo electronico no valido.";
            return false;
        }
        
        if(average_score>10)
        {
            this.average_score=10.00;
        }
        else if(average_score<0.00||average_score==0)
        {
            this.average_score=0;
        }
        else if(average_score>0 && average_score<10)
        {
           this.average_score=Math.round(average_score*100.0)/100.0;
        }
        else if(String.valueOf(average_score).isEmpty())
        {
           this.average_score=0.0; 
        }
        return true;
    }
    
  
}
