<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ include file="../Modelo/Conexion.jsp" %>

<%
    Connection con = (Connection) application.getAttribute("conexion");

    // Recibir el valor de "action" para decidir qué operación realizar
    String action = request.getParameter("action");

    if ("actualizarCita".equals(action)) {
        // Lógica para Actualizar Cita
        String id_cita = request.getParameter("id_cita");
        String cedula_cliente = request.getParameter("cedula_cliente");
        String codigo_barbero = request.getParameter("codigo_barbero");
        String id_servicio = request.getParameter("id_servicio");
        String fecha = request.getParameter("date");
        String hora = "";

        if("9:00".equals(request.getParameter("time"))){
            hora = "09:00:00";
        } else if("10:00".equals(request.getParameter("time"))){
            hora = "10:00";
        } else if("11:00".equals(request.getParameter("time"))){
            hora = "11:00";
        } else if("12:00".equals(request.getParameter("time"))){
            hora = "12:00";
        } else if("13:00".equals(request.getParameter("time"))){
            hora = "13:00";
        } else if("14:00".equals(request.getParameter("time"))){
            hora = "14:00";
        } else if("15:00".equals(request.getParameter("time"))){
            hora = "15:00";
        } else if("16:00".equals(request.getParameter("time"))){
            hora = "16:00";
        } else if("17:00".equals(request.getParameter("time"))){
            hora = "17:00";
        } else if("18:00".equals(request.getParameter("time"))){
            hora = "18:00";
        } else if("19:00".equals(request.getParameter("time"))){
            hora = "19:00";
        } else if("20:00".equals(request.getParameter("time"))){
            hora = "20:00";
        }

        try {
            String sql = "CALL Actualizarcita(?,?,?,?,?,?);";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id_cita);
            pst.setString(2, cedula_cliente);
            pst.setString(3, codigo_barbero);
            pst.setString(4, id_servicio);
            pst.setString(5, fecha);
            pst.setString(6, hora);
            pst.executeUpdate();
            out.println("<p style='color:green;'>Cita actualizada correctamente.</p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error al actualizar la cita: " + e.getMessage() + "</p>");
        }

    } else if ("eliminarCita".equals(action)) {
        // Lógica para Eliminar Cita
        String id_cita = request.getParameter("id_cita");

        try {
            String sql = "CALL EliminarCita(?);";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id_cita);
            int result = pst.executeUpdate();
            if (result > 0) {
                out.println("<p style='color:green;'>Cita eliminada correctamente.</p>");
            } else {
                out.println("<p style='color:red;'>Error al eliminar la cita.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error al eliminar la cita: " + e.getMessage() + "</p>");
        }

    } else if ("agregarServicio".equals(action)) {
        // Lógica para Agregar Servicio
        String id_servicio = request.getParameter("id_servicio");
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");

        try {
            String sql = "CALL agregarServicio(?,?,?);";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id_servicio);
            pst.setString(2, nombre);
            pst.setString(3, precio);
            int result = pst.executeUpdate();
            if (result > 0) {
                out.println("<p style='color:green;'>Servicio agregado correctamente.</p>");
            } else {
                out.println("<p style='color:red;'>Error al agregar el servicio.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error desde catch: " + e.getMessage() + "</p>");
        }

    } else if ("actualizarServicio".equals(action)) {
        // Lógica para Actualizar Servicio
        String id_servicio = request.getParameter("id_servicio");
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");

        try {
            String sql = "CALL Actualizarservicio(?, ?, ?);";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id_servicio);
            pst.setString(2, nombre);
            pst.setString(3, precio);
            pst.executeUpdate();
            out.println("<p style='color:green;'>Servicio actualizado correctamente.</p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error al actualizar el servicio: " + e.getMessage() + "</p>");
        }

    } else if ("eliminarServicio".equals(action)) {
        // Lógica para Eliminar Servicio
        String id_servicio = request.getParameter("id_servicio");

        try {
            String sql = "CALL EliminarServicio(?);";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, id_servicio);
            int result = pst.executeUpdate();
            if (result > 0) {
                out.println("<p style='color:green;'>Servicio eliminado correctamente.</p>");
            } else {
                out.println("<p style='color:red;'>Error al eliminar el servicio.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error al eliminar el servicio: " + e.getMessage() + "</p>");
        }

    } else if ("verCitas".equals(action)) {
        // Lógica para Ver Citas
        try {
            String sql = "CALL VerCitas();";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            out.println("<h2>Lista de Citas</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>ID Cita</th><th>Cedula Cliente</th><th>Codigo Barbero</th><th>ID Servicio</th><th>Fecha</th><th>Hora</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("idcita") + "</td>");
                out.println("<td>" + rs.getString("Cedula") + "</td>");
                out.println("<td>" + rs.getString("CodigoBarbero") + "</td>");
                out.println("<td>" + rs.getString("idservicio") + "</td>");
                out.println("<td>" + rs.getString("Fecha") + "</td>");
                out.println("<td>" + rs.getString("Hora") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error al ver las citas: " + e.getMessage() + "</p>");
        }
    } else if ("verServicios".equals(action)) {
        // Lógica para Ver Servicios
        try {
            String sql = "CALL VerServicios();";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            out.println("<h2>Lista de Servicios</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>ID Servicio</th><th>Nombre</th><th>Precio</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("idervicio") + "</td>");
                out.println("<td>" + rs.getString("Nombre") + "</td>");
                out.println("<td>" + rs.getString("Precio") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error al ver los servicios: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>Acción no válida.</p>");
    }
%>