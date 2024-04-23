/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import conexion.VariablesConexion;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author incos
 */
public class AtencionBean {
    private Connection conexion;
    private VariablesConexion variables;
    private PreparedStatement listarAtencionesPorMascotaId;
    private PreparedStatement insertarAtencion;
    
    public AtencionBean() throws SQLException{
        variables = new VariablesConexion();
        variables.inicioConexion();
        conexion = variables.getConnection();
    }
    @PreDestroy
    public void cerraandoConexion(){
        variables.cerrarConexion();              
    }
    
    public String insertarAtencion(HttpServletRequest request){
        //StringBuilder salida = new StringBuilder();
        String mensaje ="Error No se pudo registrar";
        String procedimiento,medicacion,laboratorio,fechaatencion,costoStr;
        float costo = 0;
        int idMascota = 0;
        fechaatencion    = request.getParameter("fechaatencion");
        
        StringBuilder query = new StringBuilder();
        try {
            query.append("INSERT INTO atencion( " +
"           id_atencion, id_mascota, procedimiento, laboratorio,medicacion, fecha_atencion, costo) " +
"    VALUES ( nextval('sec_pro'), ?, ?, ?, ?, ?,?) ");
            insertarAtencion = conexion.prepareStatement(query.toString());
            idMascota = Integer.parseInt( request.getParameter("id_mascota") ) ;
            procedimiento    = request.getParameter("procedimiento");
            laboratorio    = request.getParameter("laboratorio");
            medicacion    = request.getParameter("medicacion");
            fechaatencion     = request.getParameter("fechaatencion");
            costoStr = request.getParameter("costo");
            // parametros ordeñados 
            insertarAtencion.setInt(1, idMascota);
            insertarAtencion.setString(2, procedimiento);
            insertarAtencion.setString(3, laboratorio);
            insertarAtencion.setString(4, medicacion);
            
            
            
            
            insertarAtencion.setDate(5, Date.valueOf( fechaatencion));
            BigDecimal costoBig = new BigDecimal(costoStr);
            costoBig.setScale(4,2);
            
            insertarAtencion.setBigDecimal(6,costoBig); 
            // ejecutamos consuta
            int nroRegistro = insertarAtencion.executeUpdate();
            if(nroRegistro>0){
                mensaje = "datos registrados correctamente";
            }
            
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        return mensaje;
    }
    
    public String listarAtenciones(int idMascota) throws ParseException{
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        //query.append("SELECT id_propietario, nro_cedula, paterno_prop, materno_prop, nombre_prop, direccion, telefono");
        query.append(" SELECT id_mascota, procedimiento,medicacion,laboratorio,fecha_atencion,costo \n" +
"FROM atencion "+
"WHERE id_mascota=? ");
        try {
            listarAtencionesPorMascotaId = conexion.prepareStatement(query.toString());
            listarAtencionesPorMascotaId.setInt(1, idMascota);
            ResultSet resultado = listarAtencionesPorMascotaId.executeQuery();
            while (resultado.next()) {
                salidaTabla.append("<tr>");
                for (int col = 1; col <= 6; col++) {
                    salidaTabla.append("<td><pre>");                    
                    salidaTabla.append(resultado.getString(col));
                    salidaTabla.append("</pre></td>");  
                }
                 

                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        return salidaTabla.toString();
    }
}
