USE universidad;
-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre 
	FROM universidad.persona
    WHERE tipo = 'alumno'
    ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT apellido1, apellido2, nombre 
	FROM universidad.persona
    WHERE tipo = 'alumno' AND telefono IS NULL;
-- 3. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT apellido1, apellido2, nombre 
	FROM universidad.persona
    WHERE tipo = 'alumno' AND EXTRACT(YEAR FROM fecha_nacimiento) = 1999;
-- 4. Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT apellido1, apellido2, nombre 
	FROM universidad.persona
    WHERE tipo = 'profesor' 
    AND telefono IS NULL
    AND nif like '%k';
-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * 
	FROM asignatura AS a
    JOIN grado AS g
    ON g.id = a.id_grado 
    WHERE cuatrimestre = 1 
    AND curso = 3 
    AND id_grado = 7;
-- 6. Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT  pe.apellido1, pe.apellido2, pe.nombre, d.nombre 
	FROM profesor AS p
    JOIN persona AS pe
    ON p.id_profesor = pe.id
    JOIN departamento AS d
    ON d.id = p.id_departamento 
    ORDER BY apellido1 ASC, apellido2 ASC, pe.nombre ASC; 
-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin 
	FROM persona AS p 
    JOIN alumno_se_matricula_asignatura AS aa 
    ON p.id = aa.id_alumno 
    JOIN asignatura AS a 
    ON a.id = aa.id_asignatura
    JOIN curso_escolar AS ce 
    ON ce.id = aa.id_curso_escolar
    WHERE nif = '26902806M';
-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT d.nombre 
	FROM departamento AS d
    JOIN profesor AS p
    ON p.id_departamento = d.id
    JOIN asignatura AS a
    ON a.id_profesor = p.id_profesor
    JOIN grado AS g
    ON a.id_grado = g.id
    WHERE g.id = 4
    GROUP BY d.nombre;
-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT p.nombre 
	FROM curso_escolar AS ce
	JOIN alumno_se_matricula_asignatura AS aa
    ON ce.id = aa.id_curso_escolar
    JOIN persona AS p
    ON p.id = aa.id_alumno
	WHERE aa.id_curso_escolar = 5
    GROUP BY p.nombre;
    
-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- 1. Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre, p.apellido1, p.apellido2, p.nombre  
	FROM profesor AS pr
    JOIN persona AS p
    ON pr.id_profesor = p.id
    LEFT JOIN departamento AS d
    ON d.id = pr.id_departamento
    ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
-- 2. Retorna un llistat amb els professors que no estan associats a un departament.
SELECT p.nombre 
	FROM profesor AS pr
    JOIN persona AS p
    ON p.id = pr.id_profesor
    LEFT JOIN departamento AS d
    ON d.id = pr.id_departamento
    WHERE d.id IS NULL;
-- 3. Retorna un llistat amb els departaments que no tenen professors associats.
SELECT d.nombre  
	FROM profesor AS pr
    JOIN persona AS p
    ON p.id = pr.id_profesor
    RIGHT JOIN departamento AS d
    ON d.id = pr.id_departamento
    WHERE p.id IS NULL;
-- 4. Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT pe.apellido1, pe.apellido2, pe.nombre 
	FROM profesor AS p
    JOIN persona AS pe
    ON p.id_profesor = pe.id
    LEFT JOIN asignatura AS a
    ON a.id_profesor = p.id_profesor
    WHERE a.id IS NULL;
-- 5. Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT a.nombre 
	FROM profesor AS p
    JOIN persona AS pe
    ON p.id_profesor = pe.id
    RIGHT JOIN asignatura AS a
    ON a.id_profesor = p.id_profesor
    WHERE p.id_profesor IS NULL;
-- x 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT * 
	FROM departamento AS d
	JOIN profesor AS p
    ON d.id = p.id_departamento
    JOIN asignatura AS a
    ON a.id = p.id_profesor
    LEFT JOIN alumno_se_matricula_asignatura AS aa
    ON aa.id_asignatura = a.id
    WHERE aa.id_curso_escolar IS NULL;

-- Consultes resum:
-- 1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(nombre) 
	FROM persona
    WHERE tipo = 'alumno'; 
-- 2. Calcula quants alumnes van néixer en 1999.
SELECT COUNT(*) 
	FROM persona
    WHERE	YEAR(fecha_nacimiento) = 1999;
-- 3. Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT d.nombre, COUNT(p.id_profesor) AS num 
	FROM profesor AS p
    JOIN departamento AS d
    ON d.id = p.id_departamento
    GROUP BY d.nombre
    ORDER BY num ASC;
-- 4. Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre, COUNT(p.id_profesor) 
FROM profesor AS p
RIGHT JOIN departamento AS d
ON d.id = p.id_departamento
GROUP BY d.nombre;
-- 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre, COUNT(a.nombre) AS num
	FROM grado AS g
    LEFT JOIN asignatura AS a
    ON a.id_grado = g.id
    GROUP BY g.nombre
    ORDER BY num;
-- 6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre, COUNT(a.nombre) 
	FROM grado AS g
    JOIN asignatura AS a
    ON a.id_grado = g.id
    GROUP BY g.nombre
    HAVING COUNT(a.nombre) > 40;
-- 7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre, a.tipo, COUNT(a.creditos) 
	FROM grado AS g
    JOIN asignatura AS a
    ON g.id = a.id_grado
    GROUP BY a.creditos;
-- 8. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT c.anyo_inicio, COUNT(a.id_curso_escolar)
	FROM curso_escolar AS c
    JOIN alumno_se_matricula_asignatura AS a
    ON c.id = a.id_curso_escolar
    GROUP BY a.id_curso_escolar;
-- 9. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) 
	FROM asignatura AS a
    RIGHT JOIN profesor AS p
    ON p.id_profesor = a.id_profesor
    JOIN persona AS pe
    ON p.id_profesor = pe.id
    GROUP BY p.id_profesor
    ORDER BY COUNT(a.id) DESC;
-- 10. Retorna totes les dades de l'alumne més jove.
SELECT *
	FROM persona
    WHERE tipo = 'alumno'
    ORDER BY fecha_nacimiento ASC
    LIMIT 1;
-- 11. Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.
SELECT pe.nombre, pe.apellido1
	FROM profesor AS p
    LEFT JOIN asignatura AS a
    ON p.id_profesor = a.id_profesor
    JOIN persona AS pe
    ON pe.id = p.id_profesor
    WHERE a.nombre IS NULL
    GROUP BY pe.nombre;
    
