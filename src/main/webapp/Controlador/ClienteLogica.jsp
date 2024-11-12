<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ include file="../Modelo/Conexion.jsp" %>

<%
String cedula = request.getParameter("cedula");
String codigobarbero = "";
String servicio = "";

// Definir el código del barbero basado en el nombre seleccionado
if ("carlos".equals(request.getParameter("barber"))) {
    codigobarbero = "C355";
} else if ("miguel".equals(request.getParameter("barber"))) {
    codigobarbero = "C354";
} else if ("david".equals(request.getParameter("barber"))) {
    codigobarbero = "C353";
}

// Definir el servicio basado en la opción seleccionada
if ("corte".equals(request.getParameter("service"))) {
    servicio = "1";
} else if ("corte-barba".equals(request.getParameter("service"))) {
    servicio = "2";
} else if ("afeitado".equals(request.getParameter("service"))) {
    servicio = "3";
}

// Mostrar los datos en pantalla para depuración
out.println("<p>Recibido: Cedula=" + cedula + ", Barbero=" + codigobarbero + ", Servicio=" + servicio + "</p>");

Connection con = (Connection) application.getAttribute("conexion");
if (con != null) {
    String sqlInsert = "CALL InsertarCita(?, ?, ?);";
    try (PreparedStatement psInsert = con.prepareStatement(sqlInsert)) {
        psInsert.setString(1, cedula);
        psInsert.setString(2, codigobarbero);
        psInsert.setString(3, servicio);

        int result = psInsert.executeUpdate();
        if (result > 0) {
            out.println("<p style='color:green;'>Cita reservada con éxito.</p>");
        } else {
            out.println("<p style='color:red;'>Error: No se insertó la cita.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>Error en la reserva de cita: " + e.getMessage() + "</p>");
    }
} else {
    out.println("<p style='color:red;'>No se pudo establecer la conexión a la base de datos.</p>");
}
%>