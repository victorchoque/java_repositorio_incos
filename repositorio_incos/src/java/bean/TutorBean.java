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
import pojo.Tutor;
import util.SlugGenerator;

/**
 *
 * @author v3ct0r
 */
public class TutorBean extends BaseBean {
    public TutorBean() throws SQLException{
        super();
    }
    public List<Tutor> listaTutores () throws Exception{
        return super.obtenerListado(Tutor.class, 
                "SELECT * FROM tutores");
    }
    public List<Tutor> buscarTutores (String nombre) throws Exception{
        String buscar = nombre+"%";
        return super.obtenerListado(Tutor.class, 
                "SELECT * FROM tutores WHERE "
                +" nombres LIKE ? OR"
                +" apellido_paterno LIKE ? OR"
                +" apellido_materno LIKE ? "
                ,buscar,buscar,buscar
        );
    }
    public Tutor obtenerTutoresPorId(int id) throws Exception{
        return super.obtenerResultadoA(Tutor.class
                , "SELECT * FROM tutores WHERE id=?"
                , id);
    }
    public String insertarTutores(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String nombre;
        */
        
        formulario.put("nombres"          ,request.getParameter("nombres") );
        formulario.put("apellido_paterno" ,request.getParameter("apellido_paterno") );
        formulario.put("apellido_materno" ,request.getParameter("apellido_materno") );
        formulario.put("nivel_educativo"  ,request.getParameter("nivel_educativo") );
        formulario.put("especializacion"  ,request.getParameter("especializacion") );

        return super.insertarDatos("tutores", formulario);
    }
    public String actualizarTutores(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String nombre;
        */

        formulario.put("nombres"          ,request.getParameter("nombres") );
        formulario.put("apellido_paterno" ,request.getParameter("apellido_paterno") );
        formulario.put("apellido_materno" ,request.getParameter("apellido_materno") );
        formulario.put("nivel_educativo"  ,request.getParameter("nivel_educativo") );
        formulario.put("especializacion"  ,request.getParameter("especializacion") );


        return super.actualizarDatos("tutores", formulario, 
                "id=?", request.getParameter("id"));
        
    }

    /**
     * Lo se suena raro la funcion :)
     * @param id 
     * @param id_usuario / codigo de usuario solo para tablas que tengan auditorias
     * @return
     */
    public String eliminarTutores(int id,int id_usuario){
        int resultado = super.ejecutar("DELETE FROM tutores WHERE id=?",id);
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
