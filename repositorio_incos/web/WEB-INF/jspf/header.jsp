<%-- any content can be specified here e.g.: --%>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
String subtitulo = (String) request.getAttribute("subtitulo");
%>
<!DOCTYPE html>
<html>
<head>
    <title>${subtitulo}</title>
    <!-- Aquí van los estilos CSS y otros elementos del head -->
    <!--    <link rel="stylesheet" href="${contextPath}/simplecss.css"/>-->
    <link rel="stylesheet" href="${contextPath}/css/index.css"/>
</head>
<body>
    <!-- Este es el encabezado de la página -->
    <header>
        <h1>${subtitulo}</h1>
        <!-- Otros elementos del encabezado -->
    </header>
    <aside>
        <jsp:include page="/menuAdmin.jsp" /> 
    </aside>
    <main>
