
INSERT INTO generos (nombre_genero) VALUES
('Ficción'),
('No Ficción'),
('Ciencia Ficción'),
('Romántico'),
('Misterio'),
('Historia'),
('Terror'),
('Fantasía'),
('Biografía'),
('Drama');

INSERT INTO direcciones (nombre_direccion) VALUES
('Calle Falsa 123'),
('Avenida de la Libertad 456'),
('Calle del Sol 789'),
('Plaza Mayor 10'),
('Calle de la Paz 55'),
('Avenida de las Flores 21'),
('Calle del Río 88'),
('Boulevard Central 100'),
('Calle de la Luna 42'),
('Avenida Universitaria 7');

INSERT INTO miembros (num_documento, tipo_documento, nombre, apellido, fecha_nacimiento, fecha_inscripcion, id_direccion) VALUES
(12345678, 'DNI', 'Carlos', 'González', '1985-03-12', '2020-01-15', 1),
(87654321, 'DNI', 'Ana', 'Martínez', '1990-07-22', '2022-05-10', 2),
(11223344, 'DNI', 'Luis', 'Pérez', '1995-12-30', '2021-11-12', 3),
(44332211, 'DNI', 'Marta', 'Sánchez', '1982-02-25', '2020-06-22', 4),
(99887766, 'DNI', 'Juan', 'López', '1978-09-05', '2023-02-02', 5);

INSERT INTO autores (num_documento, tipo_documento, nombre, apellido, fecha_nacimiento, id_direccion) VALUES
(23456789, 'DNI', 'María', 'Fernández', '1980-08-11', 6),
(34567890, 'DNI', 'José', 'Ramírez', '1992-10-16', 7),
(45678901, 'DNI', 'Laura', 'Gómez', '1975-01-01', 8),
(56789012, 'DNI', 'Pedro', 'Jiménez', '1988-11-23', 9),
(67890123, 'DNI', 'Isabel', 'Ruiz', '1965-04-20', 10);

INSERT INTO libros (ISBN, titulo) VALUES
('978-3-16-148410-0', 'El Misterio de la Noche'),
('978-0-123-45678-9', 'Historia de la Ciencia'),
('978-1-234-56789-7', 'Amor y Magia'),
('978-2-345-67890-5', 'Sombras en el Bosque'),
('978-3-456-78901-2', 'Cuentos Cortos de Terror');

INSERT INTO libros_autores (ISBN, num_documento) VALUES
('978-3-16-148410-0', 23456789),
('978-0-123-45678-9', 34567890),
('978-1-234-56789-7', 45678901),
('978-2-345-67890-5', 56789012),
('978-3-456-78901-2', 67890123);

INSERT INTO editoriales (nom_editorial, id_direccion) VALUES
('Editorial Mundo', 1),
('Editorial Nova', 2),
('Editorial Lumen', 3),
('Editorial Epsilon', 4),
('Editorial Zenith', 5);

INSERT INTO editores (num_doc, tipo_documento, nombre, apellido, fecha_nacimiento, id_editorial, id_direccion) VALUES
(12345678, 'DNI', 'Raúl', 'Martínez', '1980-05-10', 1, 6),
(23456789, 'DNI', 'Carlos', 'Serrano', '1990-03-25', 2, 7),
(34567890, 'DNI', 'Lucía', 'González', '1985-08-30', 3, 8),
(45678901, 'DNI', 'Fernando', 'Ruiz', '1993-12-05', 4, 9),
(56789012, 'DNI', 'Beatriz', 'Pérez', '1975-06-12', 5, 10);

INSERT INTO publicaciones (ISBN, nombre_edicion, fecha_lanzamiento, disponibilidad) VALUES
('978-3-16-148410-0', 'Edición Especial', '2023-05-15', TRUE),
('978-0-123-45678-9', 'Primera Edición', '2020-03-10', TRUE),
('978-1-234-56789-7', 'Edición Limitada', '2022-07-18', FALSE),
('978-2-345-67890-5', 'Nueva Edición', '2021-10-10', TRUE),
('978-3-456-78901-2', 'Edición Original', '2019-11-25', TRUE);

INSERT INTO libros_generos (ISBN, id_genero) VALUES
('978-3-16-148410-0', 4),
('978-0-123-45678-9', 6),
('978-1-234-56789-7', 3),
('978-2-345-67890-5', 8),
('978-3-456-78901-2', 7);

INSERT INTO transacciones (num_documento, fecha_transaccion, tipo_transaccion) VALUES
(12345678, '2023-03-15', 'Préstamo'),
(87654321, '2023-04-10', 'Devolución'),
(11223344, '2023-02-12', 'Préstamo'),
(44332211, '2023-01-20', 'Préstamo'),
(99887766, '2023-05-05', 'Devolución');

INSERT INTO editores_publicaciones (id_publicacion, num_doc) VALUES
(1, 12345678),
(2, 23456789),
(3, 34567890),
(4, 45678901),
(5, 56789012);

INSERT INTO publicaciones_transacciones (id_publicacion, id_transaccion) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
