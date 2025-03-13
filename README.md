Nota: crea un archivo README.md que incluya únicamente estas consultas, siguiendo
el formato correspondiente.
Listar todos los libros disponibles
```sql
SELECT ISBN,titulo FROM libros l;
```
Buscar libros por género
```sql
SELECT l.titulo, g.nombre_genero  FROM libros_generos lg
INNER JOIN libros l ON lg.ISBN  = l.ISBN 
INNER JOIN generos g  ON lg.id_genero = g.id_genero ;
```

Obtener información de un libro por ISBN
```sql
SELECT ISBN, titulo
FROM libros
WHERE ISBN= '978-3-16-148410-0';
```
Contar el número de libros en la biblioteca
```sql
SELECT COUNT(ISBN) FROM libros;
```
Listar todos los autores
```sql
SELECT nombre FROM autores;
```
Buscar autores por nombre
```sql
SELECT nombre 
FROM autores
WHERE nombre = 'Pedro';
```
Obtener todos los libros de un autor específico
```sql
SELECT  a.nombre, a.apellido, l.titulo  FROM libros_autores la 
INNER JOIN libros l ON la.ISBN = l.ISBN 
INNER JOIN autores a ON a.num_documento = la.num_documento 
WHERE a.num_documento = '23456789';
```
Listar todas las ediciones de un libro
```sql
SELECT p.ISBN, l.titulo,  p.nombre_edicion  FROM publicaciones p 
INNER JOIN libros l ON p.ISBN = l.ISBN;
```
Obtener la última edición de un libro
```sql
SELECT p.fecha_lanzamiento AS ultima_fecha, p.ISBN, l.titulo   FROM publicaciones p 
INNER JOIN libros l ON p.ISBN = l.ISBN
WHERE p.fecha_lanzamiento = (SELECT MAX(pb.fecha_lanzamiento)  FROM publicaciones pb);
```
Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(ISBN) FROM publicaciones
WHERE  ISBN = '978-3-16-148410-0';
```
Listar todas las transacciones de préstamo
```sql
SELECT id_transaccion, num_documento , fecha_transaccion , tipo_transaccion  FROM transacciones;
```
Obtener los libros prestados actualmente
```sql
SELECT * FROM publicaciones
WHERE disponibilidad =FALSE; 
```
Contar el número de transacciones de un miembro específico
```sql
SELECT * FROM transacciones 
WHERE num_documento = '12345678';
```
Listar todos los miembros de la biblioteca
```sql
SELECT num_documento, nombre, apellido  FROM miembros;
```
Buscar un miembro por nombre:
```sql
SELECT num_documento, nombre, apellido  FROM miembros
WHERE nombre = 'Luis';
```
Obtener las transacciones de un miembro específico
```sql
SELECT t.id_transaccion, t.num_documento, m.nombre, m.apellido, t.fecha_transaccion, t.tipo_transaccion 
FROM transacciones t 
INNER JOIN miembros m ON t.num_documento = m.num_documento
WHERE t.num_documento = '12345678';
```
Listar todos los libros y sus autores
```sql
SELECT la.ISBN, l.titulo,  la.num_documento, a.nombre, a.apellido  FROM libros_autores la 
INNER JOIN autores a ON la.num_documento = a.num_documento 
INNER JOIN libros l ON la.ISBN = l.ISBN;
```
Obtener el historial de préstamos de un libro específico
```sql
SELECT   p.ISBN, l.titulo, t.fecha_transaccion, t.tipo_transaccion  FROM publicaciones_transacciones pt 
INNER JOIN publicaciones p ON pt.id_publicacion = p.id_publicacion
INNER JOIN transacciones t  on pt.id_transaccion  = t.id_transaccion 
INNER JOIN libros l ON l.ISBN  = p.ISBN
WHERE l.ISBN  = '978-3-16-148410-0';
```
Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(id_transaccion) AS total_prestamos FROM transacciones 
WHERE tipo_transaccion = 'Préstamo';
```
Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT p.ISBN, l.titulo, p.nombre_edicion,  p.disponibilidad FROM publicaciones p 
INNER JOIN libros l ON l.ISBN = p.ISBN ;
```