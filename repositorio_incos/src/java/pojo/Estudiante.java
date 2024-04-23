/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pojo;

/**
 *
 * @author v3ct0r
 */
public class Estudiante {
    private int id;
    private String carreras_sid;
    private String nombres;
    private String apellido_paterno;
    private String apellido_materno;
    public Estudiante(){}
    public String getFullname(){
        return this.apellido_paterno + " " + this.apellido_materno +" " + this.nombres;
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

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }
    
    
            
}
