<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : listar
    Created on : 17/09/2022, 10:54:58 AM
    Author     : javie
--%>
<%@page import="java.util.List"%>
<%@page import="Entidades.pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<pedido> Lista = (List<pedido>) request.getAttribute("Lista");
%>
<!DOCTYPE html>
<html>
<head>
    <script src="sessionTimeout.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Pedidos</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
    <<link rel="stylesheet" href="css/lista.css"/>>
</head>
<body>
    <div class="container">
         <div class="header-box">
            <h1>Listado de clientes</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 

        <div class="menu-buttons">
            <a href="Pedidos.jsp" class="menu-btn">Menú Principal</a>
            <a href="ControlerPedido?Op=Nuevo" class="menu-btn">Nuevo Pedido</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cliente</th>
                    <th>Apellidos</th>
                    <th>Nombres</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th>Total</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="campo" items="${Lista}">
                <tr>
                    <td><strong>${campo.getId_Pedido()}</strong></td>
                    <td>${campo.getId_Cliente()}</td>
                    <td>${campo.getApellidos()}</td>
                    <td>${campo.getNombres()}</td>
                    <td>${campo.getFecha()}</td>
                    <td>
                        <c:choose>
                            <c:when test="${campo.getEstado() == 'Activo' || campo.getEstado() == null}">
                                <span class="status status-activo">Activo</span>
                            </c:when>
                            <c:when test="${campo.getEstado() == 'Pendiente'}">
                                <span class="status status-pendiente">Pendiente</span>
                            </c:when>
                            <c:when test="${campo.getEstado() == 'Completado'}">
                                <span class="status status-completado">Completado</span>
                            </c:when>
                            <c:when test="${campo.getEstado() == 'Entregado'}">
                                <span class="status status-entregado">Entregado</span>
                            </c:when>
                            <c:when test="${campo.getEstado() == 'Anulado'}">
                                <span class="status status-anulado">Anulado</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status status-activo">${campo.getEstado()}</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="total-amount">S/. ${String.format("%.2f", campo.getTotalVenta())}</td>
                    <td>
                        <a href="ControlerPedido?Op=Consultar&Id=${campo.getId_Pedido()}" 
                           class="btn btn-info" title="Ver detalles">
                             Consultar
                        </a>
                        <a href="ControlerPedido?Op=Modificar&Id=${campo.getId_Pedido()}" 
                           class="btn btn-warning" title="Modificar pedido">
                             Modificar
                        </a>
                        <c:if test="${campo.getEstado() != 'Anulado'}">
                            <a href="ControlerPedido?Op=Eliminar&Id=${campo.getId_Pedido()}" 
                               class="btn btn-danger" title="Anular pedido"
                               onclick="return confirm('¿Está seguro de anular este pedido?')">
                                Anular
                            </a>
                        </c:if>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:if test="${empty Lista}">
            <div style="text-align: center; padding: 50px; color: #666;">
                <h3>📭 No hay pedidos registrados</h3>
                <p>Comience creando un nuevo pedido</p>
                <a href="ControlerPedido?Op=Nuevo" class="menu-btn">Crear Primer Pedido</a>
            </div>
        </c:if>
    </div>

    <script>
        // Confirmar eliminación
        function confirmarEliminacion(id) {
            if (confirm('¿Está seguro de que desea anular el pedido ' + id + '?')) {
                window.location.href = 'ControlerPedido?Op=Eliminar&Id=' + id;
            }
        }

        // Resaltar filas según estado
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('tbody tr');
            rows.forEach(row => {
                const statusCell = row.querySelector('.status');
                if (statusCell) {
                    if (statusCell.textContent.includes('Anulado')) {
                        row.style.opacity = '0.6';
                    }
                }
            });
        });
    </script>
</body>
</html>
