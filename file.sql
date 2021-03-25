/* Answer 1 */
SELECT population FROM world
  WHERE name = 'Germany';

/* Answer 2 */
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

/* Answer 3 */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

/* Quiz 1 */
FROM world
SELECT name, population BETWEEN 1000000 AND 1250000

SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

SELECT name FROM world
  WHERE name LIKE 'Y%'

SELECT name FROM world
  WHERE name LIKE '%y'

SELECT name FROM world
  WHERE name LIKE '%x%'

SELECT name FROM world
  WHERE name LIKE '%land'

SELECT name FROM world
  WHERE name LIKE '%oo%'

SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

SELECT population
  FROM world
 WHERE name = 'United Kingdom'

SELECT name
  FROM world
 WHERE name LIKE 'U%'

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, subject
  FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner
  FROM nobel
WHERE subject = 'Peace' 
  AND yr >= 2000

SELECT yr, subject, winner
  FROM nobel
WHERE subject = 'Literature'
  AND yr >= 1980 AND yr < 1990 

SELECT * 
FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

SELECT *
FROM nobel
  WHERE winner LIKE 'John%'

SELECT yr, subject, winner
FROM nobel
  WHERE subject = 'Physics' AND yr = 1980
  OR subject = 'Chemistry' AND yr = 1984

SELECT yr, subject, winner
FROM nobel
  WHERE yr = 1980 AND subject <> 'Chemistry' AND subject <> 'Medicine';

SELECT yr, subject, winner
FROM nobel
  WHERE yr < 1910 and subject = 'Medicine'
   OR yr > 2004 and subject = 'Literature'

SELECT *
FROM nobel
  WHERE winner = 'EUGENE O\'NEILL';


SELECT winner, yr, subject
FROM nobel
  WHERE winner LIKE 'Sir%'

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
CASE WHEN
subject IN ('Physics','Chemistry')
THEN 1 ELSE 0 END,
subject, winner;

/* nobel Quiz */

SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

/* Select tutorials */

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name
FROM world
  WHERE continent = 'Europe' 
    AND gdp/population > (SELECT gdp/population FROM world
WHERE name = 'United Kingdom')

SELECT name, continent
FROM world
WHERE continent =
     (SELECT continent
    FROM world
    WHERE name = 'Argentina')
    OR continent =
     (SELECT continent
    FROM world
    WHERE name = 'Australia')
ORDER BY name;

SELECT name, population
FROM world
WHERE population >
     (SELECT population
    FROM world
    WHERE name = 'Canada')
    AND population <
     (SELECT population
    FROM world
    WHERE name = 'Poland');

SELECT name , CONCAT(ROUND((population/(SELECT population
    FROM world
    WHERE name = 'germany')) * 100, 0), '%') AS percentage
FROM world
WHERE continent = 'Europe';

SELECT name
FROM world
where gdp > (SELECT MAX(gdp)
FROM world
where continent = 'Europe');

SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
FROM world y
WHERE y.continent=x.continent
    AND area>0);

SELECT continent, name
FROM world x
WHERE name = 
    (SELECT name
FROM world y
WHERE y.continent=x.continent
ORDER BY name
           LIMIT 1);

SELECT name
, continent,  population FROM world x
  WHERE 25000000>= ALL
(SELECT population
FROM world y
WHERE y.continent=x.continent);

SELECT name, continent
FROM world x
WHERE population/3 > ALL
    (SELECT population
FROM world y
WHERE y.continent = x.continent
    AND y.population <> x.population
    AND population>0);

/* Select in select quiz */

SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

 SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

 SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

/* Aggregate function */

SELECT SUM(population)
FROM world

SELECT continent
FROM world x
WHERE name >= ALL (SELECT name
FROM world y
WHERE x.continent = y.continent);

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

SELECT COUNT(name)
FROM world
WHERE area >= 1000000

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT continent, COUNT(continent)
FROM world 
GROUP BY continent

SELECT continent, COUNT(name)
FROM world
WHERE population>10000000
GROUP BY continent;

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population)>100000000;