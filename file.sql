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
  