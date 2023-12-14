import Foundation

func iniciarSesion(usuario: String, pass: String) {
    // Verificación de credenciales (simulada)
    print("iniciarSesion")
    if verificarCredenciales(usuario: usuario, password: pass) {
        // Registro de inicio de sesión (ERROR: incluye información sensible en el registro)
        print("exito a log")
        registrarEnArchivoDeLog("Inicio de sesión exitoso para el usuario: \(usuario)")
        // Resto del código para la sesión iniciada...
    } else {
        // Registro de intento fallido (ERROR: incluye información sensible en el registro)
        print("fallo a log")
        registrarEnArchivoDeLog("Intento de inicio de sesión fallido para el usuario: \(usuario)")
        // Resto del código para el manejo de inicio de sesión fallido...
    }
}

func verificarCredenciales(usuario: String, password: String) -> Bool {
    // Validación simulada (¡Este es solo un ejemplo y no debe utilizarse en un entorno real!)
    return usuario == "usuario_seguro" && password == "password_segura"
}

func registrarEnArchivoDeLog(_ mensaje: String) {
    // Registro en un archivo de log (ERROR: incluye información sensible en el registro)
    let rutaArchivoLog = obtenerRutaDelArchivoDeLog()
    print(rutaArchivoLog)
    do {
        try mensaje.appendLineToURL(fileURL: rutaArchivoLog)
    } catch {
        print("Error al escribir en el archivo de log: \(error)")
    }
}

func obtenerRutaDelArchivoDeLog() -> URL {
    // Ruta ficticia para el archivo de log (solo para fines demostrativos)
    // En un entorno real, se debe especificar una ubicación segura y adecuada para el archivo de log.
    let directorioDocumentos = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    return directorioDocumentos.appendingPathComponent("archivo_log.txt")
}

extension String {
    // Extensión para agregar una línea a un archivo
    func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }

    // Extensión para agregar texto a un archivo
    func appendToURL(fileURL: URL) throws {
        try self.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    }
}

// Ejemplo de uso
let usuarioIngresado = "usuario_seguro"
// let passIngresada = "password_segura"
let passIngresada = "password"
iniciarSesion(usuario: usuarioIngresado, pass: passIngresada)
