<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 19/11/2021, 07:15:10 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<cliente> Lista= (List<cliente>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html>
    <head>
        
<script src="sessionTimeout.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <<link rel="stylesheet" href="css/consultar.css?v=<%= System.currentTimeMillis() %>">

    </head>
    <body>
        <div class="header-box">
            <h1>Consultar cliente</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        <div class="welcome-box">
        <table>
              
                <c:forEach var="campo" items="${Lista}">
                <tr>
                    <td>Id Cliente</td>
                    <td>${campo.id}</td>
                </tr>
                <tr>
                    <td>Apellidos</td>
                    <td>${campo.apellidos}</td>
                </tr>
                <tr>
                    <td>Nombres</td>
                    <td>${campo.nombres}</td>
                </tr>     
                <tr>
                    <td>DNI</td>
                    <td>${campo.DNI}</td>
                </tr>        
                <tr>
                    <td>Dirección</td>
                    <td>${campo.direccion}</td>
                </tr>  
                <tr>
                    <td>Teléfono</td>
                    <td>${campo.telefono}</td>
                </tr>                 
                <tr>
                    <td>Móvil</td>
                    <td>${campo.movil}</td>
                </tr>                 
                </c:forEach>
        </table>
        </div>
    </body>
</html>