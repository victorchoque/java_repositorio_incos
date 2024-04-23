/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constantes;

/**
 *
 * @author v3ct0r
 */
public class Enlaces {
    public static String publicoLogin = "/publico/login.jsp";
    public static String publicoLoginConMensajeError(String mensaje){
        return Enlaces.publicoLogin+"?error="+mensaje;
    }
    public static String adminPortada = "/admin/portada.jsp";
}
