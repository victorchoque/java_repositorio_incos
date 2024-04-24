/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pojo;

/**
 *
 * @author v3ct0r
 */
public class Proyecto {
    //id, carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa, descripcion, resumen, pdf, activo, auditoria_administrativos_id, auditoria_fecha_hora, auditoria_accion, auditoria_descripcion
    private int id;
    private String carreras_sid;
    private int tipo_proyectos_id;
    private int tutores_id;
    private int estudiantes_id;

    private String titulo;
    private int anio_defensa;
    private String descripcion;
    private String resumen;
    private byte[] pdf;//BLOB
    private String activo; //"si" o "no"
    private int auditoria_administrativos_id;
    private String auditoria_fecha_hora;
    private String auditoria_accion;
    private String auditoria_descripcion;


    public Proyecto() {
    }
    public String getPdfTamanio(){
        //obtenemos megas kb etc
        if(pdf == null)
            return "vacio";
        else if(pdf.length < 1024)
            return pdf.length + " bytes";
        else if(pdf.length < 1024*1024)
            return pdf.length/1024 + " kb";
        else if(pdf.length < 1024*1024*1024)
            return pdf.length/(1024*1024) + " mb";
        else
            return pdf.length/(1024*1024*1024) + " gb";        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarreras_sid() {
        return carreras_sid;
    }

    public void setCarreras_sid(String carreras_sid) {
        this.carreras_sid = carreras_sid;
    }

    public int getTipo_proyectos_id() {
        return tipo_proyectos_id;
    }

    public void setTipo_proyectos_id(int tipo_proyectos_id) {
        this.tipo_proyectos_id = tipo_proyectos_id;
    }

    public int getTutores_id() {
        return tutores_id;
    }

    public void setTutores_id(int tutores_id) {
        this.tutores_id = tutores_id;
    }

    public int getEstudiantes_id() {
        return estudiantes_id;
    }

    public void setEstudiantes_id(int estudiantes_id) {
        this.estudiantes_id = estudiantes_id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAnio_defensa() {
        return anio_defensa;
    }

    public void setAnio_defensa(int anio_defensa) {
        this.anio_defensa = anio_defensa;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public byte[] getPdf() {
        return pdf;
    }

    public void setPdf(byte[] pdf) {
        this.pdf = pdf;
    }

    public boolean isActivo() {
        return activo.equalsIgnoreCase("si");
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }
    public String getActivo() {
        return this.activo;
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
            
}
