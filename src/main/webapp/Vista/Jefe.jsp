<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion barberia</title>
    <link rel="stylesheet" href="Estilo/style.css">
</head>
<body class="Jefe">
    <header class="headerJefe">
        <p>Barberia The<span class="dorado">Man</span></p>
        <h1>Bienvenido administrador</h1>
    </header>
    

    <!-- CRUD para Servicios -->
    <section>
        <h2>Gestión de Servicios</h2>
        <!-- Formulario para Actualizar Servicio -->
        <form action="" method="post">
            <h3>Actualizar Servicio</h3>
            <input type="number" name="id_servicio" placeholder="ID del Servicio" required>
            <input type="text" name="nombre" placeholder="Nombre del Servicio" required>
            <input type="number" name="precio" placeholder="Precio" required>
            <button type="submit">Actualizar Servicio</button>
        </form>

        <!-- Formulario para Eliminar Servicio -->
        <form action="" method="post">
            <h3>Eliminar Servicio</h3>
            <input type="number" name="id_servicio" placeholder="ID del Servicio" required>
            <button type="submit">Eliminar Servicio</button>
        </form>
    </section>

    <!-- CRUD para Citas -->
    <section>
        <h2>Gestión de Citas</h2>

        <!-- Formulario para Actualizar Cita -->
        <form action="" method="post">
            <h3>Actualizar Cita</h3>
            <input type="number" name="id_cita" placeholder="ID de la Cita" required>
            <input type="text" name="cedula_cliente" placeholder="Cédula del Cliente" required>
            <input type="number" name="codigo_barbero" placeholder="Código del Barbero" required>
            <input type="number" name="id_servicio" placeholder="ID del Servicio" required>
            <input type="datetime-local" name="fecha_hora" placeholder="Fecha y Hora" required>
            <button type="submit">Actualizar Cita</button>
        </form>

        <!-- Formulario para Eliminar Cita -->
        <form action="" method="post">
            <h3>Eliminar Cita</h3>
            <input type="number" name="id_cita" placeholder="ID de la Cita" required>
            <button type="submit">Eliminar Cita</button>
        </form>
    </section>



    <!-- Consultar Servicios y Citas -->
    <section>
        <h2>Consultar Datos</h2>

        <!-- Botón para Ver Servicios -->
        <form action="" method="post">
            <button type="submit">Ver Todos los Servicios</button>
        </form>

        <!-- Botón para Ver Citas -->
        <form action="" method="post">
            <button type="submit">Ver Todas las Citas</button>
        </form>
    </section>

</body>
</html>
