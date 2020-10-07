-- 10 What are the 5 most consumed playlists?
SELECT
    p.Name         	   AS name
  , SUM(il.Quantity) AS total_quant
FROM
    Playlist p
    JOIN PlaylistTrack pt
        ON pt.PlaylistId = p.PlaylistId
    JOIN Track t
        ON t.TrackId = pt.TrackId
    JOIN InvoiceLine il
        ON il.TrackId = t.TrackId
GROUP BY
    p.Name
ORDER BY
    total_quant DESC
LIMIT 5;
;