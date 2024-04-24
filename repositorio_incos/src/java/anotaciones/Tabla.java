/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package anotaciones;
import java.lang.annotation.*;
/**
 * Estas anotaciones podran ser usadas para definir el nombre de la tabla en la base de datos que se usara para el Pojo y asi poder hacer las consultas de manera mas facil y rapida
 * @author v3ct0r
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface Tabla {
    String value();
}
