SELECT DISTINCT a.attraction_name
FROM MontSaintMichel.attractions a
WHERE EXISTS (
    SELECT 1
    FROM MontSaintMichel.guided_tours gt
    JOIN MontSaintMichel.capacity_logs cl
        ON gt.tour_date = cl.log_date
    WHERE gt.attraction_id = a.attraction_id
      AND cl.total_visitors > 8000
      AND cl.log_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
);
