-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

-- SELECT film_title, release_year, worldwide_gross
-- FROM specs
-- INNER JOIN revenue
-- --ON specs.movie_id = revenue.movie_id
-- USING (movie_id);

-- 2. What year has the highest average imdb rating?

-- SELECT DISTINCT(release_year), AVG(imdb_rating) AS avg_imdb_rating
-- FROM specs
-- INNER JOIN rating
-- USING(movie_id)
-- 	GROUP BY release_year
-- 	ORDER BY avg_imdb_rating DESC;

--1991

-- 3. What is the highest grossing G-rated movie? Which company distributed it?

-- SELECT company_name, film_title, mpaa_rating, worldwide_gross
-- FROM specs
-- INNER JOIN revenue
-- USING(movie_id)
-- 	INNER JOIN distributors
-- 	ON distributors.distributor_id = specs.domestic_distributor_id
-- WHERE mpaa_rating = 'G'
-- ORDER BY worldwide_gross DESC;

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- SELECT DISTINCT(company_name), COUNT(film_title) AS count_film_title
-- FROM distributors
-- LEFT JOIN specs
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- 	GROUP BY company_name
-- 	ORDER BY count_film_title DESC;

-- 5. Write a query that returns the five distributors with the highest average movie budget.

-- SELECT company_name, AVG(film_budget) AS avg_film_budget
-- FROM distributors
-- INNER JOIN specs
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- INNER JOIN revenue
-- 	USING(movie_id)
-- GROUP BY company_name
-- ORDER BY avg_film_budget DESC
-- LIMIT 5;

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

-- SELECT DISTINCT(company_name), headquarters, COUNT(film_title) ,imdb_rating
-- FROM distributors
-- INNER JOIN specs
-- ON distributors.distributor_id = specs.domestic_distributor_id
-- INNER JOIN rating
-- USING(movie_id)
-- WHERE headquarters NOT LIKE '%California%'
-- 	GROUP BY company_name, headquarters, imdb_rating
-- 	ORDER BY imdb_rating DESC;


-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?