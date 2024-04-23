<%-- 
    Document   : administrativosLista
    Created on : 17 abr de 2024, 15:16:49
    Author     : v3ct0r
--%>
<%@page import="pojo.Administrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", " Administrativo");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="administrativoBean" scope="session"  class="bean.AdministrativoBean"/>
<%
    String subtitulo = "Insertar Administrativo";
    Administrativo administrativo = new Administrativo();
    if(request.getParameter("id") !=null){
        administrativo = administrativoBean.obtenerAdministrativosPorId(Integer.valueOf(request.getParameter("id") ));
        subtitulo = "Actualizar Administrativo '"+ administrativo.getUser()+"'";
    }
    if(request.getParameter("registrar") != null ){
        String mensaje = "";
        if(administrativo.getId() == 0){
            mensaje = administrativoBean.insertarAdministrativos(request);
        }else{
            mensaje = administrativoBean.actualizarAdministrativos(request);
        }        
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
<h1><%=subtitulo%></h1>
<form method="post">
    <table>
        <tr>
            <td>Nombre de usuario:</td>
            <td><input type="text" name="user" value="<%=administrativo.getUser()%>" /></td>
        </tr>
        <tr>
            <td>Contraeña:</td>
            <td><input type="password" name="pass" value="<%=administrativo.getPass()%>" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="registrar" value="Guardar" />
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
