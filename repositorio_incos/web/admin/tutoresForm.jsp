<%-- 
    Document   : tutoresLista
    Created on : 17 abr de 2024, 15:16:49
    Author     : v3ct0r
--%>
<%@page import="pojo.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", " tutores");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 
<jsp:useBean id="tutoresBean" scope="session"  class="bean.TutorBean"/>

<%
    String subtitulo = "Insertar tutores";
    Tutor tutor = new Tutor();
    if(request.getParameter("id") !=null){
        tutor = tutoresBean.obtenerTutoresPorId( Integer.valueOf( request.getParameter("id")) );
        subtitulo = "Actualizar tutores '"+ tutor.getNombres()+"'";
    }
    if(request.getParameter("registrar") != null ){
        String mensaje = "";
        if(tutor.getId()== 0){
            mensaje = tutoresBean.insertarTutores(request);
        }else{
            mensaje = tutoresBean.actualizarTutores(request);
        }
        tutor.setCarreras_sid(request.getParameter("carreras_sid"));
        tutor.setNombres(request.getParameter("nombres"));
        tutor.setApellido_paterno(request.getParameter("apellido_paterno"));
        tutor.setApellido_materno(request.getParameter("apellido_materno"));
        tutor.setNivel_educativo(request.getParameter("nivel_educativo"));
        tutor.setEspecializacion(request.getParameter("especializacion"));
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
<h1><%=subtitulo%></h1>
<form method="post">
    <table>
        <tr>
            <td>Nombres de tutor:</td>
            <td><input type="text" name="nombres" value="<%=tutor.getNombres()%>" /></td>
        </tr>
        <tr>
            <td>Apellido paterno de tutor:</td>
            <td><input type="text" name="apellido_paterno" value="<%=tutor.getApellido_paterno()%>" /></td>
        </tr>
        <tr>
            <td>Apellido materno de tutor:</td>
            <td><input type="text" name="apellido_materno" value="<%=tutor.getApellido_materno()%>" /></td>
        </tr>
        <tr>
            <td>Nivel educativo de tutor:</td>
            <td><input type="text" name="nivel_educativo" value="<%=tutor.getNivel_educativo()%>" /></td>
        </tr>
        <tr>
            <td>Especializacion de tutor:</td>
            <td><input type="text" name="especializacion" value="<%=tutor.getEspecializacion()%>" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="registrar" value="Guardar" />
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
