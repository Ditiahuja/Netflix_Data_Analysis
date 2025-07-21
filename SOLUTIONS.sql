-- Count the Number of Movies vs TV Shows
SELECT type_of_show, COUNT(*) AS total_count
FROM movies
GROUP BY type_of_show;

--Find the Most Common Rating for Movies and TV Shows
SELECT rating,type_of_show,count(*) AS no_of_rating
FROM movies
GROUP BY rating,type_of_show
ORDER BY no_of_rating DESC ;

--List All Movies Released in a Specific Year (e.g., 2020)
SELECT * FROM movies
WHERE release_year=2020;

--Find the Top 5 Countries with the Most Content on Netflix
SELECT country,COUNT(*) AS most_content_countries
FROM movies
WHERE Country IS NOT NULL
GROUP BY country
ORDER BY most_content_countries DESC LIMIT 5;

--identify the Longest Movie
SELECT * FROM movies
WHERE type_of_show='Movie'
ORDER BY duration DESC LIMIT 1 ;

-- Find Content Added in the Last 5 Years
SELECT *FROM movies
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--Find All Movies/TV Shows by Director 'Rajiv Chilaka'
SELECT * FROM movies
WHERE director= 'Rajiv Chilaka';

--Count the Number of Content Items in Each genre
SELECT UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre,
COUNT(*)AS item_per_genre
FROM movies
GROUP BY 1;

--Find each year and the average numbers of content release in India on netflix
SELECT release_year,COUNT(*) AS total_titles ,
       ROUND(AVG(COUNT(*)) OVER(), 2) AS avg_content_india
FROM movies
     WHERE country='India'
	 GROUP BY release_year
	 ORDER BY release_year;

-- List All Movies that are Documentaries
SELECT * FROM movies
WHERE listed_in LIKE '%Documentaries%';

--Find All Content Without a Director
SELECT * FROM  movies
WHERE Director IS NULL;

--Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
SELECT * 
FROM movies
WHERE LOWER(Cast_of_show) LIKE '%salman khan%'
AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10
