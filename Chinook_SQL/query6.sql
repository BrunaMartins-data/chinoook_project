-- 6 How many Blues songs were purchased each year?
SELECT
    strftime("%Y", i.InvoiceDate) AS year_
  , g.Name AS name_
  , SUM(il.Quantity) AS total_quant
FROM
    Invoice i
	JOIN 
		InvoiceLine il
		ON
			il.InvoiceId = i.InvoiceId
    JOIN
        Track t
        ON
            il.TrackId = t.TrackId
    JOIN
        Genre g
        ON
            g.GenreId = t.GenreId
WHERE
    g.Name = "Blues"
GROUP BY
    year_, g.Name
ORDER BY
    total_quant DESC 
;