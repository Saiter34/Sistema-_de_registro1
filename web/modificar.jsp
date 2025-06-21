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
        <<link rel="stylesheet" href="css/panles.css"/>>
    </head>
    <body>
        <div class="header-box">
            <h1>Modificar cliente</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        <form action="ControlerCliente" method="post">   
            <table border="1">
   
                <c:forEach var="campo" items="${Lista}">
                    <tr>
                        <td>Id Cliente</td>
                        <td>${campo.id}</td>
                        <input type="hidden" name="Id" value="${campo.id}">
                    </tr>
                    <tr>
                        <td>Apellidos</td>
                        <td><input type="text" name="apellidos" value="${campo.apellidos}"></td>
                    </tr>
                    <tr>
                        <td>Nombres</td>
                        <td><input type="text" name="nombres" value="${campo.nombres}"></td>
                    </tr>     
                    <tr>
                        <td>DNI</td>
                        <td><input type="text" name="DNI" value="${campo.DNI}"></td>
                    </tr>        
                    <tr>
                        <td>Dirección</td>
                        <td><input type="text" name="direccion" value="${campo.direccion}"></td>
                    </tr>  
                    <tr>
                        <td>Teléfono</td>
                        <td><input type="text" name="telefono" value="${campo.telefono}"></td>
                    </tr>                 
                    <tr>
                        <td>Móvil</td>
                        <td><input type="text" name="movil" value="${campo.movil}"></td>
                    </tr>                 
                </c:forEach>
            </table>
            <input type="submit" name="modificar" value="Modificar"> 
        </form>
    </body>
</html>
