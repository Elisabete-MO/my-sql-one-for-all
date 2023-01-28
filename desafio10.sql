SELECT t3.title_song AS 'nome', count(t1.id_user) AS 'reproducoes'
FROM SpotifyClone.history_tb t1
INNER JOIN SpotifyClone.user_tb t2 ON t1.id_user = t2.id_user
INNER JOIN SpotifyClone.song_tb t3 ON t1.id_song = t3.id_song
INNER JOIN SpotifyClone.plan_tb t4 ON t2.id_plan = t4.id_plan
WHERE t4.name_plan = 'gratuito' OR t4.name_plan = 'pessoal'
GROUP BY t3.title_song
ORDER BY t3.title_song ASC;