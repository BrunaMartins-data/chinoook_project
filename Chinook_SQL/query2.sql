-- 2 For each year, which were the 5 most cities that buyed and how much in dolars.
SELECT
    year_
  , BillingCity AS city_
  , total_
FROM(
		SELECT 
			year_
		  , BillingCity
	      , total_
		  , row_number() OVER(PARTITION BY year_ ORDER BY total_ DESC) AS row_num
		FROM( 
				SELECT 
					strftime("%Y", InvoiceDate) AS year_
				  , BillingCity
				  , SUM(Total) AS total_ 
				FROM 
					Invoice
				GROUP BY
					year_
				  , BillingCity
			 ) AS select_de_dentro) AS select_intermediario
		WHERE row_num = 1
		ORDER BY total_ DESC;