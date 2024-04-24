/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import pojo.Tipo_proyecto;

/**
 *
 * @author v3ct0r
 */
public class Tipo_proyectoBean extends BaseBean {
    public Tipo_proyectoBean() throws SQLException{
        super();
    }
    public List<Tipo_proyecto> listaTipo_proyectos () throws Exception{
        return super.obtenerListado(Tipo_proyecto.class, 
                "SELECT * FROM tipo_proyectos");
    }
    public Tipo_proyecto obtenerTipo_proyectosPorId(int id) throws Exception{
        return super.obtenerResultadoA(Tipo_proyecto.class
                , "SELECT * FROM tipo_proyectos WHERE id=?"
                , id);
    }
    public String insertarTipo_proyectos(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String tipo;
        */
        formulario.put("tipo", request.getParameter("tipo") );

        return super.insertarDatos("tipo_proyectos", formulario);
    }
    public String actualizarTipo_proyectos(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String tipo;
        */

        formulario.put("tipo", request.getParameter("tipo") );
        return super.actualizarDatos("tipo_proyectos", formulario, 
                "id=?", request.getParameter("id"));
        
    }
    /**
     * 
     * @param id 
     * @param id_usuario / codigo de usuario solo para tablas que tengan auditorias
     * @return
     */
    public String eliminarTipo_proyectos(int id,int id_usuario){
        int resultado = super.ejecutar("DELETE FROM tipo_proyectos WHERE id=?",id);
        switch (resultado) {
            case -1:
                return "Error con la base de datos";                
            case 0:
                return "No se encontraron registros para eliminar";        
            default:
                return " "+String.valueOf(resultado)+" registros Eliminados";
        }        
    }
}
