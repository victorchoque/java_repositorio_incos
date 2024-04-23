<%-- 
    Document   : registrarCliente.jsp
    Created on : 16 abr de 2024, 17:23:27
    Author     : v3ct0r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <jsp:useBean id="clienteBean" scope="session" class="bean.ClienteBean" />
<%
    if(request.getParameter("registrar") != null ){
        
        String mensaje = clienteBean.insertarCliente(request);
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
<!--    private String expedido;
    private String paterno;
    private String materno;
    private String nombre;
    private String direccion;-->
        <form method="post">
        <h1>Registro Cliente!</h1>
        <table>
            <tr>
                <td>Cedula</td>
                <td>
                    <input name="cedula" type="number"/>
                </td>
            </tr>
            <tr>
                <td>expedido</td>
                <td>
                    <input name="expedido" type="text"/>
                </td>
            </tr>
            <tr>
                <td>paterno</td>
                <td>
                    <input name="paterno" type="text"/>
                </td>
            </tr>
            <tr>
                <td>materno</td>
                <td>
                    <input name="materno" type="text"/>
                </td>
            </tr>
            <tr>
                <td>nombre</td>
                <td>
                    <input name="nombre" type="text"/>
                </td>
            </tr>
           <tr>
                <td>direccion</td>
                <td>
                    <input name="direccion" type="text"/>
                </td>
            </tr>
            
            <tr>
                <th colspan="2">
                    <input type="submit" value="registrar" style="color:green" name="registrar" />
                    <input type="submit" value="cancelar" style="color:red" name="cancelar" />
                    
                </th>
            </tr>
        </table>
        </form>
    </body>
</html>
