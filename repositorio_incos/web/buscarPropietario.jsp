<%-- 
    Document   : buscarMascotaPorPropietario
    Created on : 19-mar-2024, 21:43:54
    Author     : incos
--%>

<%@page import="pojo.Propietario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="propietarionBean" scope="session" class="bean.PropietarioBean" />
        <h1>BUSCAR MASCOTAS POR PROPIETARIO</h1>
        <form method="POST">
        
        <table border="1">
            <thead>
                <tr>
                    <th>nro Cedula</th>
                    <th>
                        <input type="text" name="buscar" value="" />
                    </th>
                    <th>
                        <input type="submit" value="🔍 BUSCAR" />
                    </th>
                </tr>
            </thead>

        </table>
        </form>
        
<%
    Propietario prop = new Propietario("", "", "", "", "") ;
    if(request.getParameter("buscar") != null ){
        prop = propietarionBean.buscarPropietario(request.getParameter("buscar").toString());
       
    }else{
        out.print("<h1 style='color:red'>Propietario no encontrado</h1>");
    }
%>
        <table>
            <tr>
                <td>NOMBRE:</td>
                <td>
                    <input type="text" name="buscar" value="<%=prop.getNombre()%>" />
                </td>
            </tr>
            <tr>
                <td>PATERNO</td>
                <td>
                    <input type="text" name="buscar" value="<%=prop.getPaterno()%>" />
                </td>
            </tr>
            <tr>
                <td>MATERNO</td>
                <td>
                    <input type="text" name="buscar" value="<%=prop.getMaterno()%>" />
                </td>
            </tr>

            <tr>
                <td>DIRECCION</td>
                <td>
                    <input type="text" name="buscar" value="<%=prop.getDireccion()%>" />
                </td>
            </tr>
            <tr>
                <td>TELEFONO</td>
                <td>
                    <input type="text" name="buscar" value="<%=prop.getTelefono()%>" />
                </td>
            </tr>
        </table>
    </body>
</html>
