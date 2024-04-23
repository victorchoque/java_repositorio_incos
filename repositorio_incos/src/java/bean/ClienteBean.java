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
import pojo.Cliente;

/**
 *
 * @author v3ct0r
 */
public class ClienteBean extends BaseBean {
    public ClienteBean() throws SQLException{
        super();
    }   
    public String insertarCliente(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String expedido;
    private String paterno;
    private String materno;
    private String nombre;
    private String direccion;
        */
        formulario.put("cedula", Long.valueOf(request.getParameter("cedula") ) );
        formulario.put("expedido", request.getParameter("expedido") );
        formulario.put("paterno", request.getParameter("paterno") );
        formulario.put("materno", request.getParameter("materno") );
        formulario.put("nombre", request.getParameter("nombre") );
        formulario.put("direccion", request.getParameter("direccion") );

        return super.insertarDatos("cliente", formulario);
    }
    public String actualizarCliente(HttpServletRequest request){
        Map<String, Object> formulario = new HashMap<>();
        /*
    private String expedido;
    private String paterno;
    private String materno;
    private String nombre;
    private String direccion;
        */
        // formulario.put("cedula", Long.valueOf(request.getParameter("cedula") ) ); //No se EDitar el "ID"
        formulario.put("expedido", request.getParameter("expedido") );
        formulario.put("paterno", request.getParameter("paterno") );
        formulario.put("materno", request.getParameter("materno") );
        formulario.put("nombre", request.getParameter("nombre") );
        formulario.put("direccion", request.getParameter("direccion") );
        return super.actualizarDatos("cliente"
                , "cedula = "+  request.getParameter("cedula")
                , formulario);
    }
    public Cliente ObtenerClientePorCedula(long cedula) throws Exception{
        String tabla = "cliente";
        Cliente clienteEncontrado = super.obtenerResultadoA(Cliente.class,
                "SELECT * FROM "+tabla+" WHERE cedula="+ String.valueOf(cedula) +"");
        return clienteEncontrado;
    }
    public String listaDeClientes() throws Exception{
        StringBuilder html = new StringBuilder();
        
        List<Cliente> lista = super.obtenerListado(Cliente.class, 
                "SELECT * FROM cliente");
        /*
            <th>Cedula </th>
            <th>Expedido</th>
            <th>paterno</th>
            <th>MATERNO</th>
            <th>nombre</th>
            <th>Direccion</th>
        */
        for(Cliente cliente : lista){
            html.append("<tr>");
                html.append("<td>");
                html.append(cliente.getCedula());
                html.append("</td>");
                
                html.append("<td>");
                html.append(cliente.getExpedido());
                html.append("</td>");
                
                html.append("<td>");
                html.append(cliente.getPaterno());
                html.append("</td>");
                
                html.append("<td>");
                html.append(cliente.getMaterno());
                html.append("</td>");
                
                html.append("<td>");
                html.append(cliente.getNombre());
                html.append("</td>");
                
                html.append("<td>");
                html.append(cliente.getDireccion());
                html.append("</td>");
                html.append("<td>");
                html.append("<a href='actualizarCliente.jsp?cedula="
                        + String.valueOf(cliente.getCedula())  +"'>EDITAR</a>");
                html.append("</td>");
            html.append("</tr>");
        }
        return html.toString();
    }
}
