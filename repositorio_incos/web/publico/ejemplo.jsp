<%-- 
    Document   : ejemplo
    Created on : 17 abr de 2024, 11:14:35
    Author     : v3ct0r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 
<jsp:useBean id="administrativoBean" scope="session"  class="bean.AdministrativoBean"/>
                       
<h1>Lista Administrativos</h1>
<table border="1">
    <thead>
        <tr>
            <th>Id </th>
            <th>User</th>
            <th>Pass</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <%=administrativoBean.listaDeAdministrativos()%>
    </tbody>
</table>
<jsp:include page="/WEB-INF/jspf/footer.jsp" />          