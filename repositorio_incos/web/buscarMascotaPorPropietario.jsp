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
        
<table border="1" style="width:99%">            
            <tbody>
                <tr>
                    <td>
                       <jsp:include page="./menu.jsp" /> 
                    </td>
                    <td>
                        
                        <jsp:useBean id="propietarionBean" scope="session" class="bean.PropietarioBean" />
        <jsp:useBean id="mascotasBean" scope="session" class="bean.MascotasBean" />
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<%
    Propietario prop = new Propietario("", "", "", "", "") ;
    String mascotasTabla = "";
    boolean mostrar = false;
    if(request.getParameter("buscar") != null ){
        prop = propietarionBean.buscarPropietario(request.getParameter("buscar").toString());
       mascotasTabla = mascotasBean.listarMascotasPorPropietarioCarnet(prop.getCedula());
       mostrar=true;
       System.out.println("Mostrar: " + mostrar);
       mascotasTabla = mascotasTabla +" ";
    }else{
        out.print("<h1 style='color:red'>Propietario no encontrado</h1>");
        mostrar=false;
    }
%>


        <table>
            <thead>
                
            </thead>
            <tbody>
            <tr>
                <td>NOMBRE:</td>
                <td>
                    <input type="text" name="nombre" value="<%=prop.getNombre()%>" />
                </td>
            </tr>
            <tr>
                <td>PATERNO</td>
                <td>
                    <input type="text" name="paterno" value="<%=prop.getPaterno()%>" />
                </td>
            </tr>
            <tr>
                <td>MATERNO</td>
                <td>
                    <input type="text" name="materno" value="<%=prop.getMaterno()%>" />
                </td>
            </tr>

            <tr>
                <td>DIRECCION</td>
                <td>
                    <input type="text" name="direccion" value="<%=prop.getDireccion()%>" />
                </td>
            </tr>
            <tr>
                <td>TELEFONO</td>
                <td>
                    <input type="text" name="buscar" value="<%=prop.getTelefono()%>" />
                </td>
            </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td>
<%
if(prop.getId()> 0){
    out.print("<a target='_blank' href=\"registrarMascota.jsp?id_propietario="+String.valueOf(prop.getId())+"\"> ❇ Registrar Nueva mascota</a>");

}

%>
<!--<a href="registrarMascota.jsp?id_propietario=<%=prop.getId()%>"> ❇ Registrar Nueva mascota</a>-->
                    </td>
                </tr>
            </tfoot>
        </table>
            
        <h1>Mascotas</h1>
        <table>
            <tbody>
                <%=mascotasTabla%>
            </tbody>

        </table>
        
                        
                    </td>
                </tr>
            </tbody>
        </table>
        
    </body>
</html>
