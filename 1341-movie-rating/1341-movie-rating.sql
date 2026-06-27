SELECT title AS results
FROM
(
    (
        SELECT
            (SELECT name
             FROM Users
             WHERE Users.user_id = MovieRating.user_id) AS title,
            COUNT(*) AS r
        FROM MovieRating
        GROUP BY user_id
        ORDER BY r DESC, title
        LIMIT 1
    )

    UNION all

    (
        SELECT
            (SELECT title
             FROM Movies
             WHERE Movies.movie_id = MovieRating.movie_id) AS title,
            AVG(rating) AS avg_rating
        FROM MovieRating
        WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY movie_id
        ORDER BY avg_rating DESC, title
        LIMIT 1
    )
) AS r;