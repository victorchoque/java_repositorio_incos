<%-- 
    Document   : CarrerasLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Carrera"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setAttribute("subtitulo", "Lista de personal Carreras del sistema");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="carreraBean" scope="session"  class="bean.CarreraBean"/>
<h1>Lista Carreras</h1>
<ol>
    <li><a href="${contextPath}/admin/mostrarReportes.jsp?por=modalidad" target="_blank">Reporte de los proyectos por modalidad</a></li>
    <li><a href="${contextPath}/admin/mostrarReportes.jsp?por=tutor" target="_blank">Reporte de los proyectos por tutor</a></li>
    <li><a href="${contextPath}/admin/mostrarReportes.jsp?por=busqueda" onclick="return   ((p)=>{ if(p) { window.open(this.href + '&termino_busqueda='+encodeURIComponent(p),'_blank' );  }; return false; })(prompt('Ingrese termino de busqueda autor o titulo'))" target="_blank">Reporte de búsqueda de los proyecto portítulo o autor</a></li>
    <li><a href="${contextPath}/admin/mostrarReportes.jsp?por=estadistico" target="_blank">Mostrar un reporte estadístico de los
proyectos por gestión y modalidades</a></li>

</ol>


<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
