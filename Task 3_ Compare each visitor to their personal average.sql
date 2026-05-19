WITH last_purchase AS (
    SELECT
        visitor_id,
        /*Quelle est la date de l’achat la plus récente ?*/
        MAX(purchase_date) AS last_purchase_date
    FROM MontSaintMichel.tickets
    GROUP BY visitor_id
)

SELECT
    t1.visitor_id,
    t1.ticket_price AS latest_ticket_price,
    (
        SELECT AVG(t2.ticket_price)
        FROM MontSaintMichel.tickets t2
        WHERE t2.visitor_id = t1.visitor_id
          AND t2.purchase_date < t1.purchase_date
    ) AS historical_avg
FROM MontSaintMichel.tickets t1
JOIN last_purchase lp
  ON t1.visitor_id = lp.visitor_id
 AND t1.purchase_date = lp.last_purchase_date
WHERE t1.ticket_price >
      (
        SELECT AVG(t2.ticket_price)
        FROM MontSaintMichel.tickets t2
        WHERE t2.visitor_id = t1.visitor_id
          AND t2.purchase_date < t1.purchase_date
      ) * 1.20;
