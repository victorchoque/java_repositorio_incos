package servlets;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import bean.AdministrativoBean;
import bean.TutorBean;
import bean.EstudianteBean;
import bean.CarreraBean;
import bean.ProyectoBean;
import bean.Tipo_proyectoBean;
import bean.UsuarioLogeadoBean;
import constantes.Enlaces;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * Se centraliza la eliminacion de registros en la base de datos, se debe tener en cuenta que se debe tener un usuario logeado
 * @author v3ct0r
 */
@WebServlet("/admin/eliminar")
public class EliminarRegistroServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // La session siempre debe existir, si no existe se debe volver a logear y eso se verifica en el AuthFilter
        HttpSession session = request.getSession(false);  // No crear una nueva sesión si no existe
        // Si no existe Session pero si la Cookie, necesita volverse a logear
        // Establecer el tipo de contenido como HTML
        response.setContentType("text/html");
        // Obtener el objeto PrintWriter para escribir la respuesta
        PrintWriter out = response.getWriter();
        String rutaRaiz = request.getServletContext().getContextPath();
            //Si bien podria tener la Cookie, no podria tener la session por lo cual debe volverse a logear
        UsuarioLogeado usuario = (UsuarioLogeado) session.getAttribute(UsuarioLogeado.class.getName());
        String tabla = request.getParameter("tabla");
        String sid = request.getParameter("sid");
        int id = request.getParameter("id") == null ? 0 : Integer.parseInt( request.getParameter("id") ) ;
        String msg = "Hubo un error";
        try{
            switch (tabla) {
                case "proyectos":
                    ProyectoBean proy = new ProyectoBean();
                    msg = proy.eliminarProyectos(id, usuario.getId());
                    out.write(javaScriptCodigo(msg, rutaRaiz + "/admin/proyectosLista.jsp"));
                    break;                    
                case "carreras":
                    CarreraBean carrera = new CarreraBean();
                    msg = carrera.eliminarCarreras(sid, usuario.getId());
                    out.write(javaScriptCodigo(msg, rutaRaiz + "/admin/carrerasLista.jsp"));
                break;
                case "tipo_proyectos":
                    Tipo_proyectoBean tipoProyecto = new Tipo_proyectoBean();
                    msg = tipoProyecto.eliminarTipo_proyectos(id, usuario.getId());
                    out.write(javaScriptCodigo(msg, rutaRaiz + "/admin/tipo_proyectosLista.jsp"));
                break;
                case "tutores":
                    TutorBean tutor = new TutorBean();
                    msg = tutor.eliminarTutores(id, usuario.getId());
                    out.write(javaScriptCodigo(msg, rutaRaiz + "/admin/tutoresLista.jsp"));
                break;
                case "estudiantes":
                    EstudianteBean estudiante = new EstudianteBean();
                    msg = estudiante.eliminarEstudiantes(id, usuario.getId());
                    out.write(javaScriptCodigo(msg, rutaRaiz + "/admin/estudiantesLista.jsp"));
                break;
                case "administrativos":
                    AdministrativoBean adm = new AdministrativoBean();
                    msg = adm.eliminarAdministrativos(id, usuario.getId());
                    out.write(javaScriptCodigo(msg, rutaRaiz + "/admin/administrativosLista.jsp"));
                break;
            }
        }
        catch(Exception e){
            e.printStackTrace();
            out.write(javaScriptCodigo("Error desconocido al eliminar ", rutaRaiz + "/"));    
        }
        
        out.close();
        // response.sendRedirect(request.getServletContext().getContextPath() + 
        //             Enlaces.publicoLoginConMensajeError("Datos de Acceso Incorrectos"));
    }
    private String javaScriptCodigo(String alerta,String redireccionar_a){
        StringBuilder html = new StringBuilder();
        html.append("<html><head><title>Eliminar</title></head>");
        html.append("<body>");
        html.append( "<script>");
        html.append("alert('")
                .append(alerta.replace("'","\'"))
                .append("');");
        html.append("location.href = '")
                .append(redireccionar_a)
                .append("';");
        html.append(  "</script>");
        html.append("</body>");
        html.append("<html>");
        return html.toString();
    }
}
