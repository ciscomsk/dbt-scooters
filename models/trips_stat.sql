SELECT
    COUNT(*) AS trips,
    COUNT (DISTINCT user_id) AS users,
    AVG(duration_s) / 60 AS avg_duration_m,
    SUM(distance_m) / 1000 AS sum_distance_km,
    SUM(price_rub) AS revenue_rub,
    SUM(
        CASE
            WHEN is_free OR NULL THEN 1
            ELSE 0
        END
    ) / COUNT(*)::real * 100 AS free_trips_pct
--     count(is_free or null) / cast(count(*) as real) * 100 as free_trips_pct --v2
FROM {{ ref("trips_prep") }}