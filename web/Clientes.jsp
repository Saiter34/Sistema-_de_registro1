<%-- 
    Document   : index
    Created on : 17/09/2022, 08:38:47 AM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>s
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes - Sistema de Gestión</title>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <<link rel="stylesheet" href="css/panles.css"/>>
            
        <!-- Sistema de Inactividad -->
        <script src="sessionTimeout.js"></script>
    </head>
    <%  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  
            if (session.getAttribute("user")==null){
                response.sendRedirect("login.jsp");
            }
    %>
    <body>
        <div class="header-box">
            <h1>Menú de clientes</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div>    
            <a href="ControlerCliente?Op=Listar" class="menu-item">Listar clientes</a>
            <a href="ControlerCliente?Op=Nuevo" class="menu-item">Nuevo cliente</a>
            
           
        
    </body>
</html>