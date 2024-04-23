/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author incos
 */
public class VariablesConexion {
    //public static String URL_BBDD="jdbc:postgresql://localhost:5432/examen";
    //public static String DRIVER_BBDD="org.postgresql.Driver";
    //public static String USER_BBDD="postgres";
    //public static String PASS_BBDD="1234";
    
    // ## MYSQL
    public static String URL_BBDD="jdbc:mariadb://localhost:3306/repositorio_incos";
    public static String DRIVER_BBDD="org.mariadb.jdbc.Driver";
    public static String USER_BBDD="root";
    public static String PASS_BBDD="mysql";
            
    //variable que permite establecer conexion
    private Connection connection;
    
    public void inicioConexion()throws SQLException{
        try {
            Class.forName(DRIVER_BBDD);
            connection = DriverManager.getConnection(URL_BBDD, USER_BBDD, PASS_BBDD);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void cerrarConexion(){
        if(null!= connection){
            try {
                connection.close();
                System.out.println("Cerrando conexion");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
    
}
