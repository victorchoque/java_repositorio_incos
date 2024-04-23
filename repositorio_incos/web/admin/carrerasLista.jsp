<%-- 
    Document   : CarrerasLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Carrera"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", "Lista de personal Carreras del sistema");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="carreraBean" scope="session"  class="bean.CarreraBean"/>
<h1>Lista Carreras</h1>
<table border="1">
    <thead>
        <tr>
            <th>Id </th>
            <th>Tipo</th>
            <th><a href="carrerasForm.jsp" title=" Adicionar nuevo Carrera">+ Nuevo</a></th>
        </tr>
    </thead>
    <tbody>

<%for (Carrera item : carreraBean.listaCarreras() ) {%>
    <tr>
        <td><%=item.getSid()%></td>
        <td><%=item.getNombre()%></td>        
        <td><a href='carrerasForm.jsp?sid=<%=item.getSid()%>'>EDITAR</a></td>
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
