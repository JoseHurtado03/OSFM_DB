
package osfm;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class ConnectionDB {
    
    Connection conex = null;
    String user = "postgres";
    String password = "malejojo";
    String DBname = "OSFM_BD";
    String IPAddress = "localhost";
    String port = "5432";
    
    String cadena = "jdbc:postgresql://"+IPAddress+":"+port+"/"+DBname;
    
    public Connection initConnection(){
        try{
            Class.forName("org.postgresql.Driver");
            conex = DriverManager.getConnection(cadena, user, password);
//            JOptionPane.showMessageDialog(null, "Conexión con la base de datos exitosa");
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "ERROR al conectar con la base de datos");
        }
        return conex;
    }
}
