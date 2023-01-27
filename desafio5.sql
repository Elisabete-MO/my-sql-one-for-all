SELECT t2.title_song AS 'cancao', count(t1.id_user) AS 'reproducoes'
FROM SpotifyClone.history_tb t1
INNER JOIN SpotifyClone.song_tb t2 ON t1.id_song = t2.id_song 
GROUP BY t2.title_song
ORDER BY count(t1.id_user) DESC, t2.title_song
LIMIT 2;