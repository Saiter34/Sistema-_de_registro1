<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listar
    Created on : 17/09/2022, 10:54:58 AM
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
        <<link rel="stylesheet" href="css/lista.css"/>>
    </head>
    <body>
   
        <div class="header-box">
            <h1>Listado de clientes</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        <table border="1">
                <tr>
                    <td>Id Cliente</td>
                    <td>Apellidos</td>
                    <td>Nombres</td>
                    <td>DNI</td>
                </tr>
                
                <c:forEach var="campo" items="${Lista}">
                <tr>
                    <td>${campo.id}</td>
                    <td>${campo.apellidos}</td>
                    <td>${campo.nombres}</td>
                    <td>${campo.DNI}</td>
                    <td><a href="ControlerCliente?Op=Consultar&Id=${campo.id}">Consultar</a></td>
                    <td><a href="ControlerCliente?Op=Modificar&Id=${campo.id}">Modificar</a></td>
                    <td><a href="ControlerCliente?Op=Eliminar&Id=${campo.id}">Eliminar</a></td>
                </tr>
                </c:forEach>
                
        </table> 
    </body>
</html>
