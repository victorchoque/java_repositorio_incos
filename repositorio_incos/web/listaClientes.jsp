<%-- 
    Document   : listaClientes.jsp
    Created on : 16 abr de 2024, 17:06:11
    Author     : v3ct0r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ListaClientes</title>
    </head>
    <body>
        <jsp:useBean id="clienteBean" scope="session"  class="bean.ClienteBean"/>
        <table border="1" style="width:99%">            
            <tbody>
                <tr>
                    <td>
                       <jsp:include page="./menu.jsp" /> 
                    </td>
                    <td>
                        
                        <h1>Lista Propietarios</h1>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Cedula </th>
                                    <th>Expedido</th>
                                    <th>paterno</th>
                                    <th>MATERNO</th>
                                    <th>nombre</th>
                                    <th>Direccion</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%=clienteBean.listaDeClientes()%>
                            </tbody>
                        </table>
                        <a href="index.jsp" >Index</a>
                        
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
