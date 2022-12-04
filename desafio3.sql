SELECT u.nome_usuario AS usuario,
	   COUNT(h.id_usuario) AS "qt_de_musicas_ouvidas",
       (ROUND(SUM(c.duracao_segundo) /60, 2)) AS "total_minutos"
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h ON u.id_usuario = h.id_usuario
INNER JOIN SpotifyClone.cancao AS c ON c.id_cancao = h.id_cancao
GROUP BY usuario
ORDER BY usuario;