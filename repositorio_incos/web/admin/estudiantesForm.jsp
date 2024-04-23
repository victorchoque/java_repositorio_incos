<%-- 
    Document   : EstudiantesLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Carrera"%>
<%@page import="pojo.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", " Estudiantes");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 
<jsp:useBean id="carreraBean" scope="session"  class="bean.CarreraBean"/>
<jsp:useBean id="estudiantesBean" scope="session"  class="bean.EstudianteBean"/>

<%
    String subtitulo = "Insertar Estudiantes";
    Estudiante estudiante = new Estudiante();
    if(request.getParameter("id") !=null){
        estudiante = estudiantesBean.obtenerEstudiantesPorId( Integer.valueOf( request.getParameter("id")) );
        subtitulo = "Actualizar Estudiantes '"+ estudiante.getNombres()+"'";
    }
    if(request.getParameter("registrar") != null ){
        String mensaje = "";
        if(estudiante.getId()== 0){
            mensaje = estudiantesBean.insertarEstudiantes(request);
        }else{
            mensaje = estudiantesBean.actualizarEstudiantes(request);
        }
        estudiante.setCarreras_sid(request.getParameter("carreras_sid"));
        estudiante.setNombres(request.getParameter("nombres"));
        estudiante.setApellido_paterno(request.getParameter("apellido_paterno"));
        estudiante.setApellido_materno(request.getParameter("apellido_materno"));
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
<h1><%=subtitulo%></h1>
<form method="post">
    <table>
        <tr>
            <td>Carrera Que esta Inscrito</td>
            <td>
                <select name="carreras_sid">
                    <option value="0">Seleccione Carrera</option>
                    <%for (Carrera item : carreraBean.listaCarreras() ) {%>
                    <option value="<%=item.getSid()%>" <%=item.getSid().equalsIgnoreCase(estudiante.getCarreras_sid()) ? "selected" : ""%>><%=item.getNombre()%></option>
                    <%}%>
                </select>
            </td>
        </tr>
        <tr>
            <td>Nombres de Estudiante:</td>
            <td><input type="text" name="nombres" value="<%=estudiante.getNombres()%>" /></td>
        </tr>
        <tr>
            <td>Apellido paterno de Estudiante:</td>
            <td><input type="text" name="apellido_paterno" value="<%=estudiante.getApellido_paterno()%>" /></td>
        </tr>
        <tr>
            <td>Apellido materno de Estudiante:</td>
            <td><input type="text" name="apellido_materno" value="<%=estudiante.getApellido_materno()%>" /></td>
        </tr>
        
        <tr>
            <td colspan="2">
                <input type="submit" name="registrar" value="Guardar" />
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
