--What are the top 10 movies by IMDb rating?
SELECT TOP 10 Series_Title, IMDb_Rating
FROM movie
ORDER BY IMDb_Rating DESC;

--How many movies were released in each year?
SELECT Released_Year, COUNT(*) AS Total_Movies
FROM movie
GROUP BY Released_Year
ORDER BY Released_Year;

--What is the average IMDb rating for each genre combination?
SELECT Genre, AVG(IMDb_Rating) AS Avg_Rating
FROM movie
GROUP BY Genre;

--Which director has the highest average IMDb rating for their movies?
SELECT TOP 1 Director, AVG(IMDb_Rating) AS Avg_Rating
FROM movie
GROUP BY Director
ORDER BY Avg_Rating DESC

--What are the top 5 movies with the highest number of votes?
SELECT TOP 5 Series_Title, No_of_Votes
FROM movie
ORDER BY No_of_Votes DESC

--How many movies were released in each certificate category (A, UA, U)?
SELECT Certificate, COUNT(*) AS Total_Movies
FROM movie
GROUP BY Certificate;

--What is the average runtime of movies for each certificate category?
SELECT Certificate, AVG(CAST(SUBSTRING(Runtime, 1, CHARINDEX(' ', Runtime) - 1) AS int)) AS Avg_Runtime
FROM movie
GROUP BY Certificate;

--Which actors starred in the most movies?
SELECT TOP 5 Actor, SUM(Total_Movies) AS Total_Movies
FROM (
    SELECT Star1 AS Actor, COUNT(*) AS Total_Movies
    FROM movie
    GROUP BY Star1
    UNION ALL
    SELECT Star2 AS Actor, COUNT(*) AS Total_Movies
    FROM movie
    GROUP BY Star2
    UNION ALL
    SELECT Star3 AS Actor, COUNT(*) AS Total_Movies
    FROM movie
    GROUP BY Star3
    UNION ALL
    SELECT Star4 AS Actor, COUNT(*) AS Total_Movies
    FROM movie
    GROUP BY Star4
) AS ActorMovies
GROUP BY Actor
ORDER BY Total_Movies DESC;

--How many movies are there in each genre category?
SELECT genre, COUNT(*) AS Total_Movies
FROM (
    SELECT DISTINCT Series_Title, value AS genre
    FROM movie
    CROSS APPLY STRING_SPLIT(Genre, ',')
) AS movie_genres
GROUP BY genre;

SELECT DISTINCT(Released_Year) FROM MOVIE
ORDER BY Released_Year