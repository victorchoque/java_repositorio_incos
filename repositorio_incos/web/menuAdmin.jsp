<%-- 
    Document   : menu
    Created on : 3 abr de 2024, 17:20:23
    Author     : v3ct0r
--%>
<%@page import="pojo.UsuarioLogeado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:useBean id="usuarioLogeadoBean" scope="session"  class="bean.UsuarioLogeadoBean"/>
<%
    UsuarioLogeado usuario = (UsuarioLogeado) session.getAttribute(UsuarioLogeado.class.getName());
%>  
<nav>
    <div>
        <b><%=usuario.getUser()%></b>
    </div>
    <ul>
        <li>
            <a href="${contextPath}/admin/administrativosLista.jsp"> Administrativos </a>
        </li>
        <li>
            <hr>
        </li>
        <li>
            <a href="${contextPath}/admin/tutoresLista.jsp"> Tutores </a>
        </li>
        <li>
            <hr>
        </li>
        <li>
            <a href="${contextPath}/admin/estudiantesLista.jsp"> Estudiantes </a>
        </li>
        <li>
            <hr>
        </li>
        <li>
            <a href="${contextPath}/admin/proyectosLista.jsp"> Proyectos </a>
        </li>
        <li>
            <hr>
            <h3>Configuarciones</h3>
        </li>
        <li>
            <a href="${contextPath}/admin/carrerasLista.jsp"> Carreras </a>
        </li>
        <li>
            <a href="${contextPath}/admin/tipo_proyectosLista.jsp"> tipo_proyectosLista </a>
        </li>
        
    </ul>
</nav>