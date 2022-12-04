SELECT c.nome_cancao AS "cancao",
	   COUNT(h.id_cancao) "reproducoes"
FROM SpotifyClone.cancao AS c
INNER JOIN SpotifyClone.historico AS h ON c.id_cancao = h.id_cancao
GROUP BY c.nome_cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;