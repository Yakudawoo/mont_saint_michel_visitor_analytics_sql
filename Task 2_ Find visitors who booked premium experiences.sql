-- SELECT
--     v.visitor_id,
--     v.first_name,
--     v.last_name,
--     v.email,
--     v.country
-- FROM MontSaintMichel.visitors v
-- INNER JOIN (
    SELECT DISTINCT visitor_id
    FROM MontSaintMichel.tickets
    WHERE ticket_price > 25
-- ) premium
--     ON v.visitor_id = premium.visitor_id
-- INNER JOIN (
--     SELECT DISTINCT visitor_id
--     FROM MontSaintMichel.guided_tours
-- ) tours
--     ON v.visitor_id = tours.visitor_id;
