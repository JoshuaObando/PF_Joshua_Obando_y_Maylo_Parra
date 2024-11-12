<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../Modelo/Conexion.jsp" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>

<%
String cedula = request.getParameter("cedula");
String barbero = request.getParameter("barber");
String servicio = request.getParameter("service");

Conexion objetocon = new Conexion();
Connection con = objetocon.getConnection();

if (con != null){
    String sqlInsert = "CALL InsertarCita(?, ?, ?);";
    try (PreparedStatement psInsert = con.prepareStatement(sqlInsert)) {
        psInsert.setString(1, cedula);
        psInsert.setString(2, barbero);
        psInsert.setString(3, servicio);

        int result = psInsert.executeUpdate();
        if (result > 0) {
            out.println("<p style='color:green;'>Cita reservada con exito.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>Error en la reserva de cita: " + e.getMessage() + "</p>");
    }
} else {
    out.println("No se pudo establecer la conexión a la base de datos.");
}
    %>