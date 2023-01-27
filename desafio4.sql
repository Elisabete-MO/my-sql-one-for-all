SELECT t1.name_user AS 'usuario', IF(year(max(t2.play_history)) > 2020, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.user_tb t1
INNER JOIN SpotifyClone.history_tb t2 ON t1.id_user = t2.id_user
GROUP BY t1.name_user
ORDER BY t1.name_user;