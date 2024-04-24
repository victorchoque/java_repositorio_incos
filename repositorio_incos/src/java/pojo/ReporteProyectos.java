package pojo;

import anotaciones.Tabla;

//id, carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa, descripcion, resumen, carrera, tipo_proyecto, tutor, estudiante 
@Tabla("reporte_proyectos") //Nombre de la tabla en la base de datos
public class ReporteProyectos {
    private int id;
    private String carreras_sid;
    private int tipo_proyectos_id;
    private int tutores_id;
    private int estudiantes_id;
    private String titulo;
    private int anio_defensa;
    private String descripcion;
    private String resumen;
    private String carrera;
    private String tipo_proyecto;
    private String tutor;
    private String estudiante;   

    public ReporteProyectos() {
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

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getTipo_proyecto() {
        return tipo_proyecto;
    }

    public void setTipo_proyecto(String tipo_proyecto) {
        this.tipo_proyecto = tipo_proyecto;
    }

    public String getTutor() {
        return tutor;
    }

    public void setTutor(String tutor) {
        this.tutor = tutor;
    }

    public String getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(String estudiante) {
        this.estudiante = estudiante;
    }
    
    
}
