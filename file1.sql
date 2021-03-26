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

SELECT SUM(population) FROM bbc WHERE region = 'Europe'

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

SELECT COUNT(name) FROM bbc WHERE population < 150000