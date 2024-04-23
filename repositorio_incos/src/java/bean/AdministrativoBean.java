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
import pojo.Administrativo;

/**
 *
 * @author v3ct0r
 */
public class AdministrativoBean extends BaseBean {
    public AdministrativoBean() throws SQLException{
        super();
    }
    public List<Administrativo> listaAdministrativos () throws Exception{
        return super.obtenerListado(Administrativo.class, 
                "SELECT * FROM administrativos");
    }
    public Administrativo obtenerAdministrativosPorId(int id) throws Exception{
        return super.obtenerResultadoA(Administrativo.class
                , "SELECT * FROM administrativos WHERE id=?"
                , id);
    }
    public String insertarAdministrativos(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String user;
    private String pass;
        */
        formulario.put("user", request.getParameter("user") );
        formulario.put("pass", request.getParameter("pass") );

        return super.insertarDatos("administrativos", formulario);
    }
    public String actualizarAdministrativos(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String user;
    private String pass;
        */
        formulario.put("user", Long.valueOf(request.getParameter("user") ) );
        formulario.put("pass", request.getParameter("pass") );
        return super.actualizarDatos("administrativos", formulario, 
                "id=?", request.getParameter("id"));
        
    }
}
