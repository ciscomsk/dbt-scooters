SELECT
    date,
    SUM(price_rub) AS revenue_rub,
    {{ updated_at() }}
FROM {{ ref("trips_prep") }}
{% if is_incremental() %}
    WHERE date >= (SELECT MAX(date) - INTERVAL '2' DAY FROM {{ this }})
{% endif %}
GROUP BY
    date,
    updated_at
ORDER BY date
