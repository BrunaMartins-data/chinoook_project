-- 9 What are the 5 most purchased styles in the city of São Paulo?
SELECT
    g.Name   AS genre_
  , SUM(il.Quantity) AS total_quant
FROM
    Genre g
    JOIN Track t
		ON t.GenreId = g.GenreId
    JOIN InvoiceLine il
		ON il.TrackId = t.TrackId
    JOIN Invoice i
		ON i.InvoiceId = il.InvoiceId
WHERE
    i.BillingCity = "São Paulo"
GROUP BY
    g.Name
ORDER BY
    total_quant DESC
LIMIT 5;
;