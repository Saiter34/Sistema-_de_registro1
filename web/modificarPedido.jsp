<%-- 
    Document   : modificarPedido
    Created on : 8 jun. 2025, 17:27:06
    Author     : Matiasjobeth
--%>

<%@page import="Entidades.pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    pedido Pedido = (pedido) request.getAttribute("Pedido");
%>
<!DOCTYPE html>
<html>
<head>
    <script src="sessionTimeout.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Pedido</title>
   <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <<link rel="stylesheet" href="css/panles.css"/>>

</head>
<body>
    <div class="container">
        <div class="header-box">
            <h1>Modificar pedido</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
            <p>Actualizar información del pedido N° <%= Pedido.getId_Pedido() %></p>
        </div>

        <form action="ControlerPedido" method="post">
            <input type="hidden" name="Op" value="Actualizar">
            <input type="hidden" name="Id_Pedido" value="<%= Pedido.getId_Pedido() %>">
            
            <!-- Información del Pedido -->
            <div class="form-section">
                <div class="section-title">Información del Pedido</div>
                
                <div class="form-row">
                    <label>Nro. Pedido:</label>
                    <input type="text" value="<%= Pedido.getId_Pedido() %>" class="readonly" readonly>
                </div>
                
                <div class="form-row">
                    <label>Cliente:</label>
                    <input type="text" value="<%= Pedido.getId_Cliente() %>" class="readonly" readonly>
                </div>
                
                <div class="form-row">
                    <label>Fecha Pedido:</label>
                    <input type="date" value="<%= Pedido.getFecha() %>" class="readonly" readonly>
                </div>
                
                <div class="form-row">
                    <label>Total Venta:</label>
                    <input type="text" value="S/. <%= String.format("%.2f", Pedido.getTotalVenta()) %>" class="readonly" readonly>
                </div>
            </div>

            <!-- Estado y Seguimiento -->
            <div class="form-section">
                <div class="section-title">Estado y Seguimiento</div>
                
                <div class="form-row">
                    <label>Estado:</label>
                    <select name="Estado" required>
                        <option value="Pendiente" <%= "Pendiente".equals(Pedido.getEstado()) ? "selected" : "" %>>Pendiente</option>
                        <option value="En Proceso" <%= "En Proceso".equals(Pedido.getEstado()) ? "selected" : "" %>>En Proceso</option>
                        <option value="Completado" <%= "Completado".equals(Pedido.getEstado()) ? "selected" : "" %>>Completado</option>
                        <option value="Entregado" <%= "Entregado".equals(Pedido.getEstado()) ? "selected" : "" %>>Entregado</option>
                        <option value="Anulado" <%= "Anulado".equals(Pedido.getEstado()) ? "selected" : "" %>>Anulado</option>
                    </select>
                </div>
                
                <div class="form-row">
                    <label>Fecha Entrega:</label>
                    <input type="date" name="FechaEntrega" 
                           value="<%= Pedido.getFechaEntrega() != null ? Pedido.getFechaEntrega().toString() : "" %>">
                </div>
                
                <div class="form-row">
                    <label>Observaciones:</label>
                    <textarea name="Observaciones" placeholder="Ingrese observaciones del pedido..."><%= Pedido.getObservaciones() != null ? Pedido.getObservaciones() : "" %></textarea>
                </div>
            </div>

            <!-- Información de Entrega -->
            <div class="form-section">
                <div class="section-title">Información de Entrega</div>
                
                <div class="form-row">
                    <label>Dirección:</label>
                    <input type="text" name="DireccionEntrega" 
                           value="<%= Pedido.getDireccionEntrega() != null ? Pedido.getDireccionEntrega() : "" %>"
                           placeholder="Ingrese dirección de entrega">
                </div>
                
<%
    String fechaEntregaFormateada = "";
    if (Pedido.getFechaEntrega() != null) {
        fechaEntregaFormateada = Pedido.getFechaEntrega().toString();
    }
%>

<div class="form-row">
    <label>Fecha Entrega:</label>
    <input type="date" name="FechaEntrega" value="<%= fechaEntregaFormateada %>">
</div>
            </div>

            <!-- Botones -->
            <div class="buttons">
                <button type="submit" class="btn btn-primary">
                    💾 Guardar Cambios
                </button>
                <a href="ControlerPedido?Op=Listar" class="btn btn-secondary">
                    ↩️ Volver al Listado
                </a>
            </div>
        </form>
    </div>

    <script>
        // Validación de fecha de entrega
        document.querySelector('input[name="FechaEntrega"]').addEventListener('change', function() {
            const fechaPedido = new Date('<%= Pedido.getFecha() %>');
            const fechaEntrega = new Date(this.value);
            
            if (fechaEntrega < fechaPedido) {
                alert('La fecha de entrega no puede ser anterior a la fecha del pedido');
                this.value = '';
            }
        });

        // Cambio de color según estado
        document.querySelector('select[name="Estado"]').addEventListener('change', function() {
            this.className = '';
            switch(this.value) {
                case 'Completado':
                case 'Entregado':
                    this.className = 'status-active';
                    break;
                case 'Pendiente':
                case 'En Proceso':
                    this.className = 'status-pending';
                    break;
                case 'Anulado':
                    this.className = 'status-cancelled';
                    break;
            }
        });

        // Trigger inicial
        document.querySelector('select[name="Estado"]').dispatchEvent(new Event('change'));
    </script>
</body>
</html>