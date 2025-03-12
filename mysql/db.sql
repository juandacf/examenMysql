CREATE DATABASE examen;
USE examen;

CREATE TABLE IF NOT EXISTS generos(
    id_genero INTEGER  AUTO_INCREMENT,
    nombre_genero VARCHAR(100),
    PRIMARY KEY(id_genero)
);

CREATE TABLE IF NOT EXISTS direcciones(
    id_direccion INTEGER AUTO_INCREMENT,
    nombre_direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_direccion)
);

CREATE TABLE IF NOT EXISTS miembros(
    num_documento INTEGER NOT NULL,
    tipo_documento VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    id_direccion INTEGER NOT NULL,
    PRIMARY KEY(num_documento),
    FOREIGN KEY(id_direccion) REFERENCES direcciones(id_direccion)  
);

CREATE TABLE IF NOT EXISTS autores(
    num_documento INTEGER NOT NULL,
    tipo_documento VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_direccion INTEGER NOT NULL,
    PRIMARY KEY(num_documento),
    FOREIGN KEY(id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE IF NOT EXISTS libros(
    ISBN VARCHAR(100) NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    PRIMARY KEY(ISBN)
);

CREATE TABLE IF NOT EXISTS libros_autores(
    id_libro_autor INTEGER AUTO_INCREMENT,
    ISBN VARCHAR(100) NOT NULL,
    num_documento INTEGER NOT NULL,
    PRIMARY KEY(id_libro_autor),
    FOREIGN KEY(ISBN) REFERENCES libros(ISBN),
    FOREIGN KEY(num_documento) REFERENCES autores(num_documento)
);
CREATE TABLE IF NOT EXISTS editoriales (
    id_editorial INTEGER AUTO_INCREMENT,
    nom_editorial VARCHAR(100) NOT NULL,
    id_direccion INTEGER NOT NULL,
    PRIMARY KEY(id_editorial),
    FOREIGN KEY(id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE IF NOT EXISTS editores (
    num_doc INTEGER NOT NULL,
    tipo_documento VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_editorial INTEGER NOT NULL,
    id_direccion INTEGER NOT NULL,
    PRIMARY KEY(num_doc),
    FOREIGN KEY(id_editorial) REFERENCES editoriales(id_editorial),
    FOREIGN KEY(id_direccion) REFERENCES direcciones(id_direccion)
);

CREATE TABLE IF NOT EXISTS publicaciones(
    id_publicacion INTEGER PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(100) NOT NULL,
    nombre_edicion VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    disponibilidad BOOLEAN NOT NULL,
    FOREIGN KEY(ISBN) REFERENCES libros(ISBN)
);

CREATE TABLE IF NOT EXISTS libros_generos (
    id_libro_genero INTEGER AUTO_INCREMENT,
    ISBN VARCHAR(100) NOT NULL,
    id_genero INTEGER NOT NULL,
    PRIMARY KEY(id_libro_genero),
    FOREIGN KEY(ISBN) REFERENCES libros (ISBN),
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);

CREATE TABLE IF NOT EXISTS transacciones(
    id_transaccion INTEGER AUTO_INCREMENT,
    num_documento INTEGER NOT NULL,
    fecha_transaccion DATE NOT NULL,
    tipo_transaccion VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_transaccion),
    FOREIGN KEY(num_documento) REFERENCES miembros(num_documento)
);

CREATE TABLE IF NOT EXISTS editores_publicaciones(
    id_editor_publicacion INTEGER AUTO_INCREMENT,
    id_publicacion INTEGER NOT NULL,
    num_doc INTEGER NOT NULL, 
    PRIMARY KEY(id_editor_publicacion),
    FOREIGN KEY(id_publicacion) REFERENCES publicaciones(id_publicacion),
    FOREIGN KEY(num_doc) REFERENCES editores(num_doc)
);

CREATE TABLE IF NOT EXISTS  publicaciones_transacciones (
    id_publi_transaccion BIGINT AUTO_INCREMENT,
    id_publicacion INTEGER NOT NULL,
    id_transaccion INTEGER NOT NULL,
    PRIMARY KEY(id_publi_transaccion),
    FOREIGN KEY(id_publicacion) REFERENCES publicaciones(id_publicacion),
    FOREIGN KEY(id_transaccion) REFERENCES transacciones(id_transaccion)
);