--8 What is the total for rock songs purchased for each month in every year (2009-2013)? Mean analysis made on python
SELECT
    strftime("%m", i.InvoiceDate) AS month_
  , strftime("%Y", i.InvoiceDate) AS year_
  , SUM(il.Quantity) AS total_quant
FROM
    Invoice i
	JOIN InvoiceLine il
		ON il.InvoiceId = i.InvoiceId 
	JOIN Track t
		ON il.TrackId = t.TrackId 
	JOIN Genre g
		ON g.GenreId = t.GenreId 
WHERE 
	g.Name = "Rock"
GROUP BY
   month_, year_
ORDER BY
    year_
;