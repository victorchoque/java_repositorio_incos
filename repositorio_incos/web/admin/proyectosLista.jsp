<%-- 
    Document   : proyectosLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setAttribute("subtitulo", "Lista de personal proyectos del sistema");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="proyectoBean" scope="session"  class="bean.ProyectoBean"/>
<h1>Lista proyectoss</h1>
<table border="1">
    <thead>
        <tr>
            <th>Id </th>
            <th>Titulo</th>
            <th>Tamaño Pdf</th>
            <th><a href="proyectosForm.jsp" title=" Adicionar nuevo proyectos">+ Nuevo</a></th>
        </tr>
    </thead>
    <tbody>

<%for (Proyecto item : proyectoBean.listaProyectos() ) {%>
    <tr style="<%=item.isActivo()?"":"border-color:red" %>">
        <td><%=item.getId()%></td>
        <td><%=item.getTitulo()%></td>        
        <td>
        
            <a href="${contextPath}/publico/proyecto.jsp?id=<%=item.getId()%>" target="_blank"><%=item.getPdfTamanio()%> <img src='${contextPath}/assets/portada_page/pdf-icon.svg' style="max-width:16px;max-height:16px"></a>
        </td>
        <td><a href='proyectosForm.jsp?id=<%=item.getId()%>'>EDITAR</a> 
            <% if(item.isActivo()){%>
        |   <a href='eliminar?tabla=proyectos&id=<%=item.getId()%>' onclick="return confirm('Esta seguro de Desactivar ?')">Desactivar</a> 
            <% }%>
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
