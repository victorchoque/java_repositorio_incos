<%-- 
    Document   : listaPropietario
    Created on : 05-mar-2024, 21:45:13
    Author     : incos
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de propietarios</title>
    </head>
    <body>
        <jsp:useBean id="propietarioBean" scope="session"  class="bean.PropietarioBean"/>
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
                                    <th>Carnet </th>
                                    <th>NOMBRE</th>
                                    <th>PATERNO</th>
                                    <th>MATERNO</th>
                                    <th>DIRECCION</th>
                                    <th>TELEFONO</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%=propietarioBean.listarPropietarios()%>
                            </tbody>
                        </table>
                        <a href="index.jsp" >Index</a>
                        
                    </td>
                </tr>
            </tbody>
        </table>

        
        
        
        
    </body>
</html>
