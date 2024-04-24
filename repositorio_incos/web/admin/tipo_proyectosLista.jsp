<%-- 
    Document   : tipo_proyectossLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Tipo_proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", "Lista de personal tipo_proyectos del sistema");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="tipo_proyectoBean" scope="session"  class="bean.Tipo_proyectoBean"/>
<h1>Lista tipo_proyectoss</h1>
<table border="1">
    <thead>
        <tr>
            <th>Id </th>
            <th>Tipo</th>
            <th><a href="tipo_proyectosForm.jsp" title=" Adicionar nuevo tipo_proyectos">+ Nuevo</a></th>
        </tr>
    </thead>
    <tbody>

<%for (Tipo_proyecto item : tipo_proyectoBean.listaTipo_proyectos() ) {%>
    <tr>
        <td><%=item.getId()%></td>
        <td><%=item.getTipo()%></td>        
        <td>
            <a href='tipo_proyectosForm.jsp?id=<%=item.getId()%>'>EDITAR</a>
            <a href='eliminar?tabla=tipo_proyectos&id=<%=item.getId()%>' onclick="return confirm('Esta seguro de Borrar?')">BORRAR</a>
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
