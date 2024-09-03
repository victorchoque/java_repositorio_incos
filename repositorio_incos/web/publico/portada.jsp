<%-- 
    Document   : portada
    Author     : v3ct0r
--%>
<%@page import="pojo.ReporteProyectos"%>
<%@page import="pojo.Proyecto"%>
<%@page import="pojo.Tipo_proyecto"%>
<%@page import="pojo.Carrera"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:useBean id="carreraBean" scope="session"  class="bean.CarreraBean"/>
<jsp:useBean id="tipo_proyectoBean" scope="session"  class="bean.Tipo_proyectoBean"/>
<jsp:useBean id="proyectosBean" scope="session"  class="bean.ProyectoBean"/>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Portada de Proyectos de Grado</title>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .header img {
            height: 50px;
            vertical-align: middle;
        }

        .header h1 {
            display: inline-block;
            margin: 0;
            padding-left: 10px;
        }

        .sidebar {
            background-color: #f4f4f4;
            padding: 10px;
            border-right: 1px solid #ddd;
            height: 100vh;
            width: 200px;
            float: left;
        }

        .content {
            padding: 20px;
            margin-left: 220px;
        }

        .project-table {
            width: 100%;
            border-collapse: collapse;
        }

        .project-table th, .project-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .project-table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="${contextPath}/assets/portada_page/logo-incos.svg" alt="INCOS">
        <h1>Repositorio No oficial del INCOS LA PAZ</h1>
    </div>

    <div class="sidebar">
        <h2>Filtros</h2>
        <form method="get">
            <label for="carrera">Carrera:</label>
            <select id="carrera" name="carreras_sid">
                <option value="">Todas</option>
<% for (Carrera item : carreraBean.listaCarreras() ) {%>
                <option value="<%=item.getSid()%>" <%= item.getSid().equals(request.getParameter("carrera") )? "selected":"" %> ><%=item.getNombre()%></option>
<% } %>
            </select>
            <br>
            <label for="tipo">Tipo de proyecto:</label>
            <select id="tipo" name="tipo_proyectos_id">
                <option value="">Todas</option>
<% for (Tipo_proyecto item : tipo_proyectoBean.listaTipo_proyectos()) {%>
                <option value="<%=item.getId()%>" <%=request.getParameter("tipo")!=null && item.getId() == Integer.valueOf(request.getParameter("tipo")) ?"selected":"" %> ><%=item.getTipo()%></option>
<% } %>
            </select>
            <br>
            <hr>
            <label for="anios">Año(s) de Defensa:</label>
            <br>
            <select name="anios" multiple>
<% for (int i = 2010; i <= 2032; i++) { %>
                <option value="<%=i%>"><%=i%></option>
<% } %>                        
            </select>
            <br>
            <hr>
            <label for="titulo">titulo:</label>
            <br>
            <input type="text" id="titulo" name="titulo">
            <hr>
            <label for="author">autor:</label>
            <br>
            <input type="text" id="author" name="author">
            <br>
            <hr>
            <label for="tutor">tutor</label>
            <br>
            <input type="text" id="tutor" name="tutor">
            <br>
            <hr>
            <label for="descripcion">descripcion:</label>
            <br>
            <input type="text" id="descripcion" name="descripcion">
            <br>
            <button type="submit">Aplicar Filtros de Busqueda</button>
        </form>
    </div>
            <style>
                .project-table .item,.project-table .item td{
                    border-top: 1px solid blue
                }
            </style>
    <div class="content">
        <h2>Lista de coincidencias</h2>
        <!-- id, carreras_sid, tipo_proyectos_id, tutores_id, estudiantes_id, titulo, anio_defensa, descripcion, resumen, carrera, tipo_proyecto, tutor, estudiante -->
        <table class="project-table">
        <!-- 
        <thead>
            <tr>
                <th>Carrera</th>
                <th>Tipo de Proyecto</th>
                <th>Tutor</th>
                <th>Estudiante</th>
                <th>Titulo</th>
                <th>Año de Defensa</th>
                <th>Descripcion</th>                
            </tr>
        </thead>
        -->
        <tbody>
<% 
boolean tieneResultados = false;
for (ReporteProyectos item : proyectosBean.listarProyectoEnPortada(request)) { 
tieneResultados = true;
%>
            <tr class="item">
                <td rowspan="2">
                    <%=item.getId()%>
                </td>
                <td colspan=2>
                    <%=item.getAnio_defensa()%> - 
                    <%=item.getTipo_proyecto()%>  -              
                    <a href="${contextPath}/publico/proyecto.jsp?id=<%=item.getId()%>"><%=item.getTitulo()%> <img src='${contextPath}/assets/portada_page/pdf-icon.svg' style="max-width:16px;max-height:16px"></a>
                </td>
            </tr>
            <tr>
                <td>carrera = <%=item.getCarrera()%> 
                    <br>tutor = <%=item.getTutor()%>
                    <br>author = <%=item.getEstudiante()%>                                
                </td>
                <td><%=item.getDescripcion()%></td>                
            </tr>     
<% } %>
<% if(!tieneResultados) out.print("<tr><th colspan='3' >No se encontraron Resultados</th></tr>"); %>
        </table>
    </div>
</body>
</html>
