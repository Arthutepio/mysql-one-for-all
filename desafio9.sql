SELECT COUNT(*) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h ON u.id_usuario = h.id_usuario
WHERE u.nome_usuario = 'Barbara Liskov';