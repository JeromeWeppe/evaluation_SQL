-- # Revision

-- ## Exercice nouvelle colonne

-- 1. Ajoutez la colonne salary, salaire annuel, dans la table pilots, définissez son type. Vous donnerez la requête SQL pour 
-- modifier la table. Puis faites une requête pour ajouter les salaires respectifs suivants :

-- ```text
-- +--------+--------+
-- | name   | salary |
-- +--------+--------+
-- | Alan   |  2000  |
-- | Tom    |  1500  |
-- | Yi     |  1500  |
-- | Sophie |  2000  |
-- | Albert |  2000  |
-- | Yan    |  1500  |
-- | Benoit |  2000  |
-- | Jhon   |  3000  |
-- | Pierre |  3000  |
-- +--------+--------+
-- ```

ALTER TABLE pilots
ADD salary INT;
UPDATE pilots
SET salary = 2000
WHERE name = 'Alan';

UPDATE pilots
SET salary = 1500
WHERE name = 'Tom';

UPDATE pilots
SET salary = 1500
WHERE name = 'Yi';

UPDATE pilots
SET salary = 2000
WHERE name = 'Sophie';

UPDATE pilots
SET salary = 2000
WHERE name = 'Albert';

UPDATE pilots
SET salary = 1500
WHERE name = 'Yan';

UPDATE pilots
SET salary = 2000
WHERE name = 'Benoît';

UPDATE pilots
SET salary = 3000
WHERE name = 'Jhon';

UPDATE pilots
SET salary = 3000
WHERE name = 'Pierre';

---------------------------------------------------------------------------------------------------------------------
-- ## Exercice 1

-- 1. Quel est le salaire moyen.
SELECT AVG(salary) FROM pilots;

-- 2. Calculez le salaire moyen par compagnie.
SELECT compagny, ROUND(AVG(salary),0) FROM pilots GROUP BY compagny;

-- 3. Quels sont les pilots qui sont au-dessus du salaire moyen.
SELECT name, salary FROM pilots WHERE salary > (SELECT ROUND(AVG(salary),0) FROM pilots);

-- 4. Calculez l''étendu des salaires.
SELECT ROUND(MAX(salary) - MIN(salary),0) FROM pilots;

-- 5. Quels sont les noms des compagnies qui payent leurs pilotes au-dessus de la moyenne ?
SELECT compagny FROM pilots WHERE salary > (SELECT ROUND(AVG(salary),0) FROM pilots);

-- 6. Quels sont les pilotes qui par compagnie dépasse(nt) le salaire moyen ?
SELECT compagny, name FROM pilots WHERE salary > (SELECT ROUND(AVG(salary),0) FROM pilots);

--------------------------------------------------------------------------------------------------

-- ## Exercice 2

-- 1. Faites une requête qui diminue de 40% le salaire des pilotes de la compagnie AUS.
UPDATE pilots
SET salary = salary*0.6
WHERE compagny = 'AUS';


-- 2. Vérifiez que les salaires des pilotes australiens sont tous inférieurs aux autres salaires des pilotes des autres compagnies.
SELECT name, salary, compagny FROM pilots ORDER BY salary;

-- ## Exercices de recherche

-- Pour chaque question ci-dessous créez la requête :

-- 1. On aimerait savoir quels sont les types d'avions en commun que la compagnie AUS et FRE1 exploitent.

-- Indications : l'intersection de deux ensembles en MySQL s'implémente comme suit :

-- ```sql
-- SELECT DISTINCT value FROM `table1`
-- WHERE value IN (
--   SELECT value 
--   FROM `table2`
-- );
-- ```
sql
SELECT DISTINCT plane FROM pilots
WHERE plane IN (
  SELECT compagny 
  FROM pilots
  WHERE compagny = 'AUS' AND compagny = 'FRE1'
);

-- 2. Quels sont les types d'avion que ces deux compagnies AUS et FRE1 exploitent (c'est l'UNION ici) ?
-- Indications : Pensez à utiliser l'opérateur UNION.

SELECT DISTINCT compagny, plane FROM pilots WHERE compagny = 'AUS' 
UNION SELECT DISTINCT compagny, plane FROM pilots WHERE compagny = 'FRE1';
