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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringJoiner;

import pojo.Proyecto;
import pojo.ReporteProyectos;



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
    public String eliminarProyectos(int id,int id_usuario){
        Map<String, Object> formulario = new HashMap<>();                        
        formulario.put("auditoria_administrativos_id", id_usuario );                
        formulario.put("auditoria_descripcion", "Eliminacion logica" );
        formulario.put("activo"       , "no" );

        return super.actualizarDatos("proyectos", formulario,"id=?",id);
    
    }
    public String insertarProyectos(HttpServletRequest request,byte[] pdf){
        // carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa , descripcion, resumen, pdf, activo, auditoria_administrativos_id, auditoria_fecha_hora, auditoria_accion, auditoria_descripcion
        Map<String, Object> formulario = new HashMap<>();

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
        //formulario.put("activo"           , "si" );
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
        //formulario.put("activo"           ,  "si" );
        formulario.put("auditoria_administrativos_id", Integer.parseInt( request.getParameter("auditoria_administrativos_id") ) );                
        formulario.put("auditoria_descripcion"       , request.getParameter("auditoria_descripcion") );
        
        return super.actualizarDatos("proyectos", formulario, 
                "id=?", request.getParameter("id"));
        
    }
    
    public List<ReporteProyectos> listarProyectoEnPortada(HttpServletRequest request) throws Exception{
        // id, carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa, descripcion, resumen, carrera, tipo_proyecto, tutor, estudiante 
        // filtros = anios[] , carreras_sid? , tipo_proyectos_id?, titulo?, descripcion?
        List<String> filtros = new ArrayList<>();
        List<Object> parametros = new ArrayList<>(); // medida de seguridad
        
        
        if(request.getParameter("carreras_sid") != null && request.getParameter("carreras_sid").length()>0){
            filtros.add(" carreras_sid = ? ");
            parametros.add(request.getParameter("carreras_sid") );
        }
        if(request.getParameter("tipo_proyectos_id") != null && request.getParameter("tipo_proyectos_id").length()>0){
            filtros.add(" tipo_proyectos_id = ? ");
            parametros.add( Integer.valueOf(request.getParameter("tipo_proyectos_id")) );
        }
        //EN las busquedas con LIKE en mysql se debe de usar minimo 3 caracteres
        if(request.getParameter("titulo") != null && request.getParameter("titulo").length()>2){
            filtros.add(" titulo LIKE ? ");
            parametros.add( "%"+request.getParameter("titulo") +"%" );
        }
        //EN las busquedas con LIKE en mysql se debe de usar minimo 3 caracteres
        if(request.getParameter("descripcion") != null && request.getParameter("descripcion").length()>2){
            filtros.add(" descripcion LIKE ? ");
            parametros.add( "%"+request.getParameter("descripcion") +"%" );
        }
        if(request.getParameter("anios")!=null &&request.getParameterValues("anios").length>0){
            //verificamos que sean años validos y no inyeccion SQL
            List<String> anios = new ArrayList<>();
            for(String anio : request.getParameterValues("anios")){
                int newAnio = Integer.parseInt(anio);
                anios.add( String.valueOf(newAnio) );
            }
            filtros.add(" anio_defensa IN ("+ String.join(",", anios) +")" );
        }

        return super.obtenerListado(ReporteProyectos.class, 
                " SELECT * FROM reporte_proyectos " 
                + (filtros.isEmpty() ?"": " WHERE " + String.join(" AND ",filtros) )
                + " ORDER BY anio_defensa DESC"
                + " LIMIT 30"
                , parametros.toArray());
    }
}
