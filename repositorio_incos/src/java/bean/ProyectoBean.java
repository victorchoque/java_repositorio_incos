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
import pojo.Proyecto;

/**
 *
 * @author v3ct0r
 */
public class ProyectoBean extends BaseBean {
    public ProyectoBean() throws SQLException{
        super();
    }
    public List<Proyecto> listaProyectos () throws Exception{
        return super.obtenerListado(Proyecto.class, 
                "SELECT * FROM proyectos");
    }
    public Proyecto obtenerProyectosPorId(int id) throws Exception{
        return super.obtenerResultadoA(Proyecto.class
                , "SELECT * FROM proyectos WHERE id=?"
                , id);
    }
    public String insertarProyectos(HttpServletRequest request,byte[] pdf){
        // carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa , descripcion, resumen, pdf, activo, auditoria_administrativos_id, auditoria_fecha_hora, auditoria_accion, auditoria_descripcion
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String tipo;
        */
        formulario.put("carreras_sid"     , request.getParameter("carreras_sid") );
        formulario.put("tipo_proyectos_id", Integer.parseInt( request.getParameter("tipo_proyectos_id") ) );
        formulario.put("tutores_id"       , Integer.parseInt( request.getParameter("tutores_id") ) );
        formulario.put("estudiantes_id"   , Integer.parseInt( request.getParameter("estudiantes_id") ) );
        formulario.put("titulo"           , request.getParameter("titulo") );
        formulario.put("anio_defensa"     , Integer.parseInt( request.getParameter("anio_defensa") ) );
        formulario.put("descripcion"      , request.getParameter("descripcion") );
        formulario.put("resumen"          , request.getParameter("resumen") );
        //formulario.put("pdf"              , request.getParameter("pdf") );
        formulario.put("pdf"              , pdf );
        //formulario.put("activo"           , Boolean.parseBoolean( request.getParameter("activo") ) );
        formulario.put("auditoria_administrativos_id", Integer.parseInt( request.getParameter("auditoria_administrativos_id") ) );                
        formulario.put("auditoria_descripcion"       , request.getParameter("auditoria_descripcion") );

        return super.insertarDatos("proyectos", formulario);
    }
    public String actualizarProyectos(HttpServletRequest request,byte[] pdf){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String tipo;
        */
        formulario.put("carreras_sid"     , request.getParameter("carreras_sid") );
        formulario.put("tipo_proyectos_id", Integer.parseInt( request.getParameter("tipo_proyectos_id") ) );
        formulario.put("tutores_id"       , Integer.parseInt( request.getParameter("tutores_id") ) );
        formulario.put("estudiantes_id"   , Integer.parseInt( request.getParameter("estudiantes_id") ) );
        formulario.put("titulo"           , request.getParameter("titulo") );
        formulario.put("anio_defensa"     , Integer.parseInt( request.getParameter("anio_defensa") ) );
        formulario.put("descripcion"      , request.getParameter("descripcion") );
        formulario.put("resumen"          , request.getParameter("resumen") );
        //formulario.put("pdf"              , request.getParameter("pdf") );
        if(pdf != null)
            formulario.put("pdf"              , pdf );
        //formulario.put("activo"           , Boolean.parseBoolean( request.getParameter("activo") ) );
        formulario.put("auditoria_administrativos_id", Integer.parseInt( request.getParameter("auditoria_administrativos_id") ) );                
        formulario.put("auditoria_descripcion"       , request.getParameter("auditoria_descripcion") );
        
        return super.actualizarDatos("proyectos", formulario, 
                "id=?", request.getParameter("id"));
        
    }
}
