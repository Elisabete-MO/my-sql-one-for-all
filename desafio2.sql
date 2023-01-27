SELECT max(t1.id_song) AS 'cancoes', max(t3.id_artist) AS 'artistas', max(t2.id_album) AS 'albuns' 
FROM SpotifyClone.song_tb t1
INNER JOIN SpotifyClone.album_tb t2 ON t1.id_album = t2.id_album
INNER JOIN SpotifyClone.artist_tb t3 ON t2.id_artist = t3.id_artist;