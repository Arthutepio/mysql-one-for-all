SELECT c.nome_cancao AS 'nome',
	     COUNT(h.id_cancao) 'reproducoes'
FROM SpotifyClone.cancao AS c
INNER JOIN SpotifyClone.historico AS h ON c.id_cancao = h.id_cancao
INNER JOIN SpotifyClone.usuario AS u ON u.id_usuario = h.id_usuario
INNER JOIN SpotifyClone.plano AS p ON p.id_plano = u.id_plano
WHERE p.tipo_plano = 'gratuito' OR p.tipo_plano = 'pessoal'
GROUP BY c.id_cancao
ORDER BY nome;