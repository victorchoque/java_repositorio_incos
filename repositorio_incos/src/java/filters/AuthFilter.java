/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filters;

/**
 *
 * @author v3ct0r
 */
import constantes.Enlaces;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.UsuarioLogeado;
import util.AESUtil;
/**
 * Se encarga de verificar si la Cookie de Login es correcto o no, cuando un Administrativo se autentica se obtiene su ID y se cifra ese dato con una contraseña interna de aplicacion
 * @author v3ct0r
 */
@WebFilter("/admin/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        boolean tieneLoginValido = false;
        // Verificar si existen cookies de autenticación
        Cookie[] cookies = httpRequest.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("app")) {
                    // Cookie de autenticación encontrada
                    // Validamos decifrando la cookie para obtener el ID del administrativo
                    try{
                        String idCadena = AESUtil.descifrar(cookie.getValue());
                        int id = Integer.parseInt(idCadena);
                        if(id<1)
                            throw new Exception("El Id del administrativo es menor a 1 ");
                        tieneLoginValido =true;                        
                        HttpSession session = httpRequest.getSession(false);  // No crear una nueva sesión si no existe
                        //Si bien podria tener la Cookie, no podria tener la session por lo cual debe volverse a logear
                        UsuarioLogeado usuario = (UsuarioLogeado) session.getAttribute(UsuarioLogeado.class.getName());
                        if(usuario==null){
                            tieneLoginValido = false;
                            //return;
                        }
                        chain.doFilter(request, response);
                        return;
                    }catch(Exception e){
                        
                        e.printStackTrace();
                        
                    }                    
                }
            }
        }
        // Ponemos en IF cuando tiene Login valido pero hubo un error de otra indole
        if(!tieneLoginValido){
            // Si no se encuentra la cookie de autenticación, redirigir a la página de inicio de sesión
            httpResponse.sendRedirect(request.getServletContext().getContextPath() + Enlaces.publicoLogin);    
        }else{
            httpResponse.sendError(500, "Error Interno verifique los LOGS de glassFish");
        }
        
    }
    
    
    
}
