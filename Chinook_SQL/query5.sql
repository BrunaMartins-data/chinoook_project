-- 5 Which 5 tracks of the Brazilian genre were the most sold(quantity and value)? What are the artists on these tracks?
SELECT
    t.Name AS music
  , ar.Name AS artist_
  , SUM(il.Quantity) AS total_quant
  , SUM(il.Quantity * il.UnitPrice) AS total_val
FROM
    Track t
    JOIN
        InvoiceLine il
        ON
            il.TrackId = t.TrackId
    JOIN
        PlaylistTrack pt
        ON
            pt.TrackId = il.TrackId
    JOIN
        Playlist p
        ON
            p.PlaylistId = pt.PlaylistId
    JOIN
        Album al
        ON
            al.AlbumId = t.AlbumId
    JOIN
        Artist ar
        ON
            ar.ArtistId = al.ArtistId
WHERE
    p.Name = "Brazilian Music"
GROUP BY
    t.Name, ar.Name
ORDER BY
    total_quant DESC, total_val DESC
LIMIT 5
;