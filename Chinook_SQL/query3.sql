-- 3 What were the 5 most sold songs (with artist) in terms of values?
SELECT
    t.Name || " - " || ar.Name AS Music_Artist
  , SUM(il.Quantity * il.UnitPrice) AS total_val
FROM
    Track t
    JOIN InvoiceLine il
        ON t.TrackId = il.TrackId
    JOIN Album al
        ON al.AlbumId = t.AlbumId
    JOIN Artist ar
        ON ar.ArtistId = al.ArtistId
GROUP BY
	t.Name
ORDER BY
	total_val DESC 
LIMIT 5;
