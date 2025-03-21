SELECT
    "group" AS age_group,
    COUNT(*) AS trips,
    SUM(price_rub) AS revenue_rub
FROM {{ ref("trips_users") }} AS t
JOIN {{ ref("age_groups") }} AS a
    ON t.age >= a.age_start AND t.age <= a.age_end
--cross join {{ ref("age_groups") }} as ag
--where
--    t.age >= ag.age_start
--    and t.age <= ag.age_end
GROUP BY age_group