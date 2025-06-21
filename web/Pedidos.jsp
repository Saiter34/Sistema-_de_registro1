<%-- 
    Document   : Pedidos
    Created on : 12/10/2022, 05:11:15 PM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos - Sistema de Gestión</title>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <<link rel="stylesheet" href="css/panles.css"/>>
        <script src="sessionTimeout.js"></script>
    </head>
    <%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  
            if (session.getAttribute("user")==null){
                response.sendRedirect("login.jsp");
            }
    %>
    <body>
        <div class="header-box">
            <h1>Menú de pedidos</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
            <a href="ControlerPedido?Op=Listar" class="menu-item">Listar Pedidos</a>
            <a href="ControlerPedido?Op=Nuevo" class="menu-item">Nuevo Pedido</a>
            
          
    </body>
</html>