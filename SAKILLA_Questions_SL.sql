USE sakila;

DESCRIBE actor;
-- 1.
SELECT `first_name`, `last_name` FROM `actor`;

-- 2.
SELECT `last_name` FROM `actor` WHERE `first_name` = "JOHN";

-- 3.
SELECT `first_name`, `last_name` FROM `actor` WHERE `last_name` = "Neeson";

-- 4.
SELECT `first_name`, `last_name`, `actor_id` FROM `actor` WHERE `actor_id` % 10 = 0;

-- 5.
SELECT `description` FROM `film` WHERE `film_id` = 100;

-- 6.
SELECT `title`, `rating` FROM `film` WHERE `rating` = "R";

-- 7.
SELECT `title`, `rating` FROM `film` WHERE `rating` != "R";

-- 8.
SELECT `title`, `length` FROM `film` ORDER BY `length` LIMIT 10;

-- 9.
SELECT `title`, `length` FROM `film` WHERE `length` = (SELECT max(`length`) FROM `film`);

-- 10.
SELECT `title`, `special_features` FROM `film` WHERE `special_features` LIKE "%Deleted Scenes%";

-- 11.
SELECT
	 `last_name`, COUNT(`last_name`) as `count`
FROM
	`actor` 
GROUP BY `last_name` 
HAVING `count` = 1 ORDER BY `last_name` DESC;
 
 -- 12.
 SELECT 
	`last_name`, COUNT(`last_name`) AS `i`
FROM
	`actor`
GROUP BY `last_name`
HAVING `i` > 1 ORDER BY `i` DESC;

-- 13.
SELECT a.actor_id, a.first_name, a.last_name, count(a.actor_id) AS `count` FROM actor AS a JOIN film_actor AS fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY `count` DESC LIMIT 1; 
	
-- 14.
SELECT
		r.rental_date, r.inventory_id, i.film_id, f.title
        FROM rental AS r
        JOIN
        inventory AS i 
        ON r.inventory_id =i.inventory_id
        JOIN
        film AS f
        ON f.film_id = i.film_id
        WHERE `title` = "ACADEMY DINOSAUR";
        
-- 15.
SELECT avg(`length`) AS `Average_RunTime` FROM `film`;

-- 16.
SELECT avg(f.length) AS `Average_LengthOfFilm_In_Category`, fc.category_id FROM film AS f JOIN film_category AS fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;

-- 17.
SELECT `title`, `description` FROM `film` WHERE `description` LIKE "%robot%";

-- 18.
SELECT count(`title`) FROM `film` WHERE `release_year` = 2010;

-- 19.
SELECT 
    c.category_id, c.name, fc.film_id, f.title
FROM
    category AS c
        JOIN
    film_category AS fc ON c.category_id = fc.category_id
        JOIN
    film AS f ON f.film_id = fc.film_id 
		WHERE c.name = "horror";
        
-- 20
SELECT `first_name`, `last_name` FROM staff WHERE `staff_id` = 2;

-- 21
SELECT 
		f.film_id, f.title, a.first_name, a.last_name, fa.actor_id
        FROM
        film AS f
        JOIN film_actor AS fa ON f.film_id = fa.film_id
        JOIN actor AS a ON a.actor_id = fa.actor_id
        WHERE a.first_name = "fred" AND a.last_name = "Costner";
        
-- 22
SELECT count(DISTINCT `country`) FROM country;

-- 23
SELECT `name` FROM `language`
ORDER BY `name` DESC;

-- 24
SELECT `first_name`, `last_name` FROM `actor` WHERE `last_name` LIKE "%son"
ORDER BY `last_name`;

-- 25
 SELECT 
		c.category_id, c.name, count(c.name) AS `genre_count`
        FROM category AS c
        JOIN	
        film_category AS fc ON c.category_id = fc.category_id
        GROUP BY c.category_id 
        ORDER BY `genre_count` DESC LIMIT 1;
        
        







