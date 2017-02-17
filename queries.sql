-- De la ciudad donde mas gente vive, quien gana menos?
SELECT e.nombre
FROM empleados e
WHERE
  ciudade_id_vive =
    ( SELECT ciudade_id_vive
      FROM empleados
      GROUP BY ciudade_id_vive
      HAVING count(*) =
      	( SELECT max(cantidad)
      		FROM (
            SELECT count(*) as 'cantidad'
    	      FROM ciudades c, empleados e
      	    WHERE c.id = ciudade_id_vive
      	    GROUP BY c.nombre
          ) ciudad
        )
      )
AND salario =
  ( SELECT min(salario)
    FROM empleados
    WHERE ciudade_id_vive = e.ciudade_id_vive
  )

/*
Escriba la instruccion SQL para actualizar los registros de personas
que tienen profesion_id vacio o nulo y asignaerles
la profesión a "ama de casa" (consultada de la tabla de profesiones).
*/

UPDATE personas
SET profesion_id = (SELECT id FROM profesiones WHERE nombre = "Ama de casa")
WHERE profesion_id IS NULL;

/*
Escriba la instruccion SQL para recuperar el Primer Nombre y Primer Apellido
de las personas que tienen la vocal "o" dentro del Primer Apellido o Segundo Apellido
*/

SELECT primer_nombre, primer_apellido FROM personas
WHERE primer_apellido LIKE "%o%" OR
      segundo_apellido LIKE "%o%"

/*
Escriba la instruccion SQL para recuperar el número total de personas
*/

SELECT COUNT(*) AS nro_total FROM personas


/*
Seleccionar las personas de sexo femenino 'F' que nacieron en "El Retiro"
o las personas de sexo masculino 'M' que nacieron en "La Ceja".
Listar primer_nombre, primer_apellido y nombre de la ciudad de nacimiento.
*/

SELECT p.primer_nombre, p.primer_apellido, c.nombre
FROM personas p, ciudades c
WHERE ((nace_ciudad_id = (SELECT id FROM ciudades WHERE nombre = "El Retiro") AND
	sexo = 'F') OR
	(nace_ciudad_id = (SELECT id FROM ciudades WHERE nombre = "La Ceja") AND
	sexo = 'M')) AND
	p.nace_ciudad_id = c.id


/*
Seleccionar las personas de estrato 6 que viven en Medellín y
nacieron en otra ciudad diferente a Medellín.
Listar primer_nombre, primer_apellido y nombre de la ciudad de nacimiento.
*/

SELECT p.primer_nombre, p.primer_apellido, c.nombre
FROM personas p, ciudades c
WHERE   p.nace_ciudad_id = c.id AND
	p.nmestrato = 6 AND
	vive_ciudad_id = (SELECT id FROM ciudades WHERE nombre = "Medellin") AND
	nace_ciudad_id <> (SELECT id FROM ciudades WHERE nombre = "Medellin")


/*
Escriba la instruccion SQL para listar las estadisticas de las sumatoria de número de personas y profesion por ciudad donde vive.
Nota: Recuerde incluir las personas que no tienen codigo de ciudad.
Es decir debe listar cada ciudad, la profesion y el número. Ejemplo
Medellin, Economista, 10
Medellín, Ingeniero, 1
*/

SELECT c.nombre, pr.nombre, COUNT(*) AS cantidad_de
FROM personas p, ciudades c, profesiones pr
WHERE   p.vive_ciudad_id = c.id AND
	p.profesion_id = pr.id
GROUP BY c.nombre

/*
Escriba la instruccion SQL para listas el nombre de la ciudad
donde han nacido 3 o mas personas
*/


SELECT c.nombre, COUNT(*) AS mucha_people
FROM  personas p, ciudades c
WHERE p.nace_ciudad_id = c.id
GROUP BY p.nace_ciudad_id
HAVING mucha_people >= 3


	
