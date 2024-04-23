<%-- 
    Document   : Tipo_proyectossLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Tipo_proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", " Tipo_proyectos");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="tipo_proyectosBean" scope="session"  class="bean.Tipo_proyectoBean"/>
<%
    String subtitulo = "Insertar Tipo_proyectos";
    Tipo_proyecto tipo_proyectos = new Tipo_proyecto();
    if(request.getParameter("id") !=null){
        tipo_proyectos = tipo_proyectosBean.obtenerTipo_proyectosPorId(Integer.valueOf(request.getParameter("id") ));
        subtitulo = "Actualizar Tipo_proyectos '"+ tipo_proyectos.getTipo()+"'";
    }
    if(request.getParameter("registrar") != null ){
        String mensaje = "";
        if(tipo_proyectos.getId() == 0){
            mensaje = tipo_proyectosBean.insertarTipo_proyectos(request);
        }else{
            mensaje = tipo_proyectosBean.actualizarTipo_proyectos(request);
        }
        tipo_proyectos.setTipo(request.getParameter("tipo"));
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
<h1><%=subtitulo%></h1>
<form method="post">
    <table>
        <tr>
            <td>Tipo de Proyecto:</td>
            <td><input type="text" name="tipo" value="<%=tipo_proyectos.getTipo()%>" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="registrar" value="Guardar" />
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
