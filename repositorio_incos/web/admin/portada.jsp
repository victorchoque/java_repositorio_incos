<%-- 
    Document   : portada
    Created on : 17 abr de 2024, 14:57:43
    Author     : v3ct0r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", "Bienvenido");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 
<h2>Pagina de portada</h2>
<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 