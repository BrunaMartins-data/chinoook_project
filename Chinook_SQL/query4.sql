-- 4 For each genre, which employee sold the most and how much?
SELECT
	genre_
  , employee_
  , total_
FROM(
		SELECT 
			genre_
		  , employee_
	      , total_
		  , row_number() OVER(PARTITION BY genre_ ORDER BY total_ DESC) AS row_num
		FROM( 
				SELECT 
					g.Name AS genre_
				  , e.FirstName || " " || e.LastName AS employee_
				  , ROUND(SUM(il.Quantity * il.UnitPrice), 2) AS total_
				FROM Genre g
					JOIN Track t
						ON t.GenreId = g.GenreId
					JOIN InvoiceLine il
						ON t.TrackId = il.TrackId
					JOIN Invoice i
						ON i.InvoiceId = il.InvoiceId 
					JOIN Customer c
						ON i.CustomerId = c.CustomerId 
					JOIN Employee e 
						ON e.EmployeeId = c.SupportRepId
				
				GROUP BY
					employee_, genre_
			 ) AS select_de_dentro) AS select_intermediario
		WHERE row_num = 1
		ORDER BY total_ DESC;