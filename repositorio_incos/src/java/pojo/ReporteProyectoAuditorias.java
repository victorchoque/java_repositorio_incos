/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pojo;

import anotaciones.Tabla;

/**
 * Este Pojo termina en Plural ya que es solo para Visualizar reportes o Vista de la tabla proyecto_auditorias
 * @author v3ct0r
 */
@Tabla("reporte_proyecto_auditorias") //Nombre de la tabla en la base de datos
public class ReporteProyectoAuditorias {
    //id, carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa, descripcion, resumen, pdf, activo, auditoria_administrativos_id, auditoria_fecha_hora, auditoria_accion, auditoria_descripcion
    private int id;
    private int proyectos_id;
    private int auditoria_administrativos_id;    
    private String auditoria_fecha_hora;
    private String auditoria_accion;
    private String auditoria_descripcion;
    
    
    private String proyectos_titulo;
    private String administrativos_usuario;

    public ReporteProyectoAuditorias() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProyectos_id() {
        return proyectos_id;
    }

    public void setProyectos_id(int proyectos_id) {
        this.proyectos_id = proyectos_id;
    }

    public int getAuditoria_administrativos_id() {
        return auditoria_administrativos_id;
    }

    public void setAuditoria_administrativos_id(int auditoria_administrativos_id) {
        this.auditoria_administrativos_id = auditoria_administrativos_id;
    }

    public String getAuditoria_fecha_hora() {
        return auditoria_fecha_hora;
    }

    public void setAuditoria_fecha_hora(String auditoria_fecha_hora) {
        this.auditoria_fecha_hora = auditoria_fecha_hora;
    }

    public String getAuditoria_accion() {
        return auditoria_accion;
    }

    public void setAuditoria_accion(String auditoria_accion) {
        this.auditoria_accion = auditoria_accion;
    }

    public String getAuditoria_descripcion() {
        return auditoria_descripcion;
    }

    public void setAuditoria_descripcion(String auditoria_descripcion) {
        this.auditoria_descripcion = auditoria_descripcion;
    }

    public String getProyectos_titulo() {
        return proyectos_titulo;
    }

    public void setProyectos_titulo(String proyectos_titulo) {
        this.proyectos_titulo = proyectos_titulo;
    }

    public String getAdministrativos_usuario() {
        return administrativos_usuario;
    }

    public void setAdministrativos_usuario(String administrativos_usuario) {
        this.administrativos_usuario = administrativos_usuario;
    }
    
}
