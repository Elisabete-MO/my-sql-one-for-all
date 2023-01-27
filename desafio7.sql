SELECT t1.name_artist AS 'artista', t2.name_album AS 'album', count(t3.id_user) AS 'seguidores'
FROM SpotifyClone.artist_tb t1
INNER JOIN SpotifyClone.album_tb t2 ON t1.id_artist = t2.id_artist
INNER JOIN SpotifyClone.user_artist_tb t3 ON t1.id_artist = t3.id_artist
GROUP BY t1.name_artist, t2.name_album
ORDER BY count(t3.id_user) DESC, t1.name_artist, t2.name_album;