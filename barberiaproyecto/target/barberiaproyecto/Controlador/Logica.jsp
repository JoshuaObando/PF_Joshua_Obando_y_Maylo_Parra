<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ include file="../Modelo/Conexion.jsp" %>

<%
    String iniciarSesion = request.getParameter("Iniciar-sesion");
    String crearCuenta = request.getParameter("Crear-cuenta");

    Connection con = (Connection) application.getAttribute("conexion");

    if (iniciarSesion != null) {
        // Lógica para iniciar sesión
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (con != null) {
            String sqlconsulta = "SELECT * FROM usuarios WHERE email = ? AND password = ?";
            try (PreparedStatement pst = con.prepareStatement(sqlconsulta)) {
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                    // Verifica si el usuario es un administrador
                    if ("JefeAdministrador@gmail.com".equals(rs.getString("email")) && "JefeAdministrador777".equals(rs.getString("password"))) {
                        response.sendRedirect("../Vista/Jefe.jsp");
                    } else {
                        response.sendRedirect("../Vista/Cliente.jsp");
                    }
                } else {
                    out.println("<p style='color:red;'>Credenciales incorrectas</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Error en la consulta: " + e.getMessage());
            }
        } else {
            out.println("No se pudo establecer la conexión a la base de datos.");
        }
    } else if (crearCuenta != null) {
        // Lógica para crear cuenta
        String email = request.getParameter("email2");
        String password = request.getParameter("password2");

        if (con != null) {
            try {
                // Verificar si el usuario ya existe
                String sqlCheck = "SELECT email FROM usuarios WHERE email = ?";
                try (PreparedStatement psCheck = con.prepareStatement(sqlCheck)) {
                    psCheck.setString(1, email);
                    ResultSet rs = psCheck.executeQuery();

                    if (rs.next()) {
                        out.println("<p style='color:red;'>El correo electrónico ya está registrado.</p>");
                    } else {
                        // Insertar el nuevo usuario en la base de datos
                        String sqlInsert = "INSERT INTO usuarios (email, password) VALUES (?, ?)";
                        try (PreparedStatement psInsert = con.prepareStatement(sqlInsert)) {
                            psInsert.setString(1, email);
                            psInsert.setString(2, password);

                            int result = psInsert.executeUpdate();
                            if (result > 0) {
                                out.println("<p style='color:green;'>Registro exitoso. Ahora puedes iniciar sesión.</p>");
                            } else {
                                out.println("<p style='color:red;'>Error en el registro. Inténtalo de nuevo.</p>");
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("No se pudo establecer la conexión a la base de datos.");
        }
    }
%>