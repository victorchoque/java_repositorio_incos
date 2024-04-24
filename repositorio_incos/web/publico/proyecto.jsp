<%@page import="pojo.Proyecto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="proyectosBean" scope="session"  class="bean.ProyectoBean"/>
<jsp:useBean id="reportesBean" scope="session"  class="bean.ReportesBean"/>
<%
    Proyecto proyecto = new Proyecto();    
    if(request.getParameter("id") !=null){
        proyecto = proyectosBean.obtenerProyectosPorId( Integer.valueOf( request.getParameter("id") ) );        
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Página JSP</title>
    <style>
        html, body {
            height: 100%; /* Asegurar que el body ocupe todo el alto */
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 2px;
            text-align: center;
            box-sizing: border-box;
        }

        main {
            flex: 1; /* Hacer que el main ocupe el espacio restante */
            overflow: hidden; /* Ocultar Scroll el propio PDF ya tiene su Scroll */
        }

        iframe {
            width: 100%; /* El iframe ocupa todo el ancho */
            height: 99%; /* El iframe ocupa todo el alto disponible */
            border: none; /* Sin bordes para el iframe */
        }
        img{
            height:50px;
            float:left;
        }
        h1{
            font-family:monospace;
            padding:5px;
            margin:0px;
        }
    </style>
</head>
<body>
    <header>
        <img src="${contextPath}/assets/portada_page/logo-incos.svg" alt="INCOS">
        <h1><%= new String(proyecto.getTitulo()) %></h1>
    </header>
    <main>
        <iframe src="<%= new String(proyecto.getPdf()) %>" id="pdf_contenedor"></iframe>
    </main>        
</body>
</html>

