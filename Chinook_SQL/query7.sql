-- 7 What is the percentage of consumption for each gender
WITH t1 AS
    (
        SELECT
            g.Name           AS genre_
          , SUM(il.Quantity) AS quantity_
		  , "DUMMY" AS dummy_column
        FROM
            InvoiceLine il
            JOIN
                Track t
                ON
                    t.TrackId = il.TrackId
            JOIN
                Genre g
                ON
                    g.GenreId = t.GenreId
		GROUP BY 
			genre_
		ORDER BY 
			genre_
    )
	
SELECT
	genre_, 
	ROUND(quantity_ / CAST(SUM(quantity_) OVER(PARTITION BY dummy_column) AS FLOAT), 3)*100 AS percentage_

FROM t1
ORDER BY percentage_ DESC 
;