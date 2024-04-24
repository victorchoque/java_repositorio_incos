/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import bean.UsuarioLogeadoBean;
import constantes.Enlaces;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import pojo.UsuarioLogeado;
import util.AESUtil;
/**
 * Cuando el usuario envia sus datos de autenticacion el dato de obtener la info se encripta
 * @author v3ct0r
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UsuarioLogeadoBean usuarioLogeadoBean;
    private UsuarioLogeado usuarioLogeado;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        

        // Validar las credenciales (aquí asumimos que son válidas)
        if (autenticarUsuario(username,password)) {
            try{
                persistirDatos(request,response,username,password);
                //response.sendRedirect("/admin/dashboard.jsp"); // Redirigir a la página segura
                response.sendRedirect(request.getServletContext().getContextPath() + Enlaces.adminPortada);
                return;
            }catch(Exception e){
                e.printStackTrace();
            }
            
        } else {
            //response.sendRedirect("/publico/login.jsp?error=1"); // Redirigir de nuevo al formulario de inicio de sesión con un mensaje de error
            
        }
        response.sendRedirect(request.getServletContext().getContextPath() + 
                    Enlaces.publicoLoginConMensajeError("Datos de Acceso Incorrectos"));
    }
    // Métodos de autenticación y obtención de información de usuario
    // Estos métodos deben implementarse de acuerdo a la lógica de tu aplicación
    private boolean autenticarUsuario(String user, String pass) {
        
        // Lógica de autenticación
        try{
            usuarioLogeadoBean = new UsuarioLogeadoBean();
            usuarioLogeado = usuarioLogeadoBean.existe(user, pass);
            return usuarioLogeado!=null && usuarioLogeado.getId()>0;
        }catch(Exception e){
            return false;
        }
        
        // Retorna true si el usuario es autenticado exitosamente, false en caso contrario
        //return "admin".equals(user) && "admin".equals(user);
    }
    
    private void persistirDatos(HttpServletRequest request, HttpServletResponse response,String user, String pass) throws Exception {
        // Establecer una cookie de sesión
        
        HttpSession session = request.getSession();
        //verificamos si existe el usuario (administrativo)
        //UsuarioLogeadoBean usuarioLogeadoBean = new UsuarioLogeadoBean();
        //UsuarioLogeado usuarioLogeado = usuarioLogeadoBean.existe(user, pass);
        
        String datosCifrados = AESUtil.cifrar(String.valueOf(usuarioLogeado.getId()));
        session.setAttribute(UsuarioLogeado.class.getName(), usuarioLogeado);
        
        
        Cookie cookieResponse = new Cookie("app", datosCifrados);
        response.addCookie(cookieResponse);
        /*
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("app")) {
                    cookie.setValue(datosCifrados);
                }                
            }
        }/**/        
    }
}
