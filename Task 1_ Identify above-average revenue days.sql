WITH daily_revenue /*with ma table temporaire nommée*/
                    /*qui effectue le calcul du rev journalier */

AS (
SELECT
    purchase_date,
SUM(ticket_price) AS total_revenue
FROM 
MontSaintMichel.tickets
GROUP BY purchase_date
)
                    /*CTE toujours suivi d'un second select */
SELECT
    purchase_date,
    total_revenue,

                    /*je calcule la diff ici dans cette sous requête scalaire*/
    total_revenue - (SELECT AVG(total_revenue) FROM daily_revenue) AS above_average_amount
FROM daily_revenue

        /* enfin j'applique la condition de positivité dans cette 2e sous requête scalaire*/
WHERE 

        /* WHERE est toujours évalué avant le SELECT donc je ne pouvais pas faire */
        /* directement    total_revenue > above_average_amount*/
    total_revenue > (SELECT AVG(total_revenue) FROM daily_revenue)

ORDER BY total_revenue DESC;
