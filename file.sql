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




-- JOIN answers 

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
    WHERE id = 1012

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
    WHERE teamid = 'GER'

SELECT team1, team2, player 
  FROM game JOIN goal ON (id=matchid)
    WHERE player like 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (id=teamid)
WHERE gtime<=10;

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos' ;

SELECT player
FROM game JOIN goal ON (id=matchid)
WHERE stadium =  'National Stadium, Warsaw';

SELECT DISTINCT(player)
FROM game JOIN goal ON matchid = id
WHERE (team1='GER' OR team2='GER') AND teamid != 'GER';

SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname;

SELECT stadium, COUNT(player)
FROM game JOIN goal ON id=matchid
GROUP BY stadium
ORDER BY stadium;

SELECT stadium, COUNT(player)
FROM game JOIN goal ON id=matchid
GROUP BY stadium
ORDER BY stadium;

-- Join Quiz

SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

SELECT DISTINCT player, teamid 
FROM game JOIN goal ON matchid = id 
WHERE stadium = 'National Stadium, Warsaw' 
AND (team1 = 'POL' OR team2 = 'POL')
AND teamid != 'POL'

SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

-- More Join answer

SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane'

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id
FROM actor
WHERE name = 'Glenn Close';

SELECT id
FROM movie
WHERE title = 'Casablanca';

SELECT name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE movieid = 11768;

SELECT name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE title = 'Alien';

SELECT title
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE name = 'Harrison Ford' AND ord != 1;

SELECT name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE title = 'Alien';

SELECT title, name
FROM movie JOIN casting ON movie.id = movieid
    JOIN actor ON actor.id = actorid
WHERE yr = 1962 AND ord = 1;

SELECT yr, COUNT(title)
FROM
    movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT title, name
FROM movie JOIN casting ON (movie.id=movieid AND ord = 1)
    JOIN actor ON actorid=actor.id
WHERE movieid  IN (
SELECT movieid
FROM casting
WHERE actorid IN (
  SELECT id
FROM actor
WHERE name='Julie Andrews'));

SELECT name
FROM actor JOIN casting ON (actor.id = actorid AND ord = 1)
GROUP BY name
HAVING COUNT(name) > 14
ORDER BY name;

SELECT title, COUNT(name)
FROM movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(name) DESC, title

SELECT name
FROM movie JOIN casting ON movie.id=movieid
    JOIN actor ON actorid=actor.id
WHERE title IN (SELECT title
    FROM movie JOIN casting ON movie.id=movieid
        JOIN actor ON actorid=actor.id
    WHERE name =  'Art Garfunkel') AND name != 'Art Garfunkel'

SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

SELECT *
  FROM actor JOIN casting ON actor.id = actorid
   JOIN movie ON movie.id = movieid

SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

-- Usin null answer

SELECT name
FROM teacher
WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)


SELECT name, COALESCE(mobile, '07986 444 2266') as mobile
FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept
    ON (teacher.dept=dept.id);

SELECT COUNT(name) as Teachers, COUNT(mobile) as Numbers
FROM teacher;

SELECT dept.name, COUNT(teacher.name)
FROM teacher RIGHT JOIN dept
    ON (teacher.dept=dept.id)
GROUP BY dept.name;

SELECT name,
    CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' 
    ELSE 'Art' END
FROM teacher;

SELECT name,
    CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' 
    WHEN dept = 3 THEN 'Art' 
    ELSE 'None' END
FROM teacher;

-- Null Quiz

SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

-- Self answer

SELECT COUNT(id)
FROM stops;

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

SELECT id, name
FROM stops JOIN route ON (id = route.stop)
WHERE num = 4 AND company = 'LRT'
ORDER BY pos;

SELECT company, num, COUNT(*)
FROM route
WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
    AND stopb.name='London Road';

SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
    JOIN stops stopa ON (a.stop=stopa.id)
    JOIN stops stopb ON (b.stop=stopb.id)
        AND stopa.name='Craiglockhart';

-- Self Join Quiz

SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

 SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'

SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'