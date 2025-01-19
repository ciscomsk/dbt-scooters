WITH age AS (
    SELECT
        t.started_at::date AS date,
        EXTRACT(YEAR FROM started_at) - EXTRACT(YEAR FROM birth_date) AS age
    FROM scooters_raw.users u
    INNER JOIN scooters_raw.trips t ON u.id = t.user_id
    ),
avg_by_day AS (
    SELECT
        age,
        COUNT(*) AS trips,
        COUNT(DISTINCT date) AS days
    FROM age
    GROUP BY age
)

SELECT
    age,
    trips::real / days AS avg_trips
FROM avg_by_day
ORDER BY age