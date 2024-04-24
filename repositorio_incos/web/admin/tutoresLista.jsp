<%-- 
    Document   : TutoresLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", "Lista de personal Tutores del sistema");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="tutorBean" scope="session"  class="bean.TutorBean"/>
<h1>Lista tutores</h1>
<table border="1">
    <thead>
        <tr>
            <th>Id </th>
            <th>Ap. Paterno</th>
            <th>Ap. Materno</th>
            <th>Nombres</th>            
            <th>nivel_educativo</th>
            <th>especializacion</th>
            <th><a href="tutoresForm.jsp" title=" Adicionar nuevo tutor">+ Nuevo</a></th>
        </tr>
    </thead>
    <tbody>

<%for (Tutor item : tutorBean.listaTutores() ) {%>
    <tr>
        <td><%=item.getId()%></td>
        <td><%=item.getApellido_paterno()%></td>        
        <td><%=item.getApellido_materno()%></td>                
        <td><%=item.getNombres()%></td>  
        <td><%=item.getNivel_educativo()%></td>
        <td><%=item.getEspecializacion()%></td>
        <td><a href='tutoresForm.jsp?id=<%=item.getId()%>'>EDITAR</a></td>
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
