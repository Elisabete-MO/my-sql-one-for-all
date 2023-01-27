SELECT t1.name_user AS 'usuario', count(t2.id_song) AS 'qt_de_musicas_ouvidas', round(sum(t3.duration_song_s)/60, 2) AS 'total_minutos'
FROM SpotifyClone.user_tb t1
INNER JOIN SpotifyClone.history_tb t2 ON t1.id_user = t2.id_user
INNER JOIN SpotifyClone.song_tb t3 ON t2.id_song = t3.id_song
GROUP BY t1.name_user
ORDER BY t1.name_user;