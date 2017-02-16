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
