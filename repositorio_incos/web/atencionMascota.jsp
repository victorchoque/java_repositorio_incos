<%-- 
    Document   : atencionMascota
    Created on : 02-abr-2024, 22:05:51
    Author     : incos
--%>

<%@page import="pojo.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="atencionBean" scope="session" class="bean.AtencionBean" />
        <jsp:useBean id="mascotaBean" scope="session" class="bean.MascotasBean" />
<%
    if(request.getParameter("registrar") != null ){
        
        String mensaje = atencionBean.insertarAtencion(request);
        mensaje = "<h1>" + mensaje +"</h1>";
        out.print(mensaje);
    }
    Mascota mascota = mascotaBean.getDesdeId(Integer.parseInt(request.getParameter("id_mascota")));
    String atencionTabla = atencionBean.listarAtenciones(Integer.parseInt(request.getParameter("id_mascota")));
%>        
<h1>ATENCION para <%=mascota.getNomMascota()%></h1>
        

       
        <table border="1" cellpadding="1" cellspacing="0">
            <thead>
            <th>id_mascota</th>
            <th> procedimiento</th>
            <th>medicacion</th><th>laboratorio</th><th>fecha_atencion</th><th>costo </th>
            </thead>
            <tbody>
                <%=atencionTabla%>
            </tbody>

        </table>
            
           <h1>Registrar atencion</h1>  
            <form method="post">
        <table>
            <thead>
                
            </thead>
            <tbody>
            <tr>
                <td>procedimiento</td>
                <td>
                    <textarea name="procedimiento"></textarea>
                </td>
            </tr>
            <tr>
                <td>laboratorio</td>
                <td>
                    <textarea name="laboratorio"></textarea>
                </td>
            </tr>
            <tr>
                <td>medicacion</td>
                <td>
                    <textarea name="medicacion"></textarea>
                </td>
            </tr>
                        <tr>
                <td>fecha atencion</td>
                <td>
                    <input type="date" name="fechaatencion"/>
                </td>
            </tr>
            </tr>
                        <tr>
                <td>costo</td>
                <td>
                    <input type="number" name="costo"/>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <th colspan="2">
                    <input type="submit" value="registrar" style="color:green" name="registrar" />                                        
                </th>
            </tr>
            </tfoot>
        </table>
        </form>
    </body>
</html>
