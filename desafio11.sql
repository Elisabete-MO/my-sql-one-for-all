SELECT t1.title_song AS 'nome_musica', CASE
	WHEN t1.title_song LIKE '%Bard%' THEN replace(t1.title_song, 'Bard', 'QA')
	WHEN t1.title_song LIKE '%Amar%' THEN replace(t1.title_song, 'Amar', 'Code Review')
	WHEN t1.title_song LIKE '%Pais%' THEN replace(t1.title_song, 'Pais', 'Pull Requests')
	WHEN t1.title_song LIKE '%SOUL%' THEN replace(t1.title_song, 'SOUL', 'CODE')
	WHEN t1.title_song LIKE '%SUPERSTAR%' THEN replace(t1.title_song, 'SUPERSTAR', 'SUPERDEV')
    ELSE t1.title_song
END AS 'novo_nome' 
FROM SpotifyClone.song_tb t1
WHERE t1.title_song LIKE '%Bard%' OR t1.title_song LIKE '%Amar%' OR t1.title_song LIKE '%Pais%' OR t1.title_song LIKE '%SOUL%' OR t1.title_song LIKE '%SUPERSTAR%'
ORDER BY t1.title_song DESC;