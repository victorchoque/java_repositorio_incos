<%-- 
    Document   : CarrerasLista
    Author     : v3ct0r
--%>
<%@page import="pojo.Carrera"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", " Carreras");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 

<jsp:useBean id="carrerasBean" scope="session"  class="bean.CarreraBean" />
<%
    String subtitulo = "Insertar Carreras";
    Carrera carrera = new Carrera();
    if(request.getParameter("sid") !=null){
        carrera = carrerasBean.obtenerCarrerasPorSid(request.getParameter("sid") );
        subtitulo = "Actualizar Carreras '"+ carrera.getNombre()+"'";
    }
    if(request.getParameter("registrar") != null ){
        String mensaje = "";
        if(carrera.getSid()== null || carrera.getSid().isEmpty()){
            mensaje = carrerasBean.insertarCarreras(request);
        }else{
            mensaje = carrerasBean.actualizarCarreras(request);
        }
        carrera.setNombre(request.getParameter("nombre"));
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
%>
<h1><%=subtitulo%></h1>
<form method="post">
    <table>
        <tr>
            <td>Nombre de Carrera:</td>
            <td><input type="text" name="nombre" value="<%=carrera.getNombre()%>" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="registrar" value="Guardar" />
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
