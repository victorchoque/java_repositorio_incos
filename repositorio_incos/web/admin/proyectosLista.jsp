<%-- 
    Document   : proyectosLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <tr>
        <td><%=item.getId()%></td>
        <td><%=item.getTitulo()%></td>        
        <td><%=item.getPdfTamanio()%></td>
        <td><a href='proyectosForm.jsp?id=<%=item.getId()%>'>EDITAR</a> 
        |   <a href='eliminar.jsp?table=proyectos&id=<%=item.getId()%>' onclick="return prompt('Esta seguro de eliminar ?')">Borrarr</a> 
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
