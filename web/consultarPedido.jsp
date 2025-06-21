<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 19/11/2021, 07:15:10 PM
    Author     : javie
--%>

<%@page import="java.util.List"%>
<%@page import="Entidades.detallePedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<detallePedido> Lista= (List<detallePedido>) request.getAttribute("Lista");
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
            <h1>Consulta de pedido</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        <table border="1">
              
            <c:forEach var="campo" items="${Lista}">
                <tr>
                    <td>Id Pedido</td>
                    <td>${campo.getId_Pedido()}</td>
                </tr>
                <tr>
                    <td>Id Producto</td>
                    <td>${campo.getId_Prod()}</td>
                </tr>
                <tr>
                    <td>Descripción</td>
                    <td>${campo.getDescripcion()}</td>
                </tr>     
                <tr>
                    <td>Cantidad</td>
                    <td>${campo.getCantidad()}</td>
                </tr>        
                <tr>
                    <td>Precio</td>
                    <td>${campo.getPrecio()}</td>
                </tr>  
                <tr>
                    <td>Total Detalle</td>
                    <td>${campo.getTotalDeta()}</td>
                </tr>                
            </c:forEach>
        </table>

    </body>
</html>