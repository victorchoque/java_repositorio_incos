<%-- 
    Document   : ProyectosLista
    Author     : v3ct0r
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="pojo.Estudiante"%>
<%@page import="pojo.Tutor"%>
<%@page import="pojo.Tipo_proyecto"%>
<%@page import="pojo.Carrera"%>
<%@page import="pojo.UsuarioLogeado"%>
<%@page import="pojo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setAttribute("subtitulo", " proyectos");
%>
<jsp:include page="/WEB-INF/jspf/header.jsp" /> 
<jsp:useBean id="carreraBean" scope="session"  class="bean.CarreraBean"/>
<jsp:useBean id="tipo_proyectoBean" scope="session"  class="bean.Tipo_proyectoBean"/>
<jsp:useBean id="tutorBean" scope="session"  class="bean.TutorBean"/>
<jsp:useBean id="estudianteBean" scope="session"  class="bean.EstudianteBean"/>
<jsp:useBean id="proyectosBean" scope="session"  class="bean.ProyectoBean"/>
<jsp:useBean id="usuarioLogeadoBean" scope="session"  class="bean.UsuarioLogeadoBean"/>
<%
    UsuarioLogeado usuario = (UsuarioLogeado) session.getAttribute(UsuarioLogeado.class.getName());
    String subtitulo = "Insertar proyectos";
    Proyecto proyecto = new Proyecto();
    
    //request.setParameter("auditoria_administrativos_id", usuario.getId().toString());
    
    if(request.getParameter("id") !=null){
        proyecto = proyectosBean.obtenerProyectosPorId( Integer.valueOf( request.getParameter("id") ) );
        subtitulo = "Actualizar proyectos '"+ proyecto.getTitulo()+"'";
    }
    if(request.getParts()!= null){
        for(Part p : request.getParts()){
            String algo = p.getName();
        }
    }

    if(request.getParameter("registrar") != null && request.getParameter("auditoria_administrativos_id").equals(String.valueOf(usuario.getId())) ){
        
        Part archivoPart = request.getPart("pdf");
        byte[] datosArchivo = null;
        if (archivoPart != null) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            InputStream inputStream = archivoPart.getInputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }

            datosArchivo = byteArrayOutputStream.toByteArray(); // Archivo como byte[]
        }
        String mensaje = "";
        
        
        if(proyecto.getId()== 0 ){
            mensaje = proyectosBean.insertarProyectos(request,datosArchivo);
        }else{
            mensaje = proyectosBean.actualizarProyectos(request,datosArchivo);
        }
        proyecto.setCarreras_sid(request.getParameter("carreras_sid"));
        proyecto.setTipo_proyectos_id( Integer.valueOf(request.getParameter("tipo_proyectos_id")) );
        proyecto.setTutores_id( Integer.valueOf(request.getParameter("tutores_id")) );
        proyecto.setEstudiantes_id( Integer.valueOf(request.getParameter("estudiantes_id")) );
        proyecto.setTitulo(request.getParameter("titulo"));
        proyecto.setAnio_defensa(Integer.valueOf( request.getParameter("anio_defensa")) );
        proyecto.setDescripcion(request.getParameter("descripcion"));
        proyecto.setResumen(request.getParameter("resumen"));
        //proyecto.setPdf(request.getParameter("pdf"));
        //proyecto.setActivo( Integer.valueOf(request.getParameter("activo")) );
        proyecto.setAuditoria_administrativos_id( Integer.valueOf(request.getParameter("auditoria_administrativos_id")) );
        proyecto.setAuditoria_descripcion(request.getParameter("auditoria_descripcion"));

        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }else if(request.getParameter("registrar") != null){
        out.print("<h1 style='color:red'>Usted no se encuentra registrado en el sistema</h1>"); 
    }
%>
<h1><%=subtitulo%></h1>
<form method="post" enctype = "multipart/form-data">
    <input type="hidden" name="auditoria_administrativos_id" value="<%=usuario.getId()%>">
    <table>
        <tr>
            <td>Carrera Que Pertence el proyecto</td>
            <td>
                <select name="carreras_sid">
                    <option value="0">Seleccione Carrera</option>
                    <%for (Carrera item : carreraBean.listaCarreras() ) {%>
                    <option value="<%=item.getSid()%>" <%=item.getSid().equalsIgnoreCase(proyecto.getCarreras_sid()) ? "selected" : ""%>><%=item.getNombre()%></option>
                    <%}%>
                </select>
            </td>
        </tr>
        <tr>
            <td>Tipo de Proyecto</td>
            <td>
                <select name="tipo_proyectos_id">
                    <option value="0">Seleccione Tipo de Proyecto</option>
                    <%for (Tipo_proyecto item : tipo_proyectoBean.listaTipo_proyectos()) {%>
                    <option value="<%=item.getId()%>" <%=item.getId() == proyecto.getTipo_proyectos_id() ? "selected" : ""%>><%=item.getTipo()%></option>
                    <%}%>
                </select>
            </td>
        </tr>
        <tr>
            <td>Tutor</td>
            <td>
                <select name="tutores_id">
                    <option value="0">Seleccione Tutor</option>
                    <%for (Tutor item : tutorBean.listaTutores() ) {%>
                    <option value="<%=item.getId()%>" <%=item.getId() == proyecto.getTutores_id() ? "selected" : ""%>><%=item.getNombres()%></option>
                    <%}%>
                </select>
            </td>
        </tr>
        <tr>
            <td>Estudiante</td>
            <td>
                <select name="estudiantes_id">
                    <option value="0">Seleccione Estudiante</option>
                    <%for (Estudiante item : estudianteBean.listaEstudiantes() ) {%>
                    <option value="<%=item.getId()%>" <%=item.getId() == proyecto.getEstudiantes_id() ? "selected" : ""%>><%=item.getNombres()%></option>
                    <%}%>
                </select>
            </td>
        </tr>
        <tr>
            <td>Titulo de proyecto:</td>
            <td><input type="text" name="titulo" value="<%=proyecto.getTitulo()%>" /></td>
        </tr>
        <tr>
            <td>Año de Defensa:</td>
            <td><input type="number" name="anio_defensa" value="<%=proyecto.getAnio_defensa()%>" /></td>
        </tr>
        <tr>
            <td>Descripcion de proyecto:</td>
            <td>
                <textarea name="descripcion" rows="3"><%=proyecto.getDescripcion()%></textarea>
            </td>
        </tr>
        <tr>
            <td>Resumen de proyecto:</td>
            <td>
                <textarea name="resumen" rows="10"><%=proyecto.getResumen()%></textarea>
            </td>
        </tr>
        <tr>
            <td>PDF de proyecto:</td>
            <td><input type="file" name="pdf" /></td>
        </tr>            
        <tr>
            <td>Descripcion de Auditoria:</td>
            <td><input type="text" name="auditoria_descripcion" required /></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="registrar" value="Guardar" />
            </td>
        </tr>
    </table>
</form>
<jsp:include page="/WEB-INF/jspf/footer.jsp" /> 
