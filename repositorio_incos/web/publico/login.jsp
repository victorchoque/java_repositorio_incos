<%-- 
    Document   : login
    Created on : 17 abr de 2024, 03:44:49
    Author     : v3ct0r
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="${contextPath}/assets/login_page/style.css"/>
        
    </head>
    <body>
        <img class="wave" src="${contextPath}/assets/login_page/img/wave.png">
	<div class="container">
            
            <div class="img">
                <img src="${contextPath}/assets/login_page/img/bg.svg">
            </div>
            <div class="login-content">
                               
                <form action="${contextPath}/login" method="post">
                    <img src="${contextPath}/assets/login_page/img/avatar.svg">
                    <h2 class="title">Bienvenido</h2>
                    <% if(request.getParameter("error")!=null){%>
                        <div class="alert alert-danger"><%=request.getParameter("error")%></div>
                    <% }%> 
                    <div class="input-div one">
                       <div class="i">
                            <i class="fas fa-user"></i>
                       </div>
                       <div class="div">
                            <h5>Nombre de usuario</h5>
                            <input name="username" type="text" class="input">
                       </div>
                    </div>
                    <div class="input-div pass">
                       <div class="i"> 
                            <i class="fas fa-lock"></i>
                       </div>
                       <div class="div">
                            <h5>Contraseña</h5>
                            <input name="password" type="password" class="input">
                        </div>
                    </div>
                    <input type="submit" class="btn" value="Ingresar">
                </form>
            </div>
        </div>
        <script src="${contextPath}/assets/login_page/main.js" type="text/javascript" ></script>
    </body>
</html>
