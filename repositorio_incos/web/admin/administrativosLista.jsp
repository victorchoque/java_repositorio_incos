<%-- 
    Document   : administrativosLista
    Created on : 17 abr de 2024, 15:16:49
    Author     : v3ct0r
--%>
<%@page import="pojo.Administrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", "Lista de personal administrativo del sistema");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="administrativoBean" scope="session"  class="bean.AdministrativoBean"/>
<h1>Lista Administrativos</h1>
<table border="1">
    <thead>
        <tr>
            <th>Id </th>
            <th>User</th>
            <th>Pass</th>
            <th><a href="administrativosForm.jsp" title=" Adicionar nuevo administrativo">+ Nuevo</a></th>
        </tr>
    </thead>
    <tbody>

<%for (Administrativo item : administrativoBean.listaAdministrativos() ) {%>
    <tr>
        <td><%=item.getId()%></td>
        <td><%=item.getUser()%></td>
        <td><%=item.getPass()%></td>
        <td>
            <a href='administrativosForm.jsp?id=<%=item.getId()%>'>EDITAR</a>
            <a href='eliminar?tabla=administrativos&id=<%=item.getId()%>' onclick="return confirm('Esta seguro de Borrar?')">BORRAR</a>
        </td>
    </tr>
<%}%>
    </tbody>
    <tfoot>
        <tr>
            <td colspan="4">
                
            </td>
        </tr>
    </tfoot>
</table>


<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
