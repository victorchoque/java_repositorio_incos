<%-- 
    Document   : registrarPropietario
    Created on : 12-mar-2024, 21:42:24
    Author     : incos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<table border="1" style="width:99%">            
            <tbody>
                <tr>
                    <td>
                       <jsp:include page="./menu.jsp" /> 
                    </td>
                    <td>
                        
                        <jsp:useBean id="propietarionBean" scope="session" class="bean.PropietarioBean" />
<%
    if(request.getParameter("registrar") != null ){
        String mensaje = propietarionBean.insertarPropietario(request);
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
        <form method="post">
        <h1>Registro de propietario de mascota!</h1>
        <table>
            <tr>
                <td>nombre propietario</td>
                <td>
                    <input name="nombre_prop"/>
                </td>
            </tr>
            <tr>
                <td>apellido paterno propietario</td>
                <td>
                    <input name="paterno_prop"/>
                </td>
            </tr>
            <tr>
                <td>apellido materno propietario</td>
                <td>
                    <input name="materno_prop"/>
                </td>
            </tr>
            <tr>
                <td>Nro Cedula propietario</td>
                <td>
                    <input name="nro_cedula"/>
                </td>
            </tr>
            <tr>
                <td>Direccion propietario</td>
                <td>
                    <input name="direccion"/>
                </td>
            </tr>
            <tr>
                <td>Telefono propietario</td>
                <td>
                    <input name="telefono"/>
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
                        
                    </td>
                </tr>
            </tbody>
        </table>        
        
        
    </body>
</html>
