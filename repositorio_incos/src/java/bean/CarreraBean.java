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
import pojo.Carrera;
import util.SlugGenerator;

/**
 *
 * @author v3ct0r
 */
public class CarreraBean extends BaseBean {
    public CarreraBean() throws SQLException{
        super();
    }
    public List<Carrera> listaCarreras () throws Exception{
        return super.obtenerListado(Carrera.class, 
                "SELECT * FROM carreras");
    }
    public Carrera obtenerCarrerasPorSid(String sid) throws Exception{
        return super.obtenerResultadoA(Carrera.class
                , "SELECT * FROM carreras WHERE sid=?"
                , sid);
    }
    public String insertarCarreras(HttpServletRequest request){        
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String nombre;
        */
        
        String sid = SlugGenerator.toSlug(request.getParameter("nombre") );
        formulario.put("sid", sid );
        formulario.put("nombre", request.getParameter("nombre") );

        return super.insertarDatos("carreras", formulario);
    }
    /**
     * 
     * @param sid 
     * @param id_usuario / codigo de usuario solo para tablas que tengan auditorias
     * @return
     */
    public String eliminarCarreras(String sid,int id_usuario){
        int resultado = super.ejecutar("DELETE FROM carreras WHERE sid=?",sid);
        switch (resultado) {
            case -1:
                return "Error con la base de datos";                
            case 0:
                return "No se encontraron registros para eliminar";        
            default:
                return " "+String.valueOf(resultado)+" registros Eliminados";
        }
        //return super.ejecutar("proyectos", formulario,"id=?",id);
    }
    public String actualizarCarreras(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String nombre;
        */
        String sid = SlugGenerator.toSlug(request.getParameter("nombre") );
        formulario.put("sid", sid );
        formulario.put("nombre", request.getParameter("nombre") );
        
        return super.actualizarDatos("carreras", formulario, 
                "sid=?", request.getParameter("sid"));
        
    }
}
