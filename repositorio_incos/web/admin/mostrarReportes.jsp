<%-- 
    Document   : reporte1
    Created on : 05-06-2024, 09:42:26 PM
    Author     : incos
--%>

<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="conexion.VariablesConexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String reporteArchivo = "";
    String por = request.getParameter("por");
    Map parameters = new HashMap();
    // JSP no soporta SWITCH CASE da error
    if ("tutor".equals(por)) {
        reporteArchivo = "jasper/reporte_por_tutor.jasper";
    } else if ("modalidad".equals(por)) {
        reporteArchivo = "jasper/reporte_por_modalidad.jasper";
    } else if ("busqueda".equals(por)) {
        reporteArchivo = "jasper/reporte_busqueda_por_titulo_o_autor.jasper";
        parameters.put("termino_busqueda", request.getParameter("termino_busqueda"));
    } else if ("estadistico".equals(por)) {
        reporteArchivo = "jasper/reporte_estadistico_gestion_modalidad.jasper";
    }
    VariablesConexion conexion = new VariablesConexion();
    conexion.inicioConexion();
    
    //File reportFile = new File( application.getRealPath("jasper/reportePropietarion.jasper") );
    File reportFile = new File( application.getRealPath (  reporteArchivo) );
    
    
byte[] bytes= JasperRunManager.runReportToPdf(reportFile.getPath(), parameters,conexion.getConnection() );
response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    
ServletOutputStream outputStream = response.getOutputStream();
outputStream.write(bytes,0,bytes.length);
outputStream.flush();
outputStream.close();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Un error en el PDF!</h1>
    </body>
</html>
