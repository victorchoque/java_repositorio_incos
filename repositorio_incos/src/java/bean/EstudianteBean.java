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
import pojo.Estudiante;
import util.SlugGenerator;

/**
 *
 * @author v3ct0r
 */
public class EstudianteBean extends BaseBean {
    public EstudianteBean() throws SQLException{
        super();
    }
    public List<Estudiante> listaEstudiantes () throws Exception{
        return super.obtenerListado(Estudiante.class, 
                "SELECT * FROM estudiantes");
    }
    public Estudiante obtenerEstudiantesPorId(int id) throws Exception{
        return super.obtenerResultadoA(Estudiante.class
                , "SELECT * FROM estudiantes WHERE id=?"
                , id);
    }
    public String insertarEstudiantes(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String nombre;
        */
        
        formulario.put("carreras_sid"     ,request.getParameter("carreras_sid") );
        formulario.put("nombres"          ,request.getParameter("nombres") );
        formulario.put("apellido_paterno" ,request.getParameter("apellido_paterno") );
        formulario.put("apellido_materno" ,request.getParameter("apellido_materno") );

        return super.insertarDatos("estudiantes", formulario);
    }
    public String actualizarEstudiantes(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String nombre;
        */
        formulario.put("carreras_sid"     ,request.getParameter("carreras_sid") );
        formulario.put("nombres"          ,request.getParameter("nombres") );
        formulario.put("apellido_paterno" ,request.getParameter("apellido_paterno") );
        formulario.put("apellido_materno" ,request.getParameter("apellido_materno") );
        
        return super.actualizarDatos("estudiantes", formulario, 
                "id=?", request.getParameter("id"));
        
    }
    /**
     * Lo se suena raro la funcion :)
     * @param id 
     * @param id_usuario / codigo de usuario solo para tablas que tengan auditorias
     * @return
     */
    public String eliminarEstudiantes(int id,int id_usuario){
        int resultado = super.ejecutar("DELETE FROM estudiantes WHERE id=?",id);
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
