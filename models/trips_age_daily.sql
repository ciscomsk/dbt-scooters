WITH date_age_cte AS (
    SELECT
        t.date,
        t.price_rub,
        EXTRACT(YEAR FROM t.started_at) - EXTRACT(YEAR FROM u.birth_date) AS age
    FROM {{ ref("trips_prep") }} t
    INNER JOIN {{ source("scooters_raw", "users") }} u ON t.user_id = u.id
    )

SELECT
    date,
    age,
    COUNT(*) AS trips,
    SUM(price_rub) AS revenue_rub
FROM date_age_cte
GROUP BY
    age,
    date