--1 How much rock sales in the USA per year?

SELECT
    strftime("%Y", i.InvoiceDate) AS year_
  , g.Name AS name
  , i.BillingCountry AS country_ 
  , SUM(il.Quantity) as quantity_of_music
FROM
    Invoice i
    JOIN InvoiceLine il
        ON il.InvoiceId = i.InvoiceId
    JOIN Track t
        ON t.TrackId = il.TrackId		
    JOIN Genre g
        ON g.GenreId = t.GenreId
WHERE
    g.Name = "Rock" AND i.BillingCountry = "USA"
GROUP BY
    year_
  , i.BillingCountry
  , g.Name
ORDER BY
	quantity_of_music DESC
;