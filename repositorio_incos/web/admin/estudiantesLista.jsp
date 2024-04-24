<%-- 
    Document   : EstudiantesLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", "Lista de personal Estudiantes del sistema");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="estudianteBean" scope="session"  class="bean.EstudianteBean"/>
<h1>Lista Estudiantes</h1>
<table border="1">
    <thead>
        <tr>
            <th>Id </th>
            <th>Carrera</th>
            <th>Ap. Paterno</th>
            <th>Ap. Materno</th>
            <th>Nombres</th>            
            <th><a href="estudiantesForm.jsp" title=" Adicionar nuevo Estudiante">+ Nuevo</a></th>
        </tr>
    </thead>
    <tbody>

<%for (Estudiante item : estudianteBean.listaEstudiantes() ) {%>
    <tr>
        <td><%=item.getId()%></td>
        <td><%=item.getCarreras_sid()%></td>
        <td><%=item.getApellido_paterno()%></td>        
        <td><%=item.getApellido_materno()%></td>                
        <td><%=item.getNombres()%></td>
        <td>
            <a href='estudiantesForm.jsp?id=<%=item.getId()%>'>EDITAR</a>
            <a href='eliminar?tabla=estudiantes&id=<%=item.getId()%>' onclick="return confirm('Esta seguro de Borrar?')">BORRAR</a>
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
