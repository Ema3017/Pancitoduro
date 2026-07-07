CREATE DATABASE IF NOT EXISTS pancitoduro_db;
USE pancitoduro_db;

-- 1. Tabla de Usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabla de Productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pan VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio_original DECIMAL(5,2) NOT NULL,
    precio_oferta DECIMAL(5,2) NOT NULL,
    stock INT NOT NULL,
    nivel_frescura VARCHAR(50) DEFAULT 'Excelente'
);

-- 3. Tabla de Pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_producto INT,
    cantidad INT NOT NULL,
    total_pagar DECIMAL(6,2) NOT NULL,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE
);

-- 4. Insertar datos de prueba
INSERT INTO productos (nombre_pan, descripcion, precio_original, precio_oferta, stock, nivel_frescura) 
VALUES 
('Hogaza de Masa Madre', 'Recuperado - Hornada de las 06:00 con harinas de proximidad.', 6.00, 4.50, 5, 'Excelente'),
('Pack de 4 Croissants', 'Mantequilla de Normandía, horneado lento.', 8.50, 6.20, 3, 'Bueno'),
('Baguette Tradición', 'Harina de piedra orgánica.', 2.50, 1.80, 8, 'Excelente');

SELECT * FROM productos;