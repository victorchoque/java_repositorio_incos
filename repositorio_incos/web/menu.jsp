<%-- 
    Document   : menu
    Created on : 3 abr de 2024, 17:20:23
    Author     : v3ct0r
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:include page="..." />--%>
<link rel="stylesheet" href="./simplecss.css"/>
<style>table{width:98%!important;margin:auto;}
    body{grid-template-columns: none;}
    table tr{
        vertical-align: top;
    }
    </style>
<ul>
            <li>
                <a href="listaPropietario.jsp"> listaPropietario</a>
            </li>
            <li>
                <a href="registrarPropietario.jsp"> registrarPropietario</a>
            </li>
            <li>
                <a href="buscarPropietario.jsp"> buscarPropietario</a>
            </li>
            <li>
                <a href="buscarMascotaPorPropietario.jsp"> buscarMascotaPorPropietario</a>
            </li>
            <li>
                <hr>
            </li>
            <li>
                <a href="listaClientes.jsp"> listaClientes.jsp</a>
            </li>
            <li>
                <a href="registrarCliente.jsp"> registrarCliente.jsp</a>
            </li>
            
            <li>
                <a href="admin/administrativosLista.jsp"> admin/administrativosLista.jsp</a>
            </li>
        </ul>