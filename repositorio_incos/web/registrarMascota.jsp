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
        <jsp:useBean id="mascotasBean" scope="session" class="bean.MascotasBean" />
<%
    if(request.getParameter("registrar") != null ){
        
        String mensaje = mascotasBean.insertarMascota(request);
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
        <form method="post">
        <h1>Registro de mascota</h1>
        <table>
            <tr>
                <td>nombre mascota</td>
                <td>
                    <input name="nom_mascota" value="<%=request.getParameter("nom_mascota")%>"/>
                </td>
            </tr>
            <tr>
                <td>tipo mascota</td>
                <td>
                    <input name="tipo" value="<%=request.getParameter("tipo")%>"/>
                </td>
            </tr>
            <tr>
                <td>raza mascota</td>
                <td>
                    <input name="raza" value="<%=request.getParameter("raza")%>"/>
                </td>
            </tr>
            <tr>
                <td>fecha nacimiento</td>
                <td>
                    <input type="date" name="fechanacimiento" value="<%=request.getParameter("fechanacimiento")%>"/>
                </td>
            </tr>
            <tr>
                <td>peso</td>
                <td>
                    <input type="number" name="peso" value="<%=request.getParameter("peso")%>"/>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" value="registrar" style="color:green" name="registrar" />                                        
                </th>
            </tr>
        </table>
        </form>
    </body>
</html>
