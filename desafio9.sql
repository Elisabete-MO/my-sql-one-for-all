SELECT count(t2.id_song) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.user_tb t1
INNER JOIN SpotifyClone.history_tb t2 ON t1.id_user = t2.id_user
WHERE t1.name_user = 'Barbara Liskov';