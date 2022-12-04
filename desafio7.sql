SELECT ar.nome_artista AS 'artista',
	     al.nome_album AS 'album',
       COUNT(s.id_artista) AS 'seguidores'
FROM SpotifyClone.artista AS ar
INNER JOIN SpotifyClone.album AS al ON ar.id_artista = al.id_artista
INNER JOIN SpotifyClone.seguindo_artista AS s ON s.id_artista = al.id_artista
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC;