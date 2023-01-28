SELECT t1.name_artist AS 'artista', t2.name_album AS 'album'
FROM SpotifyClone.artist_tb t1
INNER JOIN SpotifyClone.album_tb t2 ON t1.id_artist = t2.id_artist
WHERE t1.name_artist = 'Elis Regina'
ORDER BY t2.name_album;